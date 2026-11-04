.686
.MODEL FLAT, C
EXTRN sub_100C5133:PROC
.CODE
FUN_100b5c28 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push esi
    mov mov esi, ecx
    call sub_100C5133
    mov mov eax, dword ptr [ebp + 8]
    mov mov dword ptr [esi + 0158h], eax
    mov mov dword ptr [esi], 010117C68h
    mov mov dword ptr [esi + 0F0h], 0101A4298h
    mov mov dword ptr [esi + 0F4h], 0101A44D8h
    mov mov eax, esi
    pop pop esi
    pop pop ebp
    ret ret 4
FUN_100b5c28 ENDP
END
