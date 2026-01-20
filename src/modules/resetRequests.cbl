        IDENTIFICATION DIVISION.
        PROGRAM-ID. resetRequests.
        
        environment division.
           input-output section.
               file-control.
                   copy "Request".
                  

        DATA DIVISION.
           file section.
             copy "Request-rec".
                   

            WORKING-STORAGE SECTION.
               


        PROCEDURE DIVISION.
           display "Resetting Reqeusts records and requestIDs. . ."     
           
           open output Requests
           close Requests
               
           call "resetRequestID"
           display "Requests records requestIDs reset!"

        
       STOP RUN.
 