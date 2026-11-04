.686
.MODEL FLAT, C
EXTRN sub_10026840:PROC
EXTRN sub_100268B1:PROC
EXTRN fp_101D49DC:DWORD
EXTRN fp_101D49E0:DWORD
EXTRN fp_101D4B14:DWORD
EXTRN g_101D4928:DWORD
.CODE
FUN_10026920 PROC
    movzx eax, word ptr [g_101D4928]
    mov ecx, eax
    imul ecx, eax
    push ebp
    push esi
    lea ebp, [ecx*4 + 18]
    push edi
    push ebp
    call dword ptr [fp_101D49DC]
    mov edi, eax
    movzx eax, word ptr [g_101D4928]
    xor edx, edx
    mov ecx, edi
    mov dword ptr [ecx], edx
    mov dword ptr [ecx + 4], edx
    mov dword ptr [ecx + 8], edx
    mov dword ptr [ecx + 12], edx
    mov word ptr [ecx + 16], dx
    mov ecx, eax
    sar ecx, 8
    mov byte ptr [edi + 13], cl
    mov byte ptr [edi + 15], cl
    mov byte ptr [edi + 2], 2
    mov byte ptr [edi + 12], al
    mov byte ptr [edi + 14], al
    mov byte ptr [edi + 16], 32
    mov esi, dword ptr [ebx*4 + 010696BB0h]
    mov ecx, edi
    call sub_10026840
    mov edx, dword ptr [esp + 28]
    mov eax, dword ptr [esp + 24]
    push edi
    push edx
    push eax
    push ebx
    call sub_100268B1
    mov ecx, dword ptr [esp + 36]
    push ebp
    push edi
    push ecx
    call dword ptr [fp_101D4B14]
    push edi
    call dword ptr [fp_101D49E0]
    mov edx, dword ptr [ebx*4 + 010696BB0h]
    push edx
    call dword ptr [fp_101D49E0]
    add esp, 40
    pop edi
    pop esi
    pop ebp
    ret
FUN_10026920 ENDP
END
