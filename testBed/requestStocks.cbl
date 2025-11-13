       identification division.
       program-id. requestStocks.

       environment division.
           input-output section.
               file-control.
                   SELECT requestFile
		             ASSIGN TO "Requests.dat"
		             ORGANIZATION IS INDEXED
		             RECORD KEY IS requestID
		             ACCESS MODE IS DYNAMIC
		             FILE STATUS IS reqFileStat.

       data division.
           file section.
               FD requestFile
		     01 requestRecord.
       			02 requestID PIC 9(3). *> Primary key
       			02 department PIC X(32).
       			02 itemNQuant PIC X(32).
       			02 dateRequested PIC X(10). 
       			02 timeRequested PIC X(8).


           working-storage section.
               01 reqFileStat pic xx.

               01 in-Record.
                   02 inDept pic x(32).
                   02 inItem pic x(32).
                  

           

       procedure division.
           display "=== Request Form === "
           display "--------------------------------------------"
           
           display "Department: " with no advancing
           accept inDept

           display "Items to request and Quantity: "
           display "Format: Item 1, Quantity 1; Item 2, Quantity 2"
           display "> " with no advancing
           accept inItem
           
       

               open i-o requestFile
                   if reqFileStat not = "00"
                       display "Error opening! Error: " reqFileStat
                       call "openFileCheck" using reqFileStat
                       exit program
                   end-if.
                       
                   if reqFileStat = "35" 
                       display "File not found.  Creating file"
                       open output requestFile
                       close requestFile
                       display "File created!"
                       open i-o record
                   else 
                       call "readReqID" using requestID
                       call "getDate" using timeRequested, dateRequested
                       move inDept to department
                       move inItem to itemNQuant

                       write requestRecord
                           invalid key
                             display "Error: " requestID "already exist"
                             exit program.
                        end-write
                           call "updateReqID"
                           call "requestSubtract" using itemNQuant
                   end-if.

                   read requestFile key is requestID
                       invalid key
                           display "Request Failed"
                       not invalid key 
                           display "Department: " department
                           display "Item and Quantity: " itemNQuant
                   end-read


               close requestFile


       exit program.
