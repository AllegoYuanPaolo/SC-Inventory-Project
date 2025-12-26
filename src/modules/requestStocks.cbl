$set sourceformat"free"
        IDENTIFICATION DIVISION.
        PROGRAM-ID. requestStocks.
 
       environment division.

        DATA DIVISION.
           FILE section.

           WORKING-STORAGE SECTION.
               01 input-rec.
                   02 input-Table occurs 10 times.
                       03 input-ID pic 9(5).
                       03 input-ItemTable occurs 10 times.
                           04 input-Item pic x(25).
                           04 input-Quantity pic 9(4).
                       03 input-Requestor pic x(25).
                       03 input-Date pic x(10).
                       03 input-Time pic x(8).
               
               01 addAnother pic x value 'y'.

               01 process-Rec.
                   02 process-table occurs 10 times.
                       03 process-Item pic x(25).
                       03 process-Quantity pic 9(4).
               
               01 ctr pic 99 value 1.
           
               *> Table for test search
               01 foundRecord.
                   02 foundTable occurs 10 times.
                       03 foundName pic x(25).
                       03 foundStock pic z,zz9.
               01 foundCount pic 9(2) value 0.
               01 choice pic 99.
        

        PROCEDURE DIVISION.
           display "   Request Stocks"
           display spaces
           
           display "Department: " no advancing
           accept input-Requestor

           perform with test after until addAnother = 'n'
               call "SYSTEM" using "cls"

               display "Items: " no advancing
               accept process-Item(ctr)
               
               call "testSearch" using process-Item(ctr) foundRecord foundCount
               
               if foundCount not = 0
                   display spaces
                   display "Confirm item to request:"
                   display "[Enter number] >" no advancing
                   accept choice

                   display spaces

                   if choice not = 0
                       display "Item: " foundName(choice)
                       move foundName(choice) to process-Item(ctr)
                       display "Current Stock: " foundStock(choice)
                       display spaces
                       display "Quantity: " no advancing
                       accept process-Quantity(ctr)

                       move process-Item(ctr) to input-Item(ctr)
                       move process-Quantity(ctr) to input-Quantity(ctr)


                   end-if
               end-if

               

               add 1 to ctr
               
               display "Do you want to add more? [y/n] >" no advancing
               accept addAnother

               move function lower-case(addAnother) to addAnother

           end-perform
               *> TODO: call "subtractInventory" using process-Rec
               *> TODO: call "writeRequestRecord" using input-Rec
           
          

       
       STOP RUN.
 