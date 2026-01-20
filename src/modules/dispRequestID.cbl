$set sourceformat"free"
        IDENTIFICATION DIVISION.
        PROGRAM-ID. dispRequestID.

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
           
            WORKING-STORAGE SECTION.
             01 IDslot pic 9 value 1. *> Constant: always only read from 1

           
      
        PROCEDURE DIVISION.
           open input requestID
               
               read requestID key is IDslot
                   invalid key 
                       display "Missing record"
                   
                   not invalid key
                       display "Current ID: " reqID
               end-read

           close requestID
       exit program.
 