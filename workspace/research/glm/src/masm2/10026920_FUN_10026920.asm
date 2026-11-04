.686
.MODEL FLAT, C
EXTRN sub_10026840:PROC
EXTRN sub_100268B1:PROC
EXTRN EXTRN fp_101D49DC:DWORD:DWORD
EXTRN EXTRN fp_101D49E0:DWORD:DWORD
EXTRN EXTRN fp_101D4B14:DWORD:DWORD
EXTRN EXTRN g_101D4928:DWORD:DWORD
.CODE
FUN_10026920 PROC
    movzx movzx eax, word ptr [g_101D4928]
    mov mov ecx, eax
    imul imul ecx, eax
    push push ebp
    push push esi
    lea lea ebp, [ecx*4 + 18]
    push push edi
    push push ebp
    call dword ptr [fp_101D49DC]
    mov mov edi, eax
    movzx movzx eax, word ptr [g_101D4928]
    xor xor edx, edx
    mov mov ecx, edi
    mov mov dword ptr [ecx], edx
    mov mov dword ptr [ecx + 4], edx
    mov mov dword ptr [ecx + 8], edx
    mov mov dword ptr [ecx + 12], edx
    mov mov word ptr [ecx + 16], dx
    mov mov ecx, eax
    sar sar ecx, 8
    mov mov byte ptr [edi + 13], cl
    mov mov byte ptr [edi + 15], cl
    mov mov byte ptr [edi + 2], 2
    mov mov byte ptr [edi + 12], al
    mov mov byte ptr [edi + 14], al
    mov mov byte ptr [edi + 16], 32
    mov mov esi, dword ptr [ebx*4 + 010696BB0h]
    mov mov ecx, edi
    call sub_10026840
    mov mov edx, dword ptr [esp + 28]
    mov mov eax, dword ptr [esp + 24]
    push push edi
    push push edx
    push push eax
    push push ebx
    call sub_100268B1
    mov mov ecx, dword ptr [esp + 36]
    push push ebp
    push push edi
    push push ecx
    call dword ptr [fp_101D4B14]
    push push edi
    call dword ptr [fp_101D49E0]
    mov mov edx, dword ptr [ebx*4 + 010696BB0h]
    push push edx
    call dword ptr [fp_101D49E0]
    add add esp, 40
    pop pop edi
    pop pop esi
    pop pop ebp
    ret ret
FUN_10026920 ENDP
END
