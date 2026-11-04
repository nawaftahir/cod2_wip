.686
.MODEL FLAT, C
EXTRN sub_100FD618:PROC
EXTRN sub_100FD628:PROC
EXTRN EXTRN fp_1010C04C:DWORD:DWORD
EXTRN EXTRN fp_1010C07C:DWORD:DWORD
EXTRN EXTRN fp_1010C144:DWORD:DWORD
.CODE
___crtExitProcess PROC
    push push 01017C9A4h
    call dword ptr [fp_1010C07C]
    test test eax, eax
    je sub_100FD618
    push push 01017C994h
    push push eax
    call dword ptr [fp_1010C04C]
    test test eax, eax
    je sub_100FD628
    push push dword ptr [esp + 4]
    call call eax
    push push dword ptr [esp + 4]
    call dword ptr [fp_1010C144]
___crtExitProcess ENDP
END
