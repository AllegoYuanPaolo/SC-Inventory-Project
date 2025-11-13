       identification division.
       program-id. getDate.

       environment division.
       
       data division.
           working-storage section.
           
           01 date-time.
               02 year pic 9(4).
               02 month pic 9(2).
               02 dispDay pic 9(2).
               02 hour pic 9(2).
               02 minute pic 9(2).
               02 second pic 9(2).
               02 millisec pic 9(2).

          

           linkage section.
                01 formatTime pic X(8).
                01 formatDate pic x(10).
               
       procedure division using formatTime formatDate.
       
           move function current-date to date-time       
               
           move hour(1:2) to formatTime(1:2)
           move ':' to formatTime(3:1)
           move minute(1:2) to formatTime(4:2)
           move ":" to formatTime(6:1)
           move second(1:2) to formatTime(7:2)
           
           move dispDay(1:2) to formatDate(1:2)
           move "/" to formatDate(3:1)
           move month(1:2) to formatDate(4:2)
           move "/" to formatDate(6:1)
           move year(1:4) to formatDate(7:4)

           *> Time: HH:MM:SS | 24hr format
           *> Date: YYYY/MM/DD

       exit program.
       