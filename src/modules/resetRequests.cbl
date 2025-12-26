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
           display "Resetting reqeusts records. . ."     
           
           open output Requests
           close Requests
    
           display "Requests records reset!"
        
       STOP RUN.
 