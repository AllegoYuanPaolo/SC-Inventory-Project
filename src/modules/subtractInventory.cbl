$set sourceformat"free"
        IDENTIFICATION DIVISION.
        PROGRAM-ID. subtractInventory.

        environment division.
           input-output section.
               file-control.
                   copy "Inventory".
 
        DATA DIVISION.
           file section.
               copy "Inventory-rec".
            WORKING-STORAGE SECTION.


               01 requestCtr pic 99 value 1. *> counter for process table
               01 sub-itemCtr pic 99 value 1. *> counter for each item in process table

               
               01 outOfStockCtr pic 99 value 1. *> counter for outOfStock table

           linkage section.
               01 process-Rec.
                   02 process-table occurs 10 times.
                       03 process-ItemTable occurs 10 times.
                           04 process-Item pic x(25).
                           04 process-Quantity pic 9(4).
               
               
               
              01 outOfStock.  *> Array to store the items that has low or out of stock
                   02 requestStock-Table occurs 10 times.
                       03 lowStock-Table occurs 10 times.
                           04 low-Item pic x(25).
                           04 low-StockCount pic x(4).
        PROCEDURE DIVISION using  process-Rec outOfStock.
               open i-o Inventory
                   
                   
                  perform varying requestCtr from 1 by 1 until requestCtr > 10
                       move 1 to outOfStockCtr

                       perform varying sub-itemCtr from 1 by 1 until sub-itemCtr > 10
                           if process-Item(requestCtr sub-itemCtr) not = spaces
                           
                               *> Move the table item to key
                               move process-Item(requestCtr sub-itemCtr) to itemName
                               
                               *> Read the Inventory file to search the item
                               read Inventory key is itemName
                                   invalid key
                                       display "Item not found"
                                   
                                   not invalid key
                                  
                                  *> If the there are not enough stocks, don't rewrite anything    
                                    if itemStock <= process-Quantity(requestCtr sub-itemCtr)
                                       
                                       *> Add item to low-stock table
                                       move process-Item(requestCtr sub-itemCtr) to low-Item(requestCtr outOfStockCtr)
                                       move itemStock to low-StockCount(requestCtr outOfStockCtr)
                                       add 1 to outOfStockCtr *> move the table
                                   
                                   
                                   else *> if the item stock greater than the requested amount for the quantity, rewrite
                                       
                                       *> Subtract the current stock from requested quantity 
                                       compute itemStock = itemStock - process-Quantity(requestCtr sub-itemCtr)
                                       rewrite invRec
                                  
                                   end-if
                                       
                               end-read
                           end-if
                       end-perform
                   end-perform
 
               close Inventory
       exit program.
 