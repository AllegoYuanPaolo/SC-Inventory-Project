        IDENTIFICATION DIVISION.
        PROGRAM-ID. getRequestID.

        environment division.
           input-output section.
               file-control.
                   select optional requestID
                       assign to "data/requestID.dat"
                       organization is relative
                       relative key is counter.
 
        DATA DIVISION.
           file section.
               fd requestID.
                   01 reqID pic 9(4).
           
            WORKING-STORAGE SECTION.
             01 counter pic 9 value 1.

           linkage section.
           01 currentID pic 99.
        PROCEDURE DIVISION uisng currentID.
           open input requestID
               
               read requestID key is counter
                   invalid key 
                       display "Missing record"
                   
                   not invalid key
                       move reqID to currentID
               end-read

           close requestID
       STOP RUN.
 