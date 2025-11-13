       identification division.
       program-id. readRRN.

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
         
           
            linkage section.
               01 currentCount pic 9(2).
      *    fucntion that returns a value
      *    this reads the RRN in the file, and returns the value to the
      *    arguement
       procedure division using currentCount. 
           
           open input RRNCounter
                   if counterStat not ="00"
                    display "Error opening counter. Error: " counterStat
                   end-if.
        
                   read RRNCounter
                       key is Rkey
                           invalid key display "Missing Record"
                           not invalid key
                               move RRNFile to currentCount
                   end-read
              
           close RRNCounter
       
       exit program.
