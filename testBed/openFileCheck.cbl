       identification division.
       program-id. openFileCheck.

       data division.
       linkage section.
           01 fileStat pic XX.

       procedure division using fileStat.

           evaluate fileStat
               when "02"
                   display "   >File not found!"
                     exit program
                when "05"
                   display "   >File not present or locked"
                     exit program
                when "10"  
                   display "   >End of file reached"
                     exit program
                when "35"
                   display "   >File not found or unvailable!"
                     exit program
                when "39"
                   display "   >File mismatch"
                   display "       >Wrong organization or access mode"
               when other
                   exit program
           end-evaluate.
                
       exit program.
