        IDENTIFICATION DIVISION.
        PROGRAM-ID. writeRequestRecord.

        environment division.
           input-output section.
               file-control.
                   copy "Request".
 
        DATA DIVISION.
           file section.
               copy "Request-rec".
            WORKING-STORAGE SECTION.
               01 ctr pic 99 pic 1.
           linkage section.
               01 input-rec.
                   02 input-Table occurs 10 times.
                       03 input-ID pic 9(5).
                       03 input-Item pic x(25).
                       03 input-Quantity pic 9(4).
                       03 input-Requestor pic x(25).
                       03 input-Date pic x(10).
                       03 input-Time pic x(8).
                   
        PROCEDURE DIVISION using input-rec.
           open i-o Requests
               if input-Item(ctr) not = spaces
                   call "getRequestID" using input-ID
                   call "getDate" using input-Time(ctr), input-Date(ctr)
                   
                   move input-rec to Requests-rec
                   write Requests-rec
                   call "updateRequestID"
               end-if 
               
           close Requests
       STOP RUN.
 