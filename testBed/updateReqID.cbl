       identification division.
       program-id. updateReqID.

       environment division.
           input-output section.
           file-control.
               select requestIDFile
                   assign to "ReqID.dat"
                   organization is relative
                   access is random
                   relative key is Rkey
                   file status is reqIDStat.

       data division.
           file section.

           FD requestIDFile.
           01 reqID pic 9(2).

           working-storage section.
           
           01 reqIDStat pic xx.
           01 Rkey pic 9 value 1.

       procedure division.
           
           open i-o requestIDFile
               if reqIDStat not = "00"
                   display "Error Opening ReqID. Error:  " reqIDStat
               end-if.
               if reqIDStat = "35"
                   display "File not found. Creating file"
                   open output requestIDFile
                       move 1 to reqID
                       write reqID
                   close requestIDFile
                   display "Created file, written '1'"
                   open i-o requestIDFile
                end-if.

                   read requestIDFile
                       key is Rkey
                           invalid key display "Missing record"
                           not invalid key
                               display "Current ReqID: " reqID
                               add 1 to reqID
                               rewrite reqID
                               display "Next ReqID: " reqID
                    end-read
           close requestIDFile

           exit program.
                               