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
                   
            local-STORAGE SECTION.
            01 eof pic x value "n".
            01 ctr pic 99 value 1.
            01 dispStock pic z,zz9.


        
        PROCEDURE DIVISION.
           open i-o Inventory
              
           
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
 