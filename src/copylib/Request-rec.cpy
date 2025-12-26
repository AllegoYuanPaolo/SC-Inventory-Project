        fd Requests.
           01 Requests-rec.
               02 requestID pic 9(5).
               02 requestItem-table occurs 10 times.
                   03 requestItem pic x(25).
                   03 requestQuantity pic 9(4).
               02 requestor pic x(25).
               02 requestDate pic x(10).
               02 requestTime pic x(8).