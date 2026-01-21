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
            local-STORAGE SECTION.


               01 requestCtr pic 99 value 1. *> counter for process table
               01 itemCtr pic 99 value 1. *> counter for each item in process table


           linkage section.
               01 process-Rec.
                   02 process-table occurs 10 times.
                       03 process-ItemTable occurs 10 times.
                           04 process-Item pic x(25).
                           04 process-Quantity pic 9(4).
               
               
               
               
        PROCEDURE DIVISION using  process-Rec.
               open i-o Inventory
                   
                   
                  perform varying requestCtr from 1 by 1 until requestCtr > 10

                       perform varying itemCtr from 1 by 1 until itemCtr > 10
                           if process-Item(requestCtr itemCtr) not = spaces
                           
                               *> Move the table item to key
                               move process-Item(requestCtr itemCtr) to itemName
                               
                               *> Read the Inventory file to search the item
                               read Inventory key is itemName
                                   invalid key
                                       display "Item not found"
                                   
                                   not invalid key
                                  
                                  *> If the there are not enough stocks, don't rewrite anything    
                                    if itemStock < process-Quantity(requestCtr itemCtr)
                                       
                                       display "Requested Item: " process-Item(requestCtr itemCtr) " is low on stock"
                                   
                                   
                                   else *> if the item stock greater than the requested amount for the quantity, rewrite
                                       
                                       *> Subtract the current stock from requested quantity 
                                       compute itemStock = itemStock - process-Quantity(requestCtr itemCtr)
                                       rewrite invRec
                                  
                                   end-if
                                       
                               end-read
                           end-if
                       end-perform
                   end-perform
                       
               close Inventory
       exit program.
 