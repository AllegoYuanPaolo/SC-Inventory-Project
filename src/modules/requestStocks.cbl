        IDENTIFICATION DIVISION.
        PROGRAM-ID. requestStocks.
        
        environment division.
           input-output section.
               file-control.
                   select Requests
                       assign to "data/Requests.dat"
                       organization is indexed
                       access mode is dynamic
                       record key is 
                       file status is ReqStat.
                  

        DATA DIVISION.
           file section.
              

            WORKING-STORAGE SECTION.
               


        PROCEDURE DIVISION.
        
       STOP RUN.
 