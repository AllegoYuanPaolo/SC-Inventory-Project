   $set sourceformat"free"
        IDENTIFICATION DIVISION.
        PROGRAM-ID. viewInventory.
       
       environment division.
           input-output section.
             file-control.
                  copy "Inventory.cpy".
                       
        DATA DIVISION.
           file section.
               copy "Inventory-rec.cpy".
                   
            WORKING-STORAGE SECTION.
            01 eof pic x value "n".
            01 ctr pic 99 value 1.
            01 dispStock pic z,zz9.

            local-storage section.
            01 InvStat pic xx. 

        
        PROCEDURE DIVISION.
           open i-o Inventory
               call "openFileCheck" using InvStat
           
               perform until eof = "y"
                   read Inventory next record
                       at end 
                           move 'y' to eof
                       not at end
                           call "SafeStockCheck" using itemName itemStock restockStatus
                           rewrite invRec
                           move itemStock to dispStock
                           display "#"ctr"| " itemName no advancing
                           display "| " dispStock "| " no advancing
                           display "| " dateReceived "| " timeReceived "| " restockStatus "|"
                           add 1 to ctr
                   end-read
               end-perform 

           close Inventory
       
       exit program.
 