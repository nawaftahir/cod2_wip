.686
.MODEL FLAT, C
EXTRN sub_10034CC6:PROC
.CODE
FUN_10034ec0 PROC
    sub esp, 64
    push ebp
    mov ebp, dword ptr [esp + 76]
    mov eax, dword ptr [ebp + ebx*4]
    push edi
    push eax
    push eax
    mov eax, dword ptr [esp + 84]
    push eax
    lea edi, [esp + 52]
    lea edx, [esp + 20]
    mov eax, 8
    call sub_10034CC6
    fld dword ptr [esp + 20]
    mov ecx, dword ptr [eax*4 + 0101D1BACh]
    mov dword ptr [esi + 20], eax
    mov dword ptr [esi], ecx
    fstp dword ptr [esi + ebx*4 + 24]
    mov edx, dword ptr [esp + 52]
    fld dword ptr [esp + 24]
    add esp, 12
    mov eax, ebx
    neg eax
    xor ecx, ecx
    mov dword ptr [esi + eax*4 + 28], ecx
    mov dword ptr [esi + 36], edx
    mov edx, dword ptr [esp + 44]
    mov dword ptr [esi + 32], ecx
    fstp dword ptr [esi + ebx*4 + 40]
    fld dword ptr [esp + 16]
    mov dword ptr [esi + eax*4 + 44], ecx
    mov dword ptr [esi + 52], edx
    mov edx, dword ptr [esp + 48]
    mov dword ptr [esi + 48], ecx
    fstp dword ptr [esi + ebx*4 + 56]
    fld dword ptr [esp + 20]
    mov dword ptr [esi + eax*4 + 60], ecx
    mov dword ptr [esi + 68], edx
    mov edx, dword ptr [esp + 52]
    mov dword ptr [esi + 64], ecx
    fstp dword ptr [esi + ebx*4 + 72]
    fld dword ptr [esp + 24]
    mov dword ptr [esi + eax*4 + 76], ecx
    mov dword ptr [esi + 84], edx
    mov edx, dword ptr [esp + 56]
    mov dword ptr [esi + 80], ecx
    fstp dword ptr [esi + ebx*4 + 88]
    fld dword ptr [esp + 28]
    mov dword ptr [esi + eax*4 + 92], ecx
    mov dword ptr [esi + 100], edx
    mov edx, dword ptr [esp + 60]
    mov dword ptr [esi + 96], ecx
    fstp dword ptr [esi + ebx*4 + 104]
    fld dword ptr [esp + 32]
    mov dword ptr [esi + eax*4 + 108], ecx
    mov dword ptr [esi + 116], edx
    mov edx, dword ptr [esp + 64]
    mov dword ptr [esi + 112], ecx
    fstp dword ptr [esi + ebx*4 + 120]
    fld dword ptr [esp + 36]
    mov dword ptr [esi + eax*4 + 124], ecx
    mov dword ptr [esi + 000000080h], ecx
    mov dword ptr [esi + 000000084h], edx
    fstp dword ptr [esi + ebx*4 + 000000088h]
    mov dword ptr [esi + eax*4 + 00000008Ch], ecx
    mov eax, dword ptr [esp + 68]
    mov dword ptr [esi + 000000094h], eax
    mov dword ptr [esi + 000000090h], ecx
    mov eax, 03F800000h
    mov dword ptr [esi + 4], eax
    mov dword ptr [esi + 8], eax
    mov ecx, dword ptr [ebp]
    mov dword ptr [esi + 12], ecx
    mov edx, dword ptr [ebp + 4]
    pop edi
    mov dword ptr [esi + 16], edx
    pop ebp
    add esp, 64
    ret
FUN_10034ec0 ENDP
END
