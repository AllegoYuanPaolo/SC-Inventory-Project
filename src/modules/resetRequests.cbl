        IDENTIFICATION DIVISION.
        PROGRAM-ID. resetRequests.
        
        environment division.
           input-output section.
               file-control.
                   select Requests
                       assign to "data/Requests.dat"
                       organization is indexed
                       access mode is dynamic
                       record key is requestID
                       file status is ReqStat.
                  

        DATA DIVISION.
           file section.
              fd Requests.
                   01 Requests-rec.
                       02 requestID pic 9(5).
                       02 requestItem pic x(25).
                       02 requestQuantity pic 9(4).
                       02 requestor pic x(25)
                       02 requestDate pic x(10).
                       02 requestTime pic x(8).
                   

            WORKING-STORAGE SECTION.
               


        PROCEDURE DIVISION.
           display "Resetting inventory"     
           
           open output Requests
           close Requests
    
           display "Requests "
        
       STOP RUN.
 