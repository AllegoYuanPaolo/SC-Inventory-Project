       identification division.
       program-id. openFileCheck.

       data division.
       linkage section.
           01 fileStat pic XX.
           01 fileName pic x(16).

       procedure division using fileStat fileName.
           
           if fileStat not = "00"
           display  "OPEN ERROR: " fileStat
           evaluate fileStat
               when "02"
                   display "   >File not found!"
                when "05"
                   display "   >File not present or locked"

                when "10"  
                   display "   >End of file reached"

                when "35"
                   display "   >File not found or unvailable!"

                when "39"
                   display "   >File mismatch"
                   display "       >Wrong organization or access mode"

                when "41"
                   display "   >File already open"

               when other
                       display "Unhandled File Status"
           end-evaluate
           stop run
           end-if.
                
       exit program.
