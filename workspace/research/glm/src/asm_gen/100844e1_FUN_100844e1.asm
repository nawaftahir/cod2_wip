; FUN_100844e1 @ 0x100844e1 — auto-synthesized
    sub_10084186 PROTO C
    sub_100f789e PROTO C
    sub_100f791b PROTO C
.CODE
FUN_100844e1 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    mov eax, dword ptr [ebp + 0x14]
    push edi
    xor edi, edi
    cmp dword ptr [eax + 4], 0xd
    mov dword ptr [ebp - 4], edi
    jne L0
    push esi
    mov esi, dword ptr [eax + 0x20]
    cmp dword ptr [esi + 4], 1
    jne L1
    push ebx
    mov ebx, dword ptr [ebp + 0xc]
    shl ebx, 4
    push ebx
    call sub_100f789e
    mov edi, eax
    test edi, edi
    pop ecx
    mov dword ptr [ebp - 4], edi
    jne L2
    mov edi, 0x8007000e
    jmp L3
    mov ecx, ebx
    mov edx, ecx
    shr ecx, 2
    xor eax, eax
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    mov eax, dword ptr [ebp + 0xc]
    test eax, eax
    jbe L4
    mov ecx, dword ptr [ebp - 4]
    mov dword ptr [ebp + 0xc], ecx
    mov dword ptr [ebp + 0x14], eax
    mov edi, dword ptr [ebp + 0x10]
    test edi, edi
    jbe L5
    mov ecx, dword ptr [ebp + 0xc]
    mov eax, dword ptr [esi + 8]
    mov edx, dword ptr [eax + 0x10]
    cmp edx, 3
    jne L6
    fld qword ptr [eax + 0x18]
    fstp dword ptr [ecx]
    jmp L7
    mov eax, dword ptr [eax + 0x18]
    mov dword ptr [ecx], eax
    mov esi, dword ptr [esi + 0xc]
    add ecx, 4
    dec edi
    jne L8
    add dword ptr [ebp + 0xc], 0x10
    dec dword ptr [ebp + 0x14]
    jne L9
    push dword ptr [ebp + 0x18]
    mov ecx, dword ptr [ebp + 8]
    push 6
    push ebx
    push dword ptr [ebp - 4]
    call sub_10084186
    mov edi, eax
    pop ebx
    push dword ptr [ebp - 4]
    call sub_100f791b
    pop ecx
    mov eax, edi
    pop esi
    jmp L10
    xor eax, eax
    pop edi
    leave
    ret 0x14
FUN_100844e1 ENDP
END