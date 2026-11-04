.686
.MODEL FLAT, C
EXTRN sub_10086A42:PROC
.CODE
FUN_100c5126 PROC
    mov edi, edi
    push esi
    push edi
    mov esi, ecx
    call sub_10086A42
    push 7
    pop ecx
    xor eax, eax
    mov dword ptr [esi], 01011A3B8h
    lea edi, [esi + 0000001B4h]
    rep stosd dword ptr es:[edi], eax
    push 7
    pop ecx
    lea edi, [esi + 0000001D4h]
    rep stosd dword ptr es:[edi], eax
    or dword ptr [esi + 000000160h], 0FFFFFFFFh
    xor ecx, ecx
    mov dword ptr [esi + 0000000FCh], ecx
    mov dword ptr [esi + 000000100h], ecx
    mov dword ptr [esi + 000000104h], ecx
    or eax, 0FFFFFFFFh
    lea edi, [esi + 000000164h]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    or dword ptr [esi + 000000188h], 0FFFFFFFFh
    pop edi
    mov dword ptr [esi + 00000010Ch], ecx
    mov dword ptr [esi + 000000110h], ecx
    mov dword ptr [esi + 000000114h], ecx
    mov dword ptr [esi + 000000124h], ecx
    mov dword ptr [esi + 000000128h], ecx
    mov dword ptr [esi + 00000012Ch], ecx
    mov dword ptr [esi + 000000130h], ecx
    mov dword ptr [esi + 000000134h], ecx
    mov dword ptr [esi + 000000108h], ecx
    mov dword ptr [esi + 0000001B0h], ecx
    mov dword ptr [esi + 000000158h], ecx
    mov dword ptr [esi + 0000001F0h], ecx
    mov dword ptr [esi + 0000001D0h], ecx
    mov dword ptr [esi + 0000001F4h], ecx
    mov dword ptr [esi + 0000000E8h], 0FFFF0000h
    mov dword ptr [esi + 0000000ECh], 16
    mov dword ptr [esi + 0000000E4h], 00000FFFFh
    mov dword ptr [esi + 0000000F8h], ecx
    mov dword ptr [esi + 0000000F0h], ecx
    mov dword ptr [esi + 0000000F4h], ecx
    mov dword ptr [esi + 00000018Ch], ecx
    mov eax, esi
    pop esi
    ret
FUN_100c5126 ENDP
END
