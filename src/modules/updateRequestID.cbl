        IDENTIFICATION DIVISION.
        PROGRAM-ID. updateRequestID.
       environment division.
           input-output section.
               file-control.
                   select requestID
                       assign to "data/requestID.dat"
                       organization is relative
                       relative key is counter.
        DATA DIVISION.
           file section.
               fd requestID.
                   01 reqID pic 9(5).
            WORKING-STORAGE SECTION.
            01 counter pic 9 value 1.
        
        PROCEDURE DIVISION.

           open i-o requestID
               read requestID key is counter
                   invalid key
                       display "Missing record"
                   not invalid key
                       add 1 to reqID
                       rewrite reqID
               end-read
           close requestID
        
       exit program.
 