.686
.MODEL FLAT, C
EXTRN sub_100F8683:PROC
EXTRN sub_100FA223:PROC
EXTRN sub_100FA2BA:PROC
.CODE
_atof PROC
    push ebp
    mov ebp, esp
    sub esp, 24
    push esi
    mov esi, dword ptr [ebp + 8]
    jmp L1
L0:
    inc esi
L1:
    movzx eax, byte ptr [esi]
    push eax
    call sub_100F8683
    test eax, eax
    pop ecx
    jne L0
    push eax
    push eax
    push esi
    call sub_100FA223
    pop ecx
    push eax
    lea eax, [ebp - 24]
    push esi
    push eax
    call sub_100FA2BA
    fld qword ptr [eax + 16]
    add esp, 20
    pop esi
    leave
    ret
_atof ENDP
END
