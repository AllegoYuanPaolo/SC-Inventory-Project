      $set sourceformat"free"
      
        IDENTIFICATION DIVISION.
        PROGRAM-ID. addStocks.
        
        environment division.
           input-output section.
               file-control.
                   copy "Inventory".
 
        DATA DIVISION.
            file section.
               copy "Inventory-rec".
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

           *> If results are found, it will display the results with numbers
           if foundCount not = 0
               display spaces
               display "Select item to restock:"
               display "[Enter number] >" no advancing
               accept choice

               display spaces 

               if choice not = 0
               *> display and prompt for restock
                   display "Item         : " foundName(choice) "|"
                   display "Current stock: " foundStock(choice)
                   display spaces
                   display "Restock Amount: " no advancing
                   accept RestockAmount
                   
                   *> Open the file to allow rewrite
                   open i-o Inventory
                   move foundName(choice) to itemName
                       read Inventory key is itemName
                           invalid key
                               display "Update failed"
                   
                           not invalid key *> update stock, as well as time and date
                               compute RestockAmount = RestockAmount + itemStock
                               move RestockAmount to itemStock
                               call "getDate" using timeReceived, dateReceived

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
 