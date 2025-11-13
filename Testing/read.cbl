        IDENTIFICATION DIVISION.
        PROGRAM-ID. read.
       
       environment division.
           input-output section.
           file-control.

           select itemFile
               assign to "items.txt"
               organization is line sequential
               file status is itemStat.

        DATA DIVISION.
           file section.
               fd itemFile.
             

               01 currLine pic x(55).

            WORKING-STORAGE SECTION.
           
       
            01 itemStat pic xx .
            01 eof pic x value "n".
            01 counter pic 99 value 0. 
        
        PROCEDURE DIVISION.

           display "Reading file. . ."

           open input itemFile 
               call "openFileCheck" using itemStat
           
           perform until eof = "y"
               read itemFile
                   at end move "y" to eof
                   not at end
                       add 1 to counter
                       display currLine
                       display " "
               end-read
           end-perform
           close itemFile
           display "DEBUG| Lines: " counter
       STOP RUN.
 