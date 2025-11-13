       >>source format free
        IDENTIFICATION DIVISION.
        PROGRAM-ID. testViewInventory.
       
       environment division.
               input-output section.
               file-control.
                   select Inventory
                       assign to "data\Inventory.dat"
                        organization is indexed
                        record key is itemID
                        alternate key is itemName
                        file status is InvStat.
        DATA DIVISION.
           file section.
           fd Inventory. 
                  01 invRec.
                   02 itemID pic 9(3).
                   02 itemName pic x(25).
                   02 itemStock pic 9(4).
                   02 dateReceived pic x(10).
                   02 timeReceived pic x(8).
                   02 restockStatus pic x(25).

            WORKING-STORAGE SECTION.
            01 InvStat pic xx. 
            01 eof pic x value "n".
        
        PROCEDURE DIVISION.
           open i-o Inventory
           
           move 1 to itemID
           start Inventory key is not less than itemID
           
           perform until eof = "y"
               read Inventory next record
                   at end move 'y' to eof
                   not at end
                       call "SafeStockCheck" using itemName itemStock restockStatus
                       write restockStatus

                       display "#" itemID "| " itemName no advancing
                       display "| " itemStock "| " no advancing
                       display "| " dateReceived "| " timeReceived "| " restockStatus "|"
               end-read
           end-perform 

           close Inventory
       
       exit program.
 