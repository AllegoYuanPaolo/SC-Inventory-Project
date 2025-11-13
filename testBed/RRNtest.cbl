       identification division.
       program-id. RRNtest.

       environment division.

       data division.
           working-storage section.
            01 dispCount pic Z9.
       procedure division.

           call "readRRN" using dispCount

           display "Current RRN: " dispCount

       stop runc
       