       identification division.
       program-id. readReqID.

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

           linkage section.
               01 ID-out pic 9(2).
       procedure division using ID-out.
       
           open input requestIDFile
               if reqIDStat not = "00"
                   display "Error opneing ReqID. Error: " reqIDStat
                   exit program
                end-if.

                if reqIDStat = "35"
                   display "File not found, Creating file"
                   open output requestIDFile
                       move 1 to reqID
                       write reqID
                   close requestIDFile
                   display "Created file, written '1'"
                   open input requestIDFile
                end-if.

                read requestIDFile
                   key is Rkey
                       invalid key
                           display "ERROR: missing record"
                       not invalid key 
                           display "Current ID: " reqID
                           *>move reqID to ID-out
                  end-read
           close requestIDFile

       exit program.      
