.686
.MODEL FLAT, C
EXTRN sub_100C5133:PROC
.CODE
FUN_100a48db PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push esi
    mov mov esi, ecx
    call sub_100C5133
    mov mov eax, dword ptr [ebp + 8]
    mov mov dword ptr [esi + 0158h], eax
    mov mov dword ptr [esi], 010115A68h
    mov mov dword ptr [esi + 0F0h], 0101A3A28h
    mov mov dword ptr [esi + 0F4h], 0101A3C68h
    mov mov dword ptr [esi + 0F8h], 0101A3F18h
    mov mov eax, esi
    pop pop esi
    pop pop ebp
    ret ret 4
FUN_100a48db ENDP
END
