      $set sourceformat"free"
      
        IDENTIFICATION DIVISION.
        PROGRAM-ID. addStocks.
        
        environment division.
           input-output section.
               file-control.
                    select Inventory
                       assign to "data\Inventory.dat"
                       organization is indexed
                       access mode is dynamic
                       record key is itemName
                       file status is InvStat.
 
        DATA DIVISION.
            file section.
                fd Inventory. 
                  01 invRec.
                   02 itemName pic x(25).
                   02 itemStock pic 9(4).
                   02 dateReceived pic x(10).
                   02 timeReceived pic x(8).
                   02 restockStatus pic x(25).
            WORKING-STORAGE SECTION.
           01 Invstat pic xx.
           01 searchKey pic x(25).
           01 RestockAmount pic 9(4).
        PROCEDURE DIVISION.
           display "Enter I(tem name to restock: " no advancing
           accept searchKey

           open i-o Inventory
               call "openFileCheck" using Invstat
               
               move searchKey to itemName
               read Inventory key is itemName
                   not invalid key
                       display "Item: " itemName " | Current stock: " itemStock
                       display "Restock quantity: " no advancing
                       accept  RestockAmount

                   invalid key
                       
               end-read

           close Inventory
       STOP RUN.
 