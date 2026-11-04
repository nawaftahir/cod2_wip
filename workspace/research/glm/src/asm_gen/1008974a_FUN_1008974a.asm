; FUN_1008974a @ 0x1008974a — auto-synthesized
    sub_10089714 PROTO C
.CODE
FUN_1008974a PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push edi
    mov edi, dword ptr [ebp + 0x14]
    push edi
    push dword ptr [ebp + 0xc]
    mov esi, ecx
    push dword ptr [ebp + 8]
    call sub_10089714
    and dword ptr [ebp + 0x14], 0
    cmp dword ptr [esi + 0xc], 0
    jbe L0
    push ebx
    mov eax, dword ptr [esi + 0x18]
    mov ecx, dword ptr [ebp + 0x14]
    mov eax, dword ptr [eax + ecx*4]
    xor edx, edx
    cmp dword ptr [eax + 0x24], edx
    jne L1
    cmp dword ptr [eax + 0x14], edx
    jbe L1
    cmp edi, dword ptr [eax + 0x38]
    mov ecx, dword ptr [eax + 0x18]
    mov ecx, dword ptr [ecx + edx*4]
    mov ebx, dword ptr [esi + 0x18]
    mov ecx, dword ptr [ebx + ecx*4]
    jne L2
    cmp dword ptr [ecx + 0x24], 0
    je L3
    mov ecx, dword ptr [ebp + 0x10]
    add dword ptr [ecx], 0xffff0000
    jmp L3
    cmp edi, dword ptr [ecx + 0x38]
    jne L3
    mov ecx, dword ptr [ebp + 0x10]
    add dword ptr [ecx], 0x10000
    inc edx
    cmp edx, dword ptr [eax + 0x14]
    jb L4
    inc dword ptr [ebp + 0x14]
    mov eax, dword ptr [ebp + 0x14]
    cmp eax, dword ptr [esi + 0xc]
    jb L5
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret 0x10
FUN_1008974a ENDP
END