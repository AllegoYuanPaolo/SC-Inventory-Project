       IDENTIFICATION DIVISION.
       program-id. requestSubtract.

       environment division.
           input-output section.
               file-control.
                   select InventoryFile
                       assign to "MS-Record.dat"
                       organization is indexed
                       record key is RRN
                       alternate key is MSName
                       access mode is dynamic
                       file status is recordStat

       data division.
           file section.

           fd InventoryFile
           01 MS-record.
               02 RRN pic 9(3).
               02 MSName pic x(20).
               02 MSStock pic 9(2).

       working-storage section.
           01 recordStat pic xx.
           01 eof pic x value "N".
           
          01 reqeustRecord.
           02 request occurs 3 times. 
               03 item pic x(20).
               03 quant pic 9(2).

           01 currRecord.
               02 currName pic x(20).
               02 currStock pic 9(2).

        01 i pic 9 value 1.
        01 ptr pic 9(3) value 1.
        01 chunk pic x(32).
        

        linkage section.
           01 itemNQuant pic x(32).

       procedure division using itemNQuant.
       

       perform until ptr > function length(itemNQuant)
           move spaces to chunk *> clear the chunk

           *> Separate each "item, quant" format
               unstring itemNQuant 
                   delimited by "; "
                   into chunk
                   with pointer ptr *>bookmarks the main string

                   *>stops when spaces
                   if chunk not = spaces
                       *> separate each "item" and "amount"
                       unstring chunk
                       delimited by ", "
                       into item(i), quant(i)
                       add 1 to i *> move to the next table index
       end-perform


           move 1 to i *> reset index to 1

       open i-o InventoryFile
           call "openFileCheck" using recordStat
           perform until item(i) = spaces and quant(i) = spaces
             if item(i) not = spaces and quant(i) not = spaces *>!empty
             move item(i) to MSName
               read InventoryFile key is MSName
                   invalid key display 
                       "Item not found: " item(i)
                       exit program
                    not invalid key   
                           if MSName = item(i) *> found the item
                               
                               move currName to MSName
                               compute currStock = MSStock - quant(i)
                               if currStock < 0 *> if not enough stock
                                   display "Not enough stock for item: "-
                                    MSName
                               else
                                   move currStock to MSStock
                                   rewrite MS-record
                                   display "Updated item: " MSName      -
                                   " New stock: " MSStock
                               end-if *> close not enough stock

                           end-if *> close found item
                   end-read
                       end-if *>close !empty
                       
           end-perform
                       
       close InventoryFile

    
       

       exit program.