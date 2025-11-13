       identification division.
       program-id. updateRecord.

       environment division.
           input-output section.
           file-control.
                  select recordFile
                       assign to "MS-Record.dat"
                       organization is indexed
                       record key is RRN
                       alternate key is MSName
                       access mode is dynamic
                       file status is recordStat.

                     
       data division.
           file section.

           fd recordFile.
           01 MS-Record.
               02 RRN pic 9(3).
               02 MSName pic x(20).
               02 MSStock pic 9(2).

          
           working-storage section.
            01 recordStat pic xx.
           
            01 searchName pic x(20).

            01 updRecord.
               02 updName pic x(20).
               02 updStock pic 9(2).

       procedure division.
           display " === Update Records === "
           display "Enter name (name to update): " with no advancing
           accept searchName
               
           move searchName to MSName    
           
           open i-o recordFile
                 
                  if recordStat not = "00"
                       display "Error opening: " recordStat
                       call "openFileCheck" using recordStat
                       exit program 
                   end-if.

               read recordFile key is MSName
                   invalid key *> If not exact or not found at all
                       display "Record not found" 
                       exit program
                   not invalid key
                   
                   *> Dispaly old name
                   display "Record Name: " MSName "| Stock: " MSStock
                   display "Current Name: " MSName

                   *> input new name
                   display "Updated Name: " with no advancing
                   accept updName
                   
                   move updName to MSName

                   rewrite MS-Record *> updates name
                       invalid key *> checks is write successful
                           display "Error updating record"
                       not invalid key
                           display "Name: " MSName 
                    end-rewrite
              end-read         
           
           close recordFile

       exit program.
