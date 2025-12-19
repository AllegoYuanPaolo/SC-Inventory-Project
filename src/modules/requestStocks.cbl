        IDENTIFICATION DIVISION.
        PROGRAM-ID. requestStocks.
 
       environment division.
           input-output section.
               file-control.
                   select Requests
                       assign to "data/Requests.dat"
                       organization is indexed
                       access mode is dynamic
                       record key is requestID
                       file status is ReqStat

                   copy "Inventory".

        DATA DIVISION.
           FILE section.
           copy "Inventory-rec".
            fd Requests.
                   01 Requests-rec.
                       02 requestID pic 9(5).
                       02 requestItem pic x(25).
                       02 requestQuantity pic 9(4).
                       02 requestor pic x(25)
                       02 requestDate pic x(10).
                       02 requestTime pic x(8).

            WORKING-STORAGE SECTION.
               01 input-rec.
                   02 input-ID pic 9(5).
                   02 input-Item pic x(25).
                   02 input-Quantity pic 9(4).
                   02 input-Requestor pic x(25).
                   02 input-Date pic x(10).
                   02 input-Time pic x(8).
                   
        PROCEDURE DIVISION.
           
       STOP RUN.
 