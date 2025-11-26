        $set sourceformat"free"
        IDENTIFICATION DIVISION.
        PROGRAM-ID. deleteRecord.

        environment division.
           input-output section.
               file-control.
                   copy "Inventory".
 
        DATA DIVISION.
           file section.
               copy "inventory-rec".
            WORKING-STORAGE SECTION.
           01 InvStat pic xx. 

            01 foundRecord. 
             02 foundTable occurs 10 times.
                 03 foundName pic x(25).
                 03 foundStock pic Z,ZZ9.
                 03 foundRestock pic x(25).   

           01 foundCount pic 9(2) value 0.

           01 delChoice pic x value 'n'.

           01 searchKey pic x(25).
           01 choice pic 9(2).
           

        PROCEDURE DIVISION.
           display "Enter Item name to delete: " no advancing
           accept searchKey

           call "testSearch" using  searchKey foundRecord foundCount

           *> If results are found, it will display the results with numbers
           if foundCount not = 0
               display spaces
               display "Select item to delete:"
               display "[Enter number(If exact, enter 1)] >" no advancing
               accept choice

               display spaces 

               if choice not = 0
               *> display and prompt for delete
                 display "Are you sure you want to delete item: " function trim(foundName(choice))"?"
                 display "[y/n] >" no advancing
                 accept delChoice
                   
                   if delChoice = 'y'
                       *> Open the file to allow delete
                       open i-o Inventory
                       move foundName(choice) to itemName
                           read Inventory key is itemName
                               invalid key
                                   display "Record not found, delete failed"
                       
                               not invalid key *> delete item
                                   delete Inventory
    
                           end-read
                       close Inventory
                   end-if

               end-if

           end-if
           
       exit program.
 