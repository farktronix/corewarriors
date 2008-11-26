;redcode-94
;name Replicatr
;author Jacob Farkas
;strategy Tries its damndest not to fail

        org bombr

space   equ     5 ; CORESIZE/100

thebom: dat     -space,space                    ; A: where to bomb B: num times to bomb 
bombr:
        mov     thebom, }thebom                 ; drop a bomb, increment the location
        sub     #1, thebom
        jmn.b   bombr, thebom 
        jmp     copyr                           ; alright, enough violence, let's clone

newbom: dat     (ip + space)        ;CORESIZE/100
copyr: 
        mov     >ip, >newbom                    ; copy the instructions from the bombr
        jmn     copyr, ip
        mov.x   #-(ip - bombr), >newbom         ; rig up the instruction pointer
        mov.x   #13, 13                         ; rig up the newbom pointer
        mov.a   #-space, space + 2              ; move the bomb location into place
        mov.ab  #space, space + 1               ; move the bomb counter into place
        jmp     space + 1                       ; jump into the new bombr
ip:     dat     bombr 
