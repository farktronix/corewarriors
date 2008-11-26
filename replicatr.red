;redcode-94
;name Replicatr
;author Jacob Farkas
;strategy Tries its damndest not to fail

        org    copyr 
    
thebom: dat -(CORESIZE/2000)
bombr:
        mul #2, thebom
        mov thebom, @thebom
        jmp bombr

cpycnt: dat 8
cpyjmp: dat CORESIZE/8
cpyloc: dat CORESIZE
copyr: 
        mov cpyloc, @cpyjmp
        sub #-1, cpycnt
        sub @cpyjmp, cpyloc
        jmz copyr, cpycnt
        jmp -1 
        
