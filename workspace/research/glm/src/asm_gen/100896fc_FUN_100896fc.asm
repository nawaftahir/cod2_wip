; FUN_100896fc @ 0x100896fc — auto-synthesized
.CODE
FUN_100896fc PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    mov eax, dword ptr [ebp + 0x10]
    push esi
    mov esi, dword ptr [ebp + 8]
    cmp dword ptr [esi + 0x38], eax
    mov dword ptr [ebp - 4], ecx
    je L0
    push ebx
    mov ebx, dword ptr [ebp + 0xc]
    push edi
    mov dword ptr [esi + 0x38], eax
    inc dword ptr [ebx]
    xor edi, edi
    cmp dword ptr [esi + 0x14], edi
    jbe L1
    jmp L2
    mov eax, dword ptr [ebp + 0x10]
    mov ecx, dword ptr [ebp - 4]
    mov edx, dword ptr [ecx + 0x18]
    push eax
    mov eax, dword ptr [esi + 0x18]
    mov eax, dword ptr [eax + edi*4]
    push ebx
    push dword ptr [edx + eax*4]
    call L3
    inc edi
    cmp edi, dword ptr [esi + 0x14]
    jb L4
    pop edi
    pop ebx
    pop esi
    leave
    ret 0xc
FUN_100896fc ENDP
END