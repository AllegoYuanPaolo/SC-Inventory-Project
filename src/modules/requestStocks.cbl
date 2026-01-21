$set sourceformat"free"
        IDENTIFICATION DIVISION.
        PROGRAM-ID. requestStocks.
 
       environment division.

        DATA DIVISION.
           LOCAL-STORAGE SECTION.
               01 input-rec.
                   02 input-Table occurs 10 times.
                       03 input-ID pic 9(5).
                       03 input-ItemTable occurs 10 times.
                           04 input-Item pic x(25).
                           04 input-Quantity pic 9(4).
                       03 input-Requestor pic x(25).
                       03 input-Date pic x(10).
                       03 input-Time pic x(8).
               
               01 addAnotherItem pic x.
               01 addAnotherReq pic x.

               01 process-Rec.
                   02 process-table occurs 10 times.
                       03 process-ItemTable occurs 10 times.
                           04 process-Item pic x(25).
                           04 process-Quantity pic 9(4).
               
               01 requestCtr pic 99 value 1. *> counter for traversing the requests
               01 itemCtr pic 99 value 1. *> counter to traversing each items in the requests
           
               
               01 foundRecord. *> Table for test search
                   02 foundTable occurs 10 times.
                       03 foundName pic x(25).
                       03 foundStock pic z,zz9.
               01 foundCount pic 9(2) value 0.
               01 choice pic 99. *> input to choose which found item
        
             
        PROCEDURE DIVISION.
           perform with test after varying requestCtr from 1 by 1 until requestCtr > 10 or addAnotherReq = 'n'
               display "   Request Stocks"
               display spaces
               
               display "Department: " no advancing
               accept input-Requestor(requestCtr)
               
               call "getRequestID" using input-ID(requestCtr)
               call "getDate" using input-Time(requestCtr), input-Date(requestCtr)       
    
               perform with test after varying itemCtr from 1 by 1 until itemCtr > 10 or  addAnotherItem = 'n' 
                   call "SYSTEM" using "cls"
                   move spaces to foundRecord
                   move zero to foundCount
                   
                   display "Enter item name to search: " no advancing
                   accept process-Item(requestCtr itemCtr)

                   if function trim(process-Item(requestCtr itemCtr)) = spaces
                       display "Input cannot be blank!"
                       continue
                   end-if
                   

                   call "testSearch" using process-Item(requestCtr itemCtr) foundRecord foundCount
                   
                   if foundCount not = 0
                       display spaces
                       *> Prompt user to choose from the full names
                       display "Confirm item to request:"
                       display "[Enter number] >" no advancing
                       accept choice
    
                       display spaces
    
                       if choice not = 0
                       *> Display selected item for clarity
                           display "Item: " foundName(choice)
                           move foundName(choice) to process-Item(requestCtr itemCtr)
                           display "Current Stock: " foundStock(choice)
                           display spaces
                           
                       *> Input request amount
                           display "Quantity to request: " no advancing
                           accept process-Quantity(requestCtr itemCtr)
                       
                       *> Copy the values from process table into input table
                           move process-Item(requestCtr itemCtr) to input-Item(requestCtr itemCtr)
                           move process-Quantity(requestCtr itemCtr) to input-Quantity(requestCtr itemCtr)
                           
                           *> reset the item Counter
                           if itemCtr > 10
                               move 1 to itemCtr
                           end-if
                           
                           *> Prompt the user if they want to add more items
                           display "Do you want to add more items? [y/n] >" no advancing
                           accept addAnotherItem
            
                           move function trim(function lower-case(addAnotherItem)) to addAnotherItem
                           if addAnotherItem = space
                                display "Choice cannot be empty! Continuing..."
                                display "Press any key to continue"
                                accept omitted
                           end-if
                           
                       end-if
    
                   end-if
    
                   
    
               end-perform
               
               *> Prompt user if they want to add more requests
               display "Do you want make another request? [y/n] >" no advancing
               accept addAnotherReq

               move function trim(function lower-case(addAnotherReq)) to addAnotherReq
               if addAnotherReq = spaces
                   display "Choice cannot be empty! Continuing..."
                   display "Press any key to continue"
                   accept omitted
               end-if


           end-perform
               

               *> Display the current input
               perform varying requestCtr from 1 by 1 until requestCtr > 10
                   if input-ID(requestCtr) not = 0
                       display "Request ID: " input-ID(requestCtr)
                       display "Requestor: " input-Requestor(requestCtr)
                       display "Date and time requested: " input-Date(requestCtr) " | " input-Time(requestCtr)
                       display "Items Requested: "
                       perform varying itemCtr from 1 by 1 until itemCtr > 10 
                           if input-Item(requestCtr itemCtr) not = space 
                               display input-Item(requestCtr itemCtr) " | " input-Quantity(requestCtr itemCtr)
                           end-if
                       end-perform
                   end-if
               end-perform
               
               *> Process the input records 
               call "writeRequestRecord" using input-Rec
               call "subtractInventory" using process-Rec
          

       
       exit program.