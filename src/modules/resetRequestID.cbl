        IDENTIFICATION DIVISION.
        PROGRAM-ID. resetRequestID.
        
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
                   01 reqID pic 9(4).

            WORKING-STORAGE SECTION.
               01 counter pic 9 value 1.
        PROCEDURE DIVISION.
           open output requestID
               move 1 to reqID
               write reqID               
           close requestID
       STOP RUN.
 