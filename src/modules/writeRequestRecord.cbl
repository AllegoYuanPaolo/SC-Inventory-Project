$set sourceformat"free"
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
               01 requestCtr pic 99 value 1.
               01 itemCtr pic 99 value 1.
           linkage section.
               01 input-rec.
                   02 input-Table occurs 10 times.
                       03 input-ID pic 9(5).
                       03 input-ItemTable occurs 10 times.
                           04 input-Item pic x(25).
                           04 input-Quantity pic 9(4).
                       03 input-Requestor pic x(25).
                       03 input-Date pic x(10).
                       03 input-Time pic x(8).
                   
        PROCEDURE DIVISION using input-rec.
           open i-o Requests
           
           *> Loop thru the table as long as they're not blank
               perform varying requestCtr from 1 by 1 until requestCtr > 10
                   if input-ID(requestCtr) not = zeroes

                       move input-ID(requestCtr) to requestID
                       move input-Requestor(requestCtr) to requestor
                       move input-Time(requestCtr) to requestTime
                       move input-Date(requestCtr) to requestDate
                       
                       
                      *> Reset the FD table
                       move spaces to requestItem-table(requestCtr)

                       perform varying itemCtr from 1 by 1 until itemCtr > 10
                           if input-Item(requestCtr itemCtr)  = space
                               move 'none' to requestItem(itemCtr)
                               move zeros to requestQuantity(itemCtr)
                           else
                               move input-Item(requestCtr itemCtr)     to requestItem(itemCtr)
                               move input-Quantity(requestCtr itemCtr) to requestQuantity(itemCtr)
                           end-if
                       end-perform

                      
                      
                      *> display for debugging
                      display spaces
                       display "Requestor: " requestor
                       display "Date and time requested: " requestDate " | " requestTime
                       display "Items Requested: "
                       perform varying itemCtr from 1 by 1 until itemCtr > 10 
                           if function trim(requestItem(itemCtr)) not = 'none'
                               display requestItem(itemCtr) " | " requestQuantity(itemCtr)
                           end-if
                       end-perform
                       *> --- end debug ---

                       

                       write Requests-rec
                       call "updateRequestID"
                           
                   end-if
               end-perform
               
           close Requests
       exit program.
 