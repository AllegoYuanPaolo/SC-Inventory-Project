$set sourceformat"free"
        IDENTIFICATION DIVISION.
        PROGRAM-ID. mainMenu.
 
        DATA DIVISION.
            local-STORAGE SECTION.
           01 choice pic xx.
           01 resetChoice pic xx.
        PROCEDURE DIVISION.
        
           perform with test after until exit
                call 'SYSTEM' using 'cls'
                display "       Sugar Crafts Inventory Management System"
                display "[1] - Restock Items"
                display "[2] - View Inventory"
                display "[3] - Search Item"
                display "[4] - Withdraw Stock"
                display "[5] - View Requests"
                *>display "[6] - Reset Files[Devs only]"
     
                display "[00] - Exit Program"
                display " >" no advancing
                accept  choice
                
                  evaluate choice
                     when "00"
                         exit perform
                     when "1"
                         call 'SYSTEM' using 'cls'
                         call "addStocks"
                         call 'SYSTEM' using 'pause'
                     when "2"
                         call 'SYSTEM' using 'cls'
                         call "viewInventory"
                         call 'SYSTEM' using 'pause'
                     when "3"
                         call 'SYSTEM' using 'cls'
                         call "searchRecord"
                         call 'SYSTEM' using 'pause'
                     when "4"
                         call 'SYSTEM' using 'cls'
                         call "requestStocks"
                         call 'SYSTEM' using 'pause'
                     when "5"
                         call 'SYSTEM' using 'cls'
                         call "viewRequests"
                         call 'SYSTEM' using 'pause'
                     *>when "6"
                     *>      perform resetCalls
                     when other
                         call 'SYSTEM' using 'cls'
                         display "Enter valid choices!"
                         display "Press any key to continue"
                         accept omitted
                         call 'SYSTEM' using 'pause'
                end-evaluate

                
     


           end-perform


       stop run.


           resetCalls.
           perform until exit
               display "   RESET MENU"
               display ">UNAUTHORIZED USE OF THESE PROGRAMS IS PROHIBITED<"

               display "[1] - Reset Inventory"
               display "[2] - Reset Requests"
               display "[00] - Exit Reset Menu"
               display ">"no advancing
               accept resetChoice

               evaluate resetChoice
                   when "1"
                        call 'SYSTEM' using 'cls'
                        call "resetInventory"
                        call 'SYSTEM' using 'pause'
                   when '2'
                       call 'SYSTEM' using 'cls'
                         call "resetRequests"
                         call 'SYSTEM' using 'pause'
                   when "00"
                       exit perform 
                   when other
                       display "Invalid Choice [1 or 2 only]"
                       display "Press any key to continue..."
                       accept omitted
           end-perform.