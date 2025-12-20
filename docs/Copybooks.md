---
 # Copybooks (`.cpy`) from `src\copylib`
---
## `Inventory-rec.cpy`
```cobol
           fd Inventory. 
                  01 invRec.
                    02 itemName pic x(25).
                    02 itemStock pic 9(4).
                    02 dateReceived pic x(10).
                    02 timeReceived pic x(8).
                    02 restockStatus pic x(25).
                   
```
## `Inventory.cpy`
```cobol
               select Inventory
                       assign to "data/Inventory.dat"
                       organization is indexed
                       access mode is dynamic
                       record key is itemName
                       file status is InvStat.
                       
```
## `Request-rec.cpy`
```cobol
        fd Requests.
           01 Requests-rec.
               02 requestID pic 9(5).
               02 requestItem pic x(25).
               02 requestQuantity pic 9(4).
               02 requestor pic x(25)
               02 requestDate pic x(10).
               02 requestTime pic x(8).
```
## `Request.cpy`
```cobol
        select Requests
               assign to "data/Requests.dat"
               organization is indexed
               access mode is dynamic
               record key is requestID
               file status is ReqStat.
```
