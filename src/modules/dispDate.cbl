        IDENTIFICATION DIVISION.
        PROGRAM-ID. dispDate.
 
        DATA DIVISION.
            local-STORAGE SECTION.
               01 dispDate pic x(8).
               01 dispTime pic x(10).
        PROCEDURE DIVISION.

           call "getDate" using dispTime dispDate
           display "Time: " dispTime
           display "Date: " dispDate
        
       exit program.
 