.686
.MODEL FLAT, C
EXTRN EXTRN fp_101D4ACC:DWORD:DWORD
.CODE
FUN_100052c0 PROC
    push push 0100052A0h
    push push 0101924B8h
    call dword ptr [fp_101D4ACC]
    push push 0100052B0h
    push push 0101924A8h
    call dword ptr [fp_101D4ACC]
    push push 01000D940h
    push push 01019249Ch
    call dword ptr [fp_101D4ACC]
    push push 010005290h
    push push 01019248Ch
    call dword ptr [fp_101D4ACC]
    push push 0100178B0h
    push push 010192474h
    call dword ptr [fp_101D4ACC]
    push push 010029010h
    push push 010192468h
    call dword ptr [fp_101D4ACC]
    push push 0100290F0h
    push push 01019245Ch
    call dword ptr [fp_101D4ACC]
    push push 01002BB90h
    push push 010192450h
    call dword ptr [fp_101D4ACC]
    add add esp, 64
    push push 01002BBF0h
    push push 010192444h
    call dword ptr [fp_101D4ACC]
    add add esp, 8
    ret ret
FUN_100052c0 ENDP
END
