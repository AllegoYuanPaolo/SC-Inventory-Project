       identification division.
       program-id. updateRRN.

       environment division.
           input-output section.
               file-control.
                   
                  select RRNCounter
                           assign to "RRN.dat"
                           organization is relative
                           access mode is  random
                           relative key is Rkey
                           file status is counterStat.
       data division.
           file section.

           FD RRNCounter.
               01 RRNFile pic 9(2).
           working-storage section.
           
           01 counterStat pic xx.
           01 Rkey pic 9 value 1.
      

           procedure division.
           
           open i-o RRNCounter
               if counterStat not ="00"
                   display "Error Opening Counter. Error: " counterStat
               end-if.
                   if counterStat = "35"
                       display "File not found. Creating file"
                       open output RRNCounter
                           move 1 to RRNFile
                           write RRNFile
                       close RRNCounter
                       display "Created file, written '1'"
                       open i-o RRNCounter
                   end-if.
          
                   read RRNCounter
                       key is Rkey
                           invalid key display "Missing Record"
                           not invalid key
                               display "Current ID: " RRNFile
                               add 1 to RRNFile
                               rewrite RRNFile
                               display "Next ID: " RRNFile
                     end-read
       
           close RRNCounter

           exit program.
