---
 # Copybooks (`.cpy`) from `src\copylib`
---## src\copyLib\Inventory-rec.cpy:
```cobol
           fd Inventory. 
                  01 invRec.
                   02 itemName pic x(25).
                   02 itemStock pic 9(4).
                   02 dateReceived pic x(10).
                   02 timeReceived pic x(8).
                   02 restockStatus pic x(25).
                   
```
## src\copyLib\Inventory.cpy:
```cobol
               select Inventory
                       assign to "data\Inventory.dat"
                       organization is indexed
                       access mode is dynamic
                       record key is itemName
                       file status is InvStat.
                       
```
