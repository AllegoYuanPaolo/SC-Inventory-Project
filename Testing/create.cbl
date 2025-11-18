        IDENTIFICATION DIVISION.
        PROGRAM-ID. create.
       
       environment division.
           input-output section.
               file-control.
                   select items
                       assign to "items.txt"
                       organization is sequential.

                   select inventory
                       assign to "inventory.dat"
                       organization is indexed
                       record key is 


        DATA DIVISION.
            WORKING-STORAGE SECTION.
        
        PROCEDURE DIVISION.
        
       STOP RUN.
 