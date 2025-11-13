       >> source format free
       identification division.
       program-id. searchRecord.

       environment division.
               input-output section.
               file-control.

                   select recordFile
                        assign to "MS-Record.dat"
                       organization is indexed
                       access mode is dynamic
                       record key is RRN
                       alternate key is MSName
                       file status is recordStat.
       data division.
           file section.

           FD recordFile.
             01 MS-Record.
               02 RRN pic 9(3).
               02 MSName pic x(20).
               02 MSStock pic 9(2).
               02 dateReceived pic x(10).
               02 timeReceived pic x(8).
           
           working-storage section.
           
           01 recordStat pic xx.
           01 searchKey pic x(20).
           
           01 foundflag pic 9(1) value 0.
           01 eof-flag pic x value "N".

           01 foundRecord.
               02 foundTable occurs 10 times. 
                   03 FoundRRN pic 9(3).
                   03 FoundName pic x(20).
                   03 FoundStock pic 9(2).
              
              01 foundITR pic 9(2) value 0.

              01 borderLen pic 9(2).
    
       procedure division.
           display "    == Search Mobile Suit =="
           display "------------------------"    

           display "Enter name to search: " with no advancing
           accept searchKey
       
          move searchKey to MSName

           open i-o recordFile
                   if recordStat not = "00"
                       display "Error opening file: " recordStat
                       call "openFileCheck" using recordStat
                       exit program 
                   end-if.


               read recordFile key is MSName
                   invalid key *> If not found by key, search via Linear
                        move "N" to eof-flag *> reset flags
                       move 0 to foundFlag
                       
           *> set the first item to start from the beginning
           start recordFile key is not less than RRN
               if recordStat not = "00"
                   display "Error starting file: " recordStat
                   call "openFileCheck" using recordStat
                   exit program
               end-if

           perform until eof-flag = "Y"
               move 0 to foundflag *> reset found flag
               read recordFile next record *> start of linear search
                   at end
                       move "Y" to eof-flag
                   not at end
                 *> checks if the searchKey is part of the MSName
                 inspect MSName tallying foundflag
                 for all 
                 searchKey(1:function length(function trim(searchKey)))

                     if foundflag > 0 *> if found, store in foundTable
                        add 1 to foundITR
                           move RRN to FoundRRN(foundITR)
                           move MSName to FoundName(foundITR)
                           move MSStock to FoundStock(foundITR)
                   end-if                 
           end-perform

              if foundITR = 0 *> 0 means it never found any
                display "No records found matching: " searchKey
              else 
              *> display how many times found iterated (found results)
                   display "Results found: " foundITR
              end-if
           
           move 1 to foundITR *> reset for display loop

           perform until FoundRRN(foundITR) = zero *> until 
               if FoundRRN(foundITR) not = zero
                   display "Result #" foundITR " |" no advancing
                   display "#" FoundRRN(foundITR) "| " FoundName(foundITR) "| " FoundStock(foundITR) "|"
                   add 1 to foundITR    
               end-if
           end-perform

                   not invalid key *> If it found it by key
                       display "Record found(index):"
                       display "#" RRN "| " MSName "| " MSStock "|"
             perform border


               end-read
           close recordFile

       goback. 

       border.
           compute borderLen = (function length (RRN) + 
                                    function length(MSName) + 
                                    function length(MSStock) +
                                    4
                                    )
               perform borderLen times
                   display "-" no advancing
               end-perform
               display "+"
               display " ".
