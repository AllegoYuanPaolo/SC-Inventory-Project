$set sourceformat"free"

        IDENTIFICATION DIVISION.
        PROGRAM-ID. viewRequests.

        environment division.
           input-output section.
               file-control.
                   copy "Request".
 
        DATA DIVISION.
           file section.
               copy "Request-rec".
            WORKING-STORAGE SECTION.

            01 exitFlag pic x.
            01 itemCtr pic 99.
        
        PROCEDURE DIVISION.

        open input Requests   
        move 'n' to exitFlag

        perform until exitFlag = 'y'
           read Requests next record
               at end
                   move 'y' to exitFlag
                   display "No more data to show"
               not at end
                   if requestID not = zeros
                       display "REQUEST ID: " requestID
                       display "Requestor: " requestor
                       display "Date and time requested: " requestDate " | " requestTime
                       display "Items Requested: "
                       
                       perform varying itemCtr from 1 by 1 until itemCtr > 10 
                           if function trim(requestItem(itemCtr)) = 'none'
                               continue
                           else
                               display requestItem(itemCtr) " | " requestQuantity(itemCtr)
                           end-if
                       end-perform

                        

                       
                       display spaces
                   end-if
           end-read
        end-perform
        close Requests
       STOP RUN.
