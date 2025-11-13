       identification division.
       program-id. resetRequestID.

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
       
       *> Request ID reset
                            open i-o requestIDFile
                               read requestIDFile
                                   at end 
                                       move 1 to reqID
                                       write reqID
                                    not at end
                                       move 1 to reqID
                                       rewrite reqID
                                   end-read
                            close requestIDFile

                            display "Request ID reset"

       exit program.
       