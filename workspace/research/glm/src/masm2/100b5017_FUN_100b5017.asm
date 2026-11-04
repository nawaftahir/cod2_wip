.686
.MODEL FLAT, C
EXTRN sub_100B5050:PROC
EXTRN sub_100C521F:PROC
EXTRN sub_100F7884:PROC
.CODE
FUN_100b5017 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push esi
    mov mov esi, ecx
    mov mov dword ptr [esi], 010117AF0h
    call sub_100C521F
    test test byte ptr [ebp + 8], 1
    je sub_100B5050
    push push esi
    call sub_100F7884
    pop pop ecx
    mov mov eax, esi
    pop pop esi
    pop pop ebp
    ret ret 4
FUN_100b5017 ENDP
END
