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
               01 ctr pic 99 value 1.
           linkage section.
               01 process-Rec.
                   02 process-table occurs 10 times.
                       03 process-Item pic x(25).
                       03 process-Quantity pic 9(4).
        PROCEDURE DIVISION using  process-Rec.
               open i-o Inventory
 
                  perform until process-Item(ctr) = spaces
 
                       move process-Item(ctr) to itemName
                       
                       read Inventory key is itemName
                           invalid key
                               display "Item not found"
                           
                           not invalid key
                               compute itemStock = itemStock - process-Quantity(ctr)
                               
                               rewrite invRec
                               add 1 to ctr
                       end-read
 
                   end-perform
 
               close Inventory
       exit program.
 