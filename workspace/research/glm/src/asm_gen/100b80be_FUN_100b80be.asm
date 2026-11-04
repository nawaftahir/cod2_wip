; FUN_100b80be @ 0x100b80be — auto-synthesized
.CODE
FUN_100b80be PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    mov eax, dword ptr [ebp + 8]
    mov edx, dword ptr [eax + 4]
    and dword ptr [ebp - 4], 0
    test edx, edx
    push ebx
    push esi
    push edi
    mov dword ptr [ebp + 8], edx
    jbe L0
    mov esi, dword ptr [ecx + 0x14]
    mov edi, dword ptr [ecx + 0x88]
    mov edx, dword ptr [eax + 8]
    mov eax, dword ptr [edx]
    mov eax, dword ptr [esi + eax*4]
    cmp edi, dword ptr [eax + 4]
    jne L1
    mov eax, dword ptr [eax + 0x50]
    cmp eax, dword ptr [ebp + 0xc]
    jae L1
    mov ebx, dword ptr [ecx + 0x18]
    mov eax, dword ptr [ebx + eax*4]
    test word ptr [eax + 2], 0xfff0
    jne L2
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    add edx, 4
    cmp eax, dword ptr [ebp + 8]
    jb L3
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    leave
    ret 8
    xor eax, eax
    inc eax
    jmp L4
FUN_100b80be ENDP
END