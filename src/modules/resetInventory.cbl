$set sourceformat"free"
        IDENTIFICATION DIVISION.
        PROGRAM-ID. resetInventory.
       
       environment division.
           input-output section.
           file-control.
               
               select Inventory
                   assign to "data\Inventory.dat"
                   organization is indexed
                   access mode is dynamic
                   record key is itemName
                   file status is InvStat.

               select masterList
                   assign to "data\items.txt"
                   organization is line sequential
                   file status is itemStat.
                   
        DATA DIVISION.
           file section.
               fd masterList.
                   01 currLine pic x(55).
                
                fd Inventory. 
                  01 invRec.
                   02 itemName pic x(25).
                   02 itemStock pic 9(4).
                   02 dateReceived pic x(10).
                   02 timeReceived pic x(8).
                   02 restockStatus pic x(25).
            WORKING-STORAGE SECTION.
           
           01  masterListRecord.
               02 WS-item pic x(25).
               02 WS-threshhold pic 9(4).
               02 WS-orderQuant pic 9(4).
               02 WS-leadOrder pic 9(2).
               02 WS-unitOfMeasure pic x(8).
               02 WS-materialType pic x(10).
           
            01 itemStat pic xx.
            01 InvStat pic xx.

            01 eof pic x value "n".
            01 ctr pic 99 value 1.
                   
        PROCEDURE DIVISION.

           open input masterList
           
               open output Inventory
               close Inventory


           open i-o Inventory
           call "openFileCheck" using itemStat
           call "openFileCheck" using InvStat


           perform until eof = 'y'
               read masterList
                   at end 
                       move "y" to eof
                       display "EOF reached"
                   not at end
                       
                       unstring currLine delimited by ", "
                           into WS-item, WS-threshhold, WS-orderQuant
                                WS-leadOrder,WS-unitOfMeasure, WS-materialType
                       end-unstring
                       

                       move WS-item to itemName
                       move 0 to itemStock
                       call "getDate" using timeReceived dateReceived

                       write invRec
                           invalid key
                               display "Failure to write"
                               call "writeFileCheck" using InvStat
                       end-write

                   display "Masterlist #" ctr " : " invRec
                   add 1 to ctr

               end-read
           end-perform
           
           
           close masterList
           close Inventory
           display "============================"
           call "testViewInventory"

        
       exit program.
 