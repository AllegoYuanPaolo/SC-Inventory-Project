      $set sourceformat"free"
      
        IDENTIFICATION DIVISION.
        PROGRAM-ID. addStocks.
        
        environment division.
           input-output section.
               file-control.
                    select Inventory
                       assign to "data\Inventory.dat"
                       organization is indexed
                       access mode is dynamic
                       record key is itemName
                       file status is InvStat.
 
        DATA DIVISION.
            file section.
                fd Inventory. 
                  01 invRec.
                   02 itemName pic x(25).
                   02 itemStock pic 9(4).
                   02 dateReceived pic x(10).
                   02 timeReceived pic x(8).
                   02 restockStatus pic x(25).
            WORKING-STORAGE SECTION.
           01 Invstat pic xx.
           01 searchKey pic x(25).
           01 RestockAmount pic 9(4).
           01 choice pic 99.

            01 foundRecord. 
               02 foundTable occurs 10 times.
                   03 foundName pic x(25).
                   03 foundStock pic Z,ZZ9.
                   03 foundRestock pic x(25).   

           01 foundCount pic 9(2) value 0.

        PROCEDURE DIVISION.
           display "Enter Item name to restock: " no advancing
           accept searchKey

           call "testSearch" using  searchKey foundRecord foundCount

           if foundCount not = 0
               display spaces
               display "Select item to restock:"
               display "[Enter number] >" no advancing
               accept choice

               display spaces 
               if choice not = 0
                   display "Item         : " foundName(choice) "|"
                   display "Current stock: " foundStock(choice)
                   display spaces
                   display "Restock Amount: " no advancing
                   accept RestockAmount
                   
                   open i-o Inventory
                   move foundName(choice) to itemName
                       read Inventory key is itemName
                           invalid key
                               display "Update failed"
                   
                           not invalid key
                               compute RestockAmount = RestockAmount + itemStock
                               move RestockAmount to itemStock
                               rewrite invRec
                                   invalid key
                                       display "Failure code: " Invstat
                                   not invalid key
                                        display "Updated: "
                                        display itemName " | " itemStock
                       end-read
                   close Inventory

               end-if

           end-if
           
           

       exit program.
 