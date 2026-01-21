$set sourceformat"free"
        IDENTIFICATION DIVISION.
        PROGRAM-ID. getRequestID.

        environment division.
           input-output section.
               file-control.
                   select optional requestID
                       assign to "data/requestID.dat"
                       organization is relative
                       relative key is IDslot.
 
        DATA DIVISION.
           file section.
               fd requestID.
                   01 reqID pic 9(5).
           
            local-STORAGE SECTION.
             01 IDslot pic 9 value 1. *> Constant: always only read from 1

           linkage section.
           01 currentID pic 9(5). *> return the value (ID number to the calling function)
        
        PROCEDURE DIVISION using currentID.
           open input requestID
               
               read requestID key is IDslot
                   invalid key 
                       display "Missing record"
                   
                   not invalid key
                       move reqID to currentID
               end-read

           close requestID
       exit program.
 