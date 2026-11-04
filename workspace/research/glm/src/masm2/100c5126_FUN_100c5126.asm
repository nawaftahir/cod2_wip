.686
.MODEL FLAT, C
EXTRN sub_10086A42:PROC
.CODE
FUN_100c5126 PROC
    mov mov edi, edi
    push push esi
    push push edi
    mov mov esi, ecx
    call sub_10086A42
    push push 7
    pop pop ecx
    xor xor eax, eax
    mov mov dword ptr [esi], 01011A3B8h
    lea lea edi, [esi + 01B4h]
    rep stosd rep stosd dword ptr es:[edi], eax
    push push 7
    pop pop ecx
    lea lea edi, [esi + 01D4h]
    rep stosd rep stosd dword ptr es:[edi], eax
    or or dword ptr [esi + 0160h], -1
    xor xor ecx, ecx
    mov mov dword ptr [esi + 0FCh], ecx
    mov mov dword ptr [esi + 0100h], ecx
    mov mov dword ptr [esi + 0104h], ecx
    or or eax, -1
    lea lea edi, [esi + 0164h]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    or or dword ptr [esi + 0188h], -1
    pop pop edi
    mov mov dword ptr [esi + 010Ch], ecx
    mov mov dword ptr [esi + 0110h], ecx
    mov mov dword ptr [esi + 0114h], ecx
    mov mov dword ptr [esi + 0124h], ecx
    mov mov dword ptr [esi + 0128h], ecx
    mov mov dword ptr [esi + 012Ch], ecx
    mov mov dword ptr [esi + 0130h], ecx
    mov mov dword ptr [esi + 0134h], ecx
    mov mov dword ptr [esi + 0108h], ecx
    mov mov dword ptr [esi + 01B0h], ecx
    mov mov dword ptr [esi + 0158h], ecx
    mov mov dword ptr [esi + 01F0h], ecx
    mov mov dword ptr [esi + 01D0h], ecx
    mov mov dword ptr [esi + 01F4h], ecx
    mov mov dword ptr [esi + 0E8h], 0FFFF0000h
    mov mov dword ptr [esi + 0ECh], 16
    mov mov dword ptr [esi + 0E4h], 0FFFFh
    mov mov dword ptr [esi + 0F8h], ecx
    mov mov dword ptr [esi + 0F0h], ecx
    mov mov dword ptr [esi + 0F4h], ecx
    mov mov dword ptr [esi + 018Ch], ecx
    mov mov eax, esi
    pop pop esi
    ret ret
FUN_100c5126 ENDP
END
