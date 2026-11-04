.686
.MODEL FLAT, C
EXTRN sub_100C5133:PROC
.CODE
FUN_100b2c0c PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push esi
    mov mov esi, ecx
    call sub_100C5133
    mov mov eax, dword ptr [ebp + 8]
    and and dword ptr [esi + 0228h], 0
    mov mov dword ptr [esi + 0158h], eax
    mov mov dword ptr [esi], 010117AF0h
    mov mov dword ptr [esi + 0F4h], 0101A4088h
    mov mov dword ptr [esi + 0F8h], 0101A41A8h
    mov mov eax, esi
    pop pop esi
    pop pop ebp
    ret ret 4
FUN_100b2c0c ENDP
END
