       identification division.
       program-id. resetRecords.

       environment division.
           input-output section.
               file-control.
                    select recordFile
                       assign to "MS-Record.dat"
                       organization is indexed
                       access mode is dynamic
                       record key is RRN
                       alternate key is MSName
                       file status is recordStat.   

                       select RRNCounter
                           assign to "RRN.dat"
                           organization is relative
                           access mode is  random
                           relative key is Rkey
                           file status is counterStat. 

                         select requestIDFile
                             assign to "ReqID.dat"
                             organization is relative
                             access is random
                             relative key is Rkey
                             file status is reqIDStat.
       data division.
           file section.
           FD RRNCounter.
               01 RRNFile pic 9(2).

           FD recordFile.
                01 MS-Record.
                   02 RRN pic 9(3).
                   02 MSName pic x(20).
                   02 MSStock pic 9(2).   

           FD requestIDFile.
               01 reqID pic 9(2).

           working-storage section.
           
           01 Rkey pic 9 value 1.

           01 recordStat pic xx.
           01 counterStat pic xx.
           01 reqIDStat pic xx.
           
           01 choice pic x.

           01 option pic 9.
           
           01 exitLoop pic 9 value 0.
       procedure division.
           display "     DEBUG: RESET RECORDS"
           display ">WARNING: proceeding will clear all records"
           display "Continue? [Y/N]"
           display "> " with no advancing
           accept choice
           move function upper-case(choice) to choice
           display "DEBUG: Choice is [" choice "]"
           
               evaluate choice *> evaluate Y || N
                       when "Y" *> If Yes
                        call "SYSTEM" using "cls"
                           display "     DEBUG: RESET RECORDS"
                           display "=== Reset Menu ==="
                           display "[1] Reset RRN Counter"
                           display "[2] Reset Request ID Counter"
                           display "[3] Reset Record File"
                           display "[4] Reset All"
                           display "[00] Exit"
                           display "> " no advancing 
                           accept option

                               evaluate option *> evaluate 1 - 4, 00
                                   when 1 
                                         *> RRN reset
                                       open i-o RRNCounter
                                          read RRNCounter
                                               at end
                                                   move 1 to RRNFile
                                                   write RRNFile
                                               not at end
                                                   move 1 to RRNFile
                                                   rewrite RRNFile
                                           end-read
                                       close RRNCounter
                                           exit program
                                   when 2
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
                                        exit program
                                    when 3
                                       *> Record file reset
                                       open output recordFile
                                       close recordFile
                                       exit program
                                   when 4
                                         *> RRN reset
                                       open i-o RRNCounter
                                          read RRNCounter
                                               at end
                                                   move 1 to RRNFile
                                                   write RRNFile
                                               not at end
                                                   move 1 to RRNFile
                                                   rewrite RRNFile
                                           end-read
                                       close RRNCounter
                                       exit program

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

                                         *> Record file reset
                                       open output recordFile
                                       close recordFile
                                        exit program
                               when 00
                                      display "Exiting reset program..."
                                      exit program
                                when other
                                   display "Invalid Option!"
                               end-evaluate *> close option eval

                         
                         when "N"
                           display "Exiting reset program..."
                           exit program 
                        when other
                           display "Invalid choice! Try again"
               end-evaluate *> close choice eval


       exit program.
