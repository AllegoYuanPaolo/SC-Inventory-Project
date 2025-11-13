       identification division.
       program-id. test.

       environment division.

       data division.
           working-storage section.
               01 choice pic 9.
       procedure division.
       
       display "1 - Add record"
       display "2 - View record"
       display "3 - Update record"
       display "> " with no advancing
       accept choice

           evaluate choice
               when 1
                   display "Opening Add Record..."
                   call "addRecord"
               when 2 
                   display "Opening View Record"
                   call "viewRecord"
               when 3
                   display "Opening Update Record..."
                   call "updateRecord"
               when other
                   display "1 - 3 only"
                   display "Closing program"
                   exit program.
           end-evaluate

       stop run.
