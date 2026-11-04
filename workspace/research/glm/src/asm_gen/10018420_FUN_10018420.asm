; FUN_10018420 @ 0x10018420 — auto-synthesized
    EXTRN g_101aac70:DWORD
    sub_1005f3f3 PROTO C
    sub_1005f6d3 PROTO C
.CODE
FUN_10018420 PROC
    mov eax, dword ptr [g_101aac70]
    imul eax, eax, 0x45c
    add eax, 0x101a66b0
    mov dl, byte ptr [eax + 0x404]
    test dl, dl
    je L0
    mov edx, dword ptr [eax + 0x418]
    mov byte ptr [eax + 0x404], 0
    mov dword ptr [ecx], edx
    mov edx, dword ptr [eax + 0x414]
    mov dword ptr [eax + 0x400], edx
    push ebp
    push esi
    push edi
    push ecx
    mov eax, 1
    call sub_1005f6d3
    mov esi, dword ptr [ebx]
    add esp, 4
    xor edi, edi
    test esi, esi
    mov ebp, eax
    je L1
    mov ecx, ebp
    mov al, byte ptr [ecx]
    mov dl, al
    cmp al, byte ptr [esi]
    jne L2
    test dl, dl
    je L3
    mov al, byte ptr [ecx + 1]
    mov dl, al
    cmp al, byte ptr [esi + 1]
    jne L2
    add ecx, 2
    add esi, 2
    test dl, dl
    jne L4
    xor ecx, ecx
    jmp L5
    sbb ecx, ecx
    sbb ecx, -1
    test ecx, ecx
    je L6
    mov esi, dword ptr [ebx + edi*8 + 8]
    inc edi
    test esi, esi
    jne L7
    push ebp
    push 0x10195888
    call sub_1005f3f3
    add esp, 8
    pop edi
    pop esi
    xor eax, eax
    pop ebp
    ret
    lea eax, [ebx + edi*8]
    pop edi
    pop esi
    pop ebp
    ret
FUN_10018420 ENDP
END