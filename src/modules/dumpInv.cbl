       IDENTIFICATION DIVISION.
       PROGRAM-ID. dumpInventory.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT Inventory
               ASSIGN TO "data\Inventory.dat"
               ORGANIZATION IS INDEXED
               ACCESS MODE IS SEQUENTIAL
               RECORD KEY IS itemName
               FILE STATUS IS InvStat.

       DATA DIVISION.
       FILE SECTION.
       FD Inventory.
       01 invRec.
           02 itemName       PIC X(25).
           02 itemStock      PIC 9(4).
           02 dateReceived   PIC X(10).
           02 timeReceived   PIC X(8).
           02 restockStatus  PIC X(25).

       WORKING-STORAGE SECTION.
       01 InvStat PIC XX.
       01 eof     PIC X VALUE "n".

       PROCEDURE DIVISION.
           OPEN INPUT Inventory
           PERFORM UNTIL eof = "y"
               READ Inventory NEXT RECORD
                   AT END MOVE "y" TO eof
                   NOT AT END
                       DISPLAY itemName " | " itemStock
               END-READ
           END-PERFORM
           CLOSE Inventory
           STOP RUN.