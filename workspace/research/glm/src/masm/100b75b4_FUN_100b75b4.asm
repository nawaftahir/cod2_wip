.686
.MODEL FLAT, C
EXTRN sub_100C521F:PROC
EXTRN sub_100F7884:PROC
.CODE
FUN_100b75b4 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, ecx
    mov dword ptr [esi], 010117C68h
    call sub_100C521F
    test byte ptr [ebp + 8], 1
    je L0
    push esi
    call sub_100F7884
    pop ecx
L0:
    mov eax, esi
    pop esi
    pop ebp
    ret 4
FUN_100b75b4 ENDP
END
