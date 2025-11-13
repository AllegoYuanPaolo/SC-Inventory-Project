>>source format free
        IDENTIFICATION DIVISION.
        PROGRAM-ID. length.
       
       environment division.
           input-output section.
           file-control.
               select itemFile
                   assign to "items.txt"
                   organization is line sequential
                   file status is itemStat.

        DATA DIVISION.
           file section.
              FD itemFile.
               01 currline pic x(55).

            WORKING-STORAGE SECTION.
            01 itemStat pic xx.
            01 eofFlag pic x value "n".
            01 rec-len pic 9(4) comp.


            01 fields.
               02 item pic x(32).
               02 threshold pic 9(4).
               02 orderQuant pic 9(4).
               02 leadOrder pic 9(2).
               02 unitOfMeasure pic x(8).
               02 materialType pic x(16).
           
           01 longest.
               02 longestItem pic 9(2) value zero.
               02 longestMaterialType pic 9(2) value zero.
               02 longestUnitOfMeasure pic 9(2) value zero.

           01 loopCount pic 99 value 0.
           
        PROCEDURE DIVISION.

        display "Reading the txt file. . ."

           open input itemFile
               call "openFileCheck" using itemStat
               
               perform until eofFlag = "Y"
               read itemFile next record
                   at end move "Y" to eofFlag
                   not at end
                       unstring currline
                           delimited by ", "
                           into item
                                threshold
                                orderQuant
                                leadOrder
                                unitOfMeasure
                                materialType
              
               add 1 to loopCount
               
               DISPLAY "Iteration: " loopCount "| Line: " currline
           DISPLAY "Item: " item "| UOM: " unitOfMeasure no advancing
               display "| Material: " materialType
               display "Lengths| Item: " function length(function trim(item)) no advancing
               display "| UoM: " function length(function trim(unitOfMeasure)) no advancing
               display "| Material: " function length(function trim(materialType))
               display " "
               

             if function length(function trim(item)) > longestItem
               move function length(function trim(item)) to longestItem
             end-if


             if function length(function trim(unitOfMeasure)) > longestUnitOfMeasure
               move function length(function trim(unitOfMeasure)) to longestUnitOfMeasure
             end-if
             
            
             if function length(function trim(materialType)) > longestMaterialType
               move function length(function trim(materialType)) to longestMaterialType
             end-if

               end-read
           end-perform

           close itemFile

           display "DEBUG: iterations: " loopCount
           display "Longest string length for Item Name: " longestItem
           display "Longest string length for Unit of Measure: " longestUnitOfMeasure
           display "Longest string length for Material Type: " longestMaterialType
        
       STOP RUN.
 