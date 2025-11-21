        $set sourceformat"free"
        IDENTIFICATION DIVISION.
        PROGRAM-ID. testSearch.
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
            01 InvStat pic xx.
            01 searchKey pic x(25).

            01 foundflag pic 9 value 0.
            01 eof pic x value 'n'.

            01 foundRecord. 
               02 foundTable occurs 10 times.
                   03 foundName pic x(25).
                   03 foundStock pic Z,ZZ9.
                   03 foundRestock pic x(25).
           
           01 foundITR pic 9(2) value 0.
        
        PROCEDURE DIVISION.
        display "Searchkey >" no advancing
        accept searchKey
        display "------------------------------"
        move searchKey to itemName
        
        open i-o Inventory
          call "openFileCheck" using InvStat

          read Inventory key is itemName
               invalid key
                   move 'n' to eof
                   move 0 to foundflag
                   
                   perform  until eof = 'y'
                       move 0 to foundflag
                       read Inventory next record
                           at end
                               move 'y' to eof
                           not at end
                               inspect itemName tallying foundflag
                               for all
                               searchKey(1:function length(function trim(searchKey)))
                               
                           if foundflag > 0
                               add 1 to foundITR
                               move itemName to foundName(foundITR)
                               move itemStock to foundStock(foundITR)
                           end-if
                   end-perform
                   if foundITR = 0
                       display "No records found matching: " searchKey
                   else
                       display "Results found: " foundITR
                   end-if

                   move 1 to foundITR

                   perform until foundITR = 10
                       if foundName(foundITR) not = spaces
                           display "Result #" foundITR " | "
                                   foundName(foundITR) " | "
                                   foundStock(foundITR) " | "
                           add 1 to foundITR
                       else
                           exit perform 
                       end-if
                   end-perform
                       


               not invalid key
                   display "Found: " itemName
                   display itemName " | " itemStock
          end-read

          
        close Inventory
        
       exit program.
