$set sourceformat"free"
        IDENTIFICATION DIVISION.
        PROGRAM-ID. subtractInventory.

        environment division.
           input-output section.
               file-control.
                   copy "Inventory".
 
        DATA DIVISION.
           file section.
               copy "Inventory-rec".
            WORKING-STORAGE SECTION.
           
           linkage section.
               01 process-Rec.
                   02 process-table occurs 10 times.
                       03 process-Item pic x(25).
                       03 process-Quantity pic 9(4).
        PROCEDURE DIVISION using  process-Rec.
               open i-o Inventory
                   move process-Item to itemName
                   
                   read Inventory key is itemName
                       invalid key
                           display "Item not found"
                       
                       not invalid key
                           compute itemStock = itemStock - process-Quantity
                           
                           rewrite invRec
                   end-read
               close Inventory
       exit program.
 