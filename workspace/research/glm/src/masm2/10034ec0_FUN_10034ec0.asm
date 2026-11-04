.686
.MODEL FLAT, C
EXTRN sub_10034CC6:PROC
.CODE
FUN_10034ec0 PROC
    sub sub esp, 64
    push push ebp
    mov mov ebp, dword ptr [esp + 76]
    mov mov eax, dword ptr [ebp + ebx*4]
    push push edi
    push push eax
    push push eax
    mov mov eax, dword ptr [esp + 84]
    push push eax
    lea lea edi, [esp + 52]
    lea lea edx, [esp + 20]
    mov mov eax, 8
    call sub_10034CC6
    fld fld dword ptr [esp + 20]
    mov mov ecx, dword ptr [eax*4 + 0101D1BACh]
    mov mov dword ptr [esi + 20], eax
    mov mov dword ptr [esi], ecx
    fstp fstp dword ptr [esi + ebx*4 + 24]
    mov mov edx, dword ptr [esp + 52]
    fld fld dword ptr [esp + 24]
    add add esp, 12
    mov mov eax, ebx
    neg neg eax
    xor xor ecx, ecx
    mov mov dword ptr [esi + eax*4 + 28], ecx
    mov mov dword ptr [esi + 36], edx
    mov mov edx, dword ptr [esp + 44]
    mov mov dword ptr [esi + 32], ecx
    fstp fstp dword ptr [esi + ebx*4 + 40]
    fld fld dword ptr [esp + 16]
    mov mov dword ptr [esi + eax*4 + 44], ecx
    mov mov dword ptr [esi + 52], edx
    mov mov edx, dword ptr [esp + 48]
    mov mov dword ptr [esi + 48], ecx
    fstp fstp dword ptr [esi + ebx*4 + 56]
    fld fld dword ptr [esp + 20]
    mov mov dword ptr [esi + eax*4 + 60], ecx
    mov mov dword ptr [esi + 68], edx
    mov mov edx, dword ptr [esp + 52]
    mov mov dword ptr [esi + 64], ecx
    fstp fstp dword ptr [esi + ebx*4 + 72]
    fld fld dword ptr [esp + 24]
    mov mov dword ptr [esi + eax*4 + 76], ecx
    mov mov dword ptr [esi + 84], edx
    mov mov edx, dword ptr [esp + 56]
    mov mov dword ptr [esi + 80], ecx
    fstp fstp dword ptr [esi + ebx*4 + 88]
    fld fld dword ptr [esp + 28]
    mov mov dword ptr [esi + eax*4 + 92], ecx
    mov mov dword ptr [esi + 100], edx
    mov mov edx, dword ptr [esp + 60]
    mov mov dword ptr [esi + 96], ecx
    fstp fstp dword ptr [esi + ebx*4 + 104]
    fld fld dword ptr [esp + 32]
    mov mov dword ptr [esi + eax*4 + 108], ecx
    mov mov dword ptr [esi + 116], edx
    mov mov edx, dword ptr [esp + 64]
    mov mov dword ptr [esi + 112], ecx
    fstp fstp dword ptr [esi + ebx*4 + 120]
    fld fld dword ptr [esp + 36]
    mov mov dword ptr [esi + eax*4 + 124], ecx
    mov mov dword ptr [esi + 080h], ecx
    mov mov dword ptr [esi + 084h], edx
    fstp fstp dword ptr [esi + ebx*4 + 088h]
    mov mov dword ptr [esi + eax*4 + 08Ch], ecx
    mov mov eax, dword ptr [esp + 68]
    mov mov dword ptr [esi + 094h], eax
    mov mov dword ptr [esi + 090h], ecx
    mov mov eax, 03F800000h
    mov mov dword ptr [esi + 4], eax
    mov mov dword ptr [esi + 8], eax
    mov mov ecx, dword ptr [ebp]
    mov mov dword ptr [esi + 12], ecx
    mov mov edx, dword ptr [ebp + 4]
    pop pop edi
    mov mov dword ptr [esi + 16], edx
    pop pop ebp
    add add esp, 64
    ret ret
FUN_10034ec0 ENDP
END
