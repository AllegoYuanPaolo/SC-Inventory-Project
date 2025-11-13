        IDENTIFICATION DIVISION.
        PROGRAM-ID. writeFileCheck.
 
        DATA DIVISION.
            WORKING-STORAGE SECTION.

            linkage section.
            01 fileStatus pic xx.
            01 fileName pic x(16).
        
        PROCEDURE DIVISION using fileStatus.
           
           if fileStatus not = "00"
           Display " WRITE ERROR: " fileStatus
           evaluate fileStatus
               when "02"
                   display "   >Indexed: Duplicate Key(Alternate)"

               when "22"
                   display "   >Indexed: Duplicate Key(Primary)"

               when "23"
                   display "   >Record not found: Invalid key reference"

               when "30"
               display "   >I/O error; Disk Issue; system-level failure"

               when "37"
                   display "   >Incorrect OPEN mode for WRITE"

               when "41"
                   display "   >File already open"

               when "42"
                   display "   >File not opened"

               when "46"
                   display "   >File locked"

               when other 
                   display "Unhandled error code: " fileStatus
           end-evaluate
           end-if.

        
       goback.
 