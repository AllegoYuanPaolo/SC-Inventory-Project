   $set sourceformat"free"
        IDENTIFICATION DIVISION.
        PROGRAM-ID. viewInventory.
       
       environment division.
               input-output section.
               file-control.
                   copy "Inventory".
                   
        DATA DIVISION.
           file section.
               copy "Inventory-rec".

            WORKING-STORAGE SECTION.
            01 InvStat pic xx. 
            01 eof pic x value "n".
            01 ctr pic 99 value 1.
        
        PROCEDURE DIVISION.
           open input Inventory
               call "writeFileCheck" using InvStat
           
               perform until eof = "y"
                   read Inventory next record
                       at end 
                           move 'y' to eof
                       not at end
                           call "SafeStockCheck" using itemName itemStock restockStatus
                           rewrite invRec
                           
                           display "#"ctr"| " itemName no advancing
                           display "| " itemStock "| " no advancing
                           display "| " dateReceived "| " timeReceived "| " restockStatus "|"
                           add 1 to ctr
                   end-read
               end-perform 

           close Inventory
       
       exit program.
 