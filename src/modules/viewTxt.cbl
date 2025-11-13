        IDENTIFICATION DIVISION.
        PROGRAM-ID. viewTxt.
       
       environment division.
           input-output section.
               file-control.
                   
                   select txt
                       assign to "data\SafeStock.txt"
                       organization is line sequential
                       access mode is sequential
                       file status is fileStat.

        DATA DIVISION.
           file section.

           fd txt.
               01 currline pic x(128).

            WORKING-STORAGE SECTION.
           01 fileStat pic xx.
           01 eofFlag pic x value "N".
        PROCEDURE DIVISION.
           
           display "Viewing. . ."
           open input txt
           call "openFileCheck" using fileStat, txt
               
               perform until eofFlag = "Y"
                   read txt
                       at end 
                           move "Y" to eofFlag
                       not at end
                           display currline
                   end-read
               end-perform.
           close txt

       STOP RUN.
 