.686
.MODEL FLAT, C
EXTRN sub_100C5133:PROC
.CODE
FUN_100a48db PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, ecx
    call sub_100C5133
    mov eax, dword ptr [ebp + 8]
    mov dword ptr [esi + 000000158h], eax
    mov dword ptr [esi], 010115A68h
    mov dword ptr [esi + 0000000F0h], 0101A3A28h
    mov dword ptr [esi + 0000000F4h], 0101A3C68h
    mov dword ptr [esi + 0000000F8h], 0101A3F18h
    mov eax, esi
    pop esi
    pop ebp
    ret 4
FUN_100a48db ENDP
END
