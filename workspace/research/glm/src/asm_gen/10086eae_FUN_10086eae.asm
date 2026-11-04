; FUN_10086eae @ 0x10086eae — auto-synthesized
    sub_1006c43d PROTO C
.CODE
FUN_10086eae PROC
    mov edi, edi
    push ebx
    push esi
    push edi
    mov esi, ecx
    xor edi, edi
    xor ebx, ebx
    cmp dword ptr [esi + 0xc], edi
    jbe L0
    mov eax, dword ptr [esi + 0x18]
    mov ecx, dword ptr [eax + edi*4]
    test word ptr [ecx + 2], 0xfff0
    jne L1
    push 1
    call sub_1006c43d
    jmp L2
    mov dword ptr [eax + ebx*4], ecx
    inc ebx
    inc edi
    cmp edi, dword ptr [esi + 0xc]
    jb L3
    mov ecx, dword ptr [esi + 0xc]
    xor eax, eax
    cmp ebx, ecx
    jne L4
    inc eax
    jmp L5
    mov edx, dword ptr [esi + 0x18]
    sub ecx, ebx
    shl ecx, 2
    lea edi, [edx + ebx*4]
    mov edx, ecx
    shr ecx, 2
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    mov dword ptr [esi + 0xc], ebx
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    ret
FUN_10086eae ENDP
END