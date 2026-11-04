.686
.MODEL FLAT, C
EXTRN sub_100A5B20:PROC
EXTRN sub_100C521F:PROC
EXTRN sub_100F7884:PROC
.CODE
FUN_100a5ae7 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push esi
    mov mov esi, ecx
    mov mov dword ptr [esi], 010115A68h
    call sub_100C521F
    test test byte ptr [ebp + 8], 1
    je sub_100A5B20
    push push esi
    call sub_100F7884
    pop pop ecx
    mov mov eax, esi
    pop pop esi
    pop pop ebp
    ret ret 4
FUN_100a5ae7 ENDP
END
