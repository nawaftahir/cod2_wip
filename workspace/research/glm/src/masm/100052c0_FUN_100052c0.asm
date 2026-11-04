.686
.MODEL FLAT, C
EXTRN fp_101D4ACC:DWORD
.CODE
FUN_100052c0 PROC
    push 0100052A0h
    push 0101924B8h
    call dword ptr [fp_101D4ACC]
    push 0100052B0h
    push 0101924A8h
    call dword ptr [fp_101D4ACC]
    push 01000D940h
    push 01019249Ch
    call dword ptr [fp_101D4ACC]
    push 010005290h
    push 01019248Ch
    call dword ptr [fp_101D4ACC]
    push 0100178B0h
    push 010192474h
    call dword ptr [fp_101D4ACC]
    push 010029010h
    push 010192468h
    call dword ptr [fp_101D4ACC]
    push 0100290F0h
    push 01019245Ch
    call dword ptr [fp_101D4ACC]
    push 01002BB90h
    push 010192450h
    call dword ptr [fp_101D4ACC]
    add esp, 64
    push 01002BBF0h
    push 010192444h
    call dword ptr [fp_101D4ACC]
    add esp, 8
    ret
FUN_100052c0 ENDP
END
