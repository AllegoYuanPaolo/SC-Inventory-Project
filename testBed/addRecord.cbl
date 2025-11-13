       identification division.
       program-id. addRecord.

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
               
               01 in-Record.
                   02 inName pic x(20).
                   02 inStock pic 9(2).

       procedure division.
       
           display "=== Add new Mobile Suit ==="
           display "----------------------------"
           display "Enter Mobile Suit Name: " with no advancing
           accept inName

           display "Enter Mobile Suit Stock: " with no advancing
           accept inStock

               open i-o recordFile
                       if recordStat not = "00" *> not okay
                           display "ERROR Opening! Error: " recordStat
                           call "openFileCheck" using recordStat
                           exit program 
                       end-if.
                       
                       if recordStat = "35" *> if file missing
                           display "File not found. Creating File"
                           open output recordFile
                           close recordFile
                           open i-o recordFile
                       else
                           call "readRRN" using RRN *>get and assign RRN
                         call "getDate" using timeReceived, dateReceived
                           move inName to MSName
                           move inStock to MSStock
                           
                           write MS-Record
                               invalid key 
                                  display "Error: " RRN " already exist"
                                  exit program 
                           end-write
                           call "updateRRN" *> next RRN is +1 from now
                       end-if.
                       read recordFile key is RRN
                           invalid key
                               display  "Writing failed"
                           not invalid key *> display successful add
                             display "Name: " MSName "| Stock: " MSStock
                       end-read
               close recordFile

       exit program.
       