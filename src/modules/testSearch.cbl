        $set sourceformat"free"
        IDENTIFICATION DIVISION.
        PROGRAM-ID. testSearch.
       environment division.
           input-output section.
               file-control.
                  copy "Inventory".

        DATA DIVISION.
           file section.
               copy "Inventory-rec".
            WORKING-STORAGE SECTION.
            01 InvStat pic xx.

            01 foundflag pic 9 value 0.
            01 eof pic x value 'n'.

           01 foundITR pic 9(2) value 1.
       
           LINKAGE SECTION.
           01 foundCount pic 9(2).

              01 foundRecord. 
               02 foundTable occurs 10 times.
                   03 foundName pic x(25).
                   03 foundStock pic Z,ZZ9.
                   03 foundRestock pic x(25).      
            01 searchKey pic x(25).

        PROCEDURE DIVISION using searchKey foundRecord foundCount.
       
       *> set the searchKey to the key (itemName)
        move searchKey to itemName
        
        open i-o Inventory
          call "openFileCheck" using InvStat

          read Inventory key is itemName
               *> Starts linear search if only partial key
               invalid key
                   *> initialize the flags
                   move 'n' to eof
                   move 0 to foundflag
                   
                   perform  until eof = 'y'
                       move 0 to foundflag *> Resets foundFlag every iteration
                       read Inventory next record
                           at end
                               move 'y' to eof
                           not at end
                               *> checks for matches and updates foundFlag if found
                              
                               
                           if foundflag > 0 and foundITR <= 10
                               move itemName to foundName(foundITR)
                               move itemStock to foundStock(foundITR)
                               
                               add 1 to foundITR 
                               add 1 to foundCount
                           end-if
                   end-perform
                   
                   *> Display how many results found
                   if foundCount = 0
                       display "No records found matching: " searchKey
                   else
                       display "Results found: " foundCount
                       display "=================="
                   end-if


                   *> Display results
                   *> Reset foundITR to traverse
                   move 1 to foundITR
                   perform until foundITR > foundCount
                       if foundName(foundITR) not = spaces
                           display "Result " foundITR " | "
                                   foundName(foundITR) " | "
                                   foundStock(foundITR) " | "
                           *>add 1 to foundCount
                           add 1 to foundITR *> traverse table
                       else
                           exit perform 
                       end-if
                   end-perform
                       

               *> Found by index search
               not invalid key
                   display "Found: " itemName
                   display itemName " | " itemStock
                   
                   move itemName to foundName(foundITR)
                   move itemStock to foundStock(foundITR)
                   move 1 to foundCount

          end-read

          
        close Inventory
        
       exit program.
