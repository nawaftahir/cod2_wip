.686
.MODEL FLAT, C
EXTRN sub_100C5131:PROC
.CODE
FUN_100a6e56 PROC
    mov mov edi, edi
    push push esi
    push push edi
    mov mov esi, ecx
    call sub_100C5131
    or or dword ptr [esi + 043Ch], -1
    xor xor edx, edx
    push push 16
    pop pop ecx
    xor xor eax, eax
    lea lea edi, [esi + 02C4h]
    mov mov dword ptr [esi], 010116AC0h
    mov mov dword ptr [esi + 022Ch], edx
    mov mov dword ptr [esi + 0230h], edx
    mov mov dword ptr [esi + 0448h], edx
    mov mov dword ptr [esi + 02B4h], edx
    mov mov dword ptr [esi + 02B8h], edx
    mov mov dword ptr [esi + 02C0h], edx
    mov mov dword ptr [esi + 02BCh], edx
    rep stosd rep stosd dword ptr es:[edi], eax
    pop pop edi
    mov mov dword ptr [esi + 0404h], edx
    mov mov eax, esi
    pop pop esi
    ret ret
FUN_100a6e56 ENDP
END
