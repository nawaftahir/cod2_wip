.686
.MODEL FLAT, C
EXTRN sub_100C5133:PROC
.CODE
FUN_100b2c0c PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, ecx
    call sub_100C5133
    mov eax, dword ptr [ebp + 8]
    and dword ptr [esi + 000000228h], 0
    mov dword ptr [esi + 000000158h], eax
    mov dword ptr [esi], 010117AF0h
    mov dword ptr [esi + 0000000F4h], 0101A4088h
    mov dword ptr [esi + 0000000F8h], 0101A41A8h
    mov eax, esi
    pop esi
    pop ebp
    ret 4
FUN_100b2c0c ENDP
END
