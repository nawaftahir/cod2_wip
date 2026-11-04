; FUN_100b9975 @ 0x100b9975 — auto-synthesized
.CODE
FUN_100b9975 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    xor edx, edx
    cmp dword ptr [ebp + 0xc], edx
    push esi
    jbe L0
    xor ecx, ecx
    cmp dword ptr [ebp + 0x14], ecx
    jbe L1
    mov eax, dword ptr [ebp + 8]
    mov eax, dword ptr [eax + edx*4]
    mov esi, dword ptr [ebp + 0x10]
    cmp eax, dword ptr [esi + ecx*4]
    je L2
    inc ecx
    cmp ecx, dword ptr [ebp + 0x14]
    jb L3
    inc edx
    cmp edx, dword ptr [ebp + 0xc]
    jb L4
    xor eax, eax
    pop esi
    pop ebp
    ret 0x10
    xor eax, eax
    inc eax
    jmp L5
FUN_100b9975 ENDP
END