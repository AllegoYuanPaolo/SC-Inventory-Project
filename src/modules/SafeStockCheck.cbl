      $set sourceformat"free"
        IDENTIFICATION DIVISION.
        PROGRAM-ID. SafeStockCheck.
       
       environment division.
           input-output section.
               file-control.
               
                    select safetyStock
                       assign to "data\SafetyStocks.dat"
                       organization is indexed
                       access mode is dynamic
                       record key is item
                       file status is safeStat.
        DATA DIVISION.
           FILE SECTION.
                FD safetyStock.
               01 SafetyRec.
                   02 item pic x(25).
                   02 threshold pic 9(4).
                   02 UoM pic x(6).

           LOCAL-STORAGE SECTION.

           01 safeStat pic xx.
           
           01 stockDiff pic 9(4) value zero.
           01 formatDiff pic Z,ZZ9.
           01 alpDiff pic x(5).

           linkage section.
           01 itemName pic x(25).
           01 itemStock pic 9(4).
           01 restockStatus pic x(25).
        
        PROCEDURE DIVISION using itemName itemStock restockStatus.
           

           move itemName to item

           open input safetyStock
               call "openFileCheck" using safeStat

               read safetyStock key is item
                   invalid key 
                       display "ERROR in matching record"
                   not invalid key
                       if itemStock < threshold
                          compute stockDiff = threshold - itemStock
                          move stockDiff to formatDiff
                          move formatDiff to alpDiff
                          move function concatenate("Restock: ",function trim(alpDiff)," ", UoM) to restockStatus
                       else 
                           move "Okay" to restockStatus
                       end-if
               end-read

           close safetyStock
     
       goback.
 

     