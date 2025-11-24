               select Inventory
                       assign to "data\Inventory.dat"
                       organization is indexed
                       access mode is dynamic
                       record key is itemName
                       file status is InvStat.
                       