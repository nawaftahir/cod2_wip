.686
.MODEL FLAT, C
EXTRN sub_100F8683:PROC
EXTRN sub_100FA223:PROC
EXTRN sub_100FA2BA:PROC
.CODE
_atof PROC
    push push ebp
    mov mov ebp, esp
    sub sub esp, 24
    push push esi
    mov mov esi, dword ptr [ebp + 8]
    jmp L0
    inc inc esi
    movzx movzx eax, byte ptr [esi]
    push push eax
    call sub_100F8683
    test test eax, eax
    pop pop ecx
L0:
    jne L1
    push push eax
    push push eax
    push push esi
    call sub_100FA223
    pop pop ecx
    push push eax
    lea lea eax, [ebp - 24]
    push push esi
    push push eax
    call sub_100FA2BA
    fld fld qword ptr [eax + 16]
    add add esp, 20
    pop pop esi
    leave leave
    ret ret
_atof ENDP
END
