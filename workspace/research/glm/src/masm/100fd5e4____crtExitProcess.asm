.686
.MODEL FLAT, C
EXTRN fp_1010C04C:DWORD
EXTRN fp_1010C07C:DWORD
EXTRN fp_1010C144:DWORD
.CODE
___crtExitProcess PROC
    push 01017C9A4h
    call dword ptr [fp_1010C07C]
    test eax, eax
    je L0
    push 01017C994h
    push eax
    call dword ptr [fp_1010C04C]
    test eax, eax
    je L0
    push dword ptr [esp + 4]
    call eax
L0:
    push dword ptr [esp + 4]
    call dword ptr [fp_1010C144]
___crtExitProcess ENDP
END
