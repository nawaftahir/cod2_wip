.686
.MODEL FLAT, C
EXTRN sub_100C5133:PROC
.CODE
FUN_100b5c28 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, ecx
    call sub_100C5133
    mov eax, dword ptr [ebp + 8]
    mov dword ptr [esi + 000000158h], eax
    mov dword ptr [esi], 010117C68h
    mov dword ptr [esi + 0000000F0h], 0101A4298h
    mov dword ptr [esi + 0000000F4h], 0101A44D8h
    mov eax, esi
    pop esi
    pop ebp
    ret 4
FUN_100b5c28 ENDP
END
