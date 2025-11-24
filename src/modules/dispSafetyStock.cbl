$set sourceformat"free"
        IDENTIFICATION DIVISION.
        PROGRAM-ID. dispSafetyStock.
       
       environment division.
           input-output section.
               file-control.
               
                    select safetyStock
                       assign to "data/SafetyStocks.dat"
                       organization is indexed
                       access mode is dynamic
                       record key is item
                       file status is safeStat.
               


        DATA DIVISION.
           file section.

           FD safetyStock.
               01 SafetyRec.
                   02 item pic x(25).
                   02 threshold pic 9(4).
                   02 UoM pic x(6).

           WORKING-STORAGE SECTION.

           01 itemCtr pic 99 value 1.
           01 safetyEOF pic x value "N".
           01 safeStat pic xx.

        PROCEDURE DIVISION.

           open i-o safetyStock
           call "openFileCheck" using safeStat, safetyStock
           
           display "Items: "


           perform until safetyEOF = "Y"
               read safetyStock next record
                   at end
                      move "Y" to safetyEOF
                   not at end

                   perform 45 times
                       display "-" no advancing
                   end-perform
                   display " "
                 
                      display "| " itemCtr " | "item " | " threshold " " UoM
                      add 1 to itemCtr
                end-read

           end-perform.
           

           close safetyStock
       STOP RUN.
 