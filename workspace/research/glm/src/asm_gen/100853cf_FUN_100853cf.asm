; FUN_100853cf @ 0x100853cf — auto-synthesized
.CODE
FUN_100853cf PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ecx]
    and eax, 0xfffff
    mov edx, eax
    imul edx, dword ptr [ebp + 8]
    push esi
    lea esi, [edx + eax]
    cmp esi, dword ptr [ecx + 4]
    jbe L0
    mov eax, dword ptr [ebp + 0xc]
    test eax, eax
    je L1
    and dword ptr [eax], 0
    xor eax, eax
    jmp L2
    mov esi, dword ptr [ebp + 0xc]
    test esi, esi
    je L2
    mov ecx, dword ptr [ecx + 8]
    lea ecx, [ecx + edx*4]
    mov dword ptr [esi], ecx
    pop esi
    pop ebp
    ret 8
FUN_100853cf ENDP
END