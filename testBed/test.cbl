       IDENTIFICATION DIVISION.
       PROGRAM-ID. test.
       
       ENVIRONMENT DIVISION.
           input-output section.
               file-control.
                   select recordFile
                       assign to "MS-Record.dat"
                       organization is indexed
                       access mode is dynamic
                       key is RRN
                       alternate key is MSName
                       file status is recordStat
       DATA DIVISION.
           file section.
             FD recordFile.
             01 MS-Record.
               02 RRN pic 9(3).
               02 MSName pic x(20).
               02 MSStock pic 9(2).
               02 dateReceived pic x(10).
               02 timeReceived pic x(8).

           WORKING-STORAGE SECTION.
           01 recordStat pic xx.
           01
               
       PROCEDURE DIVISION.
            display "MS-Record.dat KEY DEBUGGER"
            DISPLAY " "

            open input recordFile
               if recordStat not = "00"
                   display "Error opening file: " recordStat
                   call "openFileCheck" using recordStat
                   exit program
                end-if.
            
            read recordFile key is MSName
            close recordFile

       STOP RUN.
        