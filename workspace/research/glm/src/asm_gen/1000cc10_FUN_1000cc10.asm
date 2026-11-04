; FUN_1000cc10 @ 0x1000cc10 — auto-synthesized
    EXTRN fp_101d49d4:DWORD
    sub_1000cb9f PROTO C
.CODE
FUN_1000cc10 PROC
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 0xc]
    push esi
    mov eax, ebp
    push edi
    lea ecx, [eax + 1]
    lea ecx, [ecx]
    mov dl, byte ptr [eax]
    inc eax
    test dl, dl
    jne L0
    sub eax, ecx
    lea esi, [eax + 1]
    lea eax, [esi + 0x24]
    push eax
    call dword ptr [fp_101d49d4]
    mov ebx, eax
    mov al, byte ptr [esp + 0x1c]
    mov ecx, esi
    mov edx, ecx
    shr ecx, 2
    lea edi, [ebx + 0x24]
    mov dword ptr [ebx + 0x20], edi
    mov esi, ebp
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    mov dl, byte ptr [esp + 0x24]
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov cl, byte ptr [esp + 0x20]
    add esp, 4
    mov esi, ebp
    mov byte ptr [ebx + 0x1e], al
    mov byte ptr [ebx + 0xa], cl
    mov byte ptr [ebx + 0xc], dl
    call sub_1000cb9f
    pop edi
    pop esi
    mov dword ptr [eax*4 + 0x101cea68], ebx
    pop ebp
    mov eax, ebx
    pop ebx
    ret
FUN_1000cc10 ENDP
END