        IDENTIFICATION DIVISION.
        PROGRAM-ID. inputSafetyStock.
       
       environment division.
           input-output section.
               file-control.
                   select safeStock
                       assign to "data\items.txt"
                       organization is line sequential
                       access mode is sequential
                       file status is fileStat.

                   select safetyStock
                       assign to "data\SafetyStocks.dat"
                       organization is indexed
                       access mode is dynamic
                       record key is item
                       file status is safeStat.

        DATA DIVISION.
           
           File section.

           FD safeStock.
               01 currLine pic x(128).
           
           FD safetyStock.
               01 SafetyRec.
                   02 item pic x(25).
                   02 threshold pic 9(4).
                   02 UoM pic x(6).

           WORKING-STORAGE SECTION.
           
           01 fields.
               02 WS-item pic x(25).
               02 WS-threshhold pic 9(4).
               02 WS-orderQuant pic 9(4).
               02 WS-leadOrder pic 9(2).
               02 WS-unitOfMeasure pic x(8).
               02 WS-materialType pic x(10).


           01 safeStat pic xx.
           01 fileStat pic xx.

           01 eofFlag pic x value "N".
           01 safetyEOF pic x value "N".

           01 itemIDent pic 9(3) value 0.

        PROCEDURE DIVISION.

           display "Displaying contents"

           open input safeStock
              
               open output safetyStock
               close safetyStock

           open i-o safetyStock

               if fileStat not = "00"
                   call "openFileCheck" using fileStat, safeStock
                   stop run
               end-if.

               if safeStat not = "00"
                   call "openFileCheck" using , safetyStock
                   stop run
               end-if.

             perform until eofFlag = "Y"
               read safeStock
                   at end 
                       move "Y" to eofFlag
                   not at end
                          display "DEBUG| Currline: " currLine
                          
                          unstring currLine
                          delimited by ", "
                          into WS-item
                               WS-threshhold
                               WS-orderQuant
                               WS-leadOrder
                               WS-unitOfMeasure
                               WS-materialType

                          display "DEBUG| Fields:  "fields

                          
                  
                         
           
                          move WS-item to item
                          move WS-threshhold to threshold
                          move WS-unitOfMeasure to UoM

                          write SafetyRec
                       call "writeFileCheck" using safeStat, safetyStock


                          display "Written: "
               display "| " item " | " threshold " | " UoM
               display " "
               end-read
             end-perform.
               
           close safeStock    
           close safetyStock

       STOP RUN.
 