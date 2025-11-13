       identification division.
       program-id. viewRecord.

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
               
               01 eof pic x value "N".

               01 recordStat pic xx.

               01 header.
                   02 header-ID pic x(2) value "ID".
                   02 nfill pic x(6) value spaces.
                   02 header-Name pic x(7) value "MS Name".
                   02 nfill2 pic x(7) value spaces.
                   02 header-Stock pic x(5) value "Stock".
                   02 header-Date pic x(13) value "Date Received".
                   02 header-Time pic x(13) value "Time Received".
               
               01 header-title-space pic x(18) value spaces.
               01 dispRecord.
                   02 dispRRN pic ZZ9.
                   02 dispName pic x(20).
                   02 dispStock pic Z9.
       procedure division.
           
           display header-title-space with no advancing
           display "=== Mobile Suit Stocks ===" header-title-space

             display "-----------------------" with no advancing
             display "---------------------------------------"
           
           open input recordFile
                   if recordStat not = "00" *> check for opening
                       display "Error opening record file"
                       display "Error: " recordStat
                       call "openFileCheck" using recordStat
                       exit program
                   end-if.
           
           move "N" to eof
           display header-ID " |" nFill header-Name with no advancing
           display nfill2 with no advancing
           display " |" header-Stock "| " header-Date with no advancing
           display "| " header-Time "|"
             display "-----------------------" with no advancing
             display "---------------------------------------"
             
       *> Method to read an INDEXED file sequentially
       *> aka displaying all items
       
           *> Points to the very start of the file
           move 1 to RRN
           start recordFile key is NOT LESS THAN RRN

           perform until eof = "Y"
               *> reads the next record as long as it's not EOF
               read recordFile next record 
                       at end
                           move "Y" to eof *> end of file
                       not at end
           display "#" RRN "| " MSName with no advancing
           display "|  " MSStock " |" with no advancing
           display "  " dateReceived "  |   " timeReceived "   |"
           display "-----------------------" with no advancing
           display "---------------------------------------"
                           
               end-read
           end-perform. 
           
           close recordFile

       exit program.
