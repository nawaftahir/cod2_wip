; FUN_100ca5a1 @ 0x100ca5a1 — auto-synthesized
    sub_100c9b18 PROTO C
.CODE
FUN_100ca5a1 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0x10
    and dword ptr [ebp - 4], 0
    mov eax, dword ptr [ecx + 0x100]
    and dword ptr [ebp - 8], 0
    push ebx
    mov ebx, dword ptr [ecx + 0x10]
    push esi
    push edi
    mov edx, dword ptr [eax + 0x10]
    mov esi, dword ptr [ebp - 8]
    mov esi, dword ptr [esi + edx]
    mov edx, dword ptr [ecx + 0x14]
    mov edx, dword ptr [edx + esi*4]
    mov edi, dword ptr [edx + 4]
    mov edi, dword ptr [ebx + edi*4]
    test byte ptr [edi + 4], 1
    je L0
    xor edi, edi
    cmp dword ptr [edx + 0x5c], edi
    je L1
    jmp L2
    xor edi, edi
    mov edx, dword ptr [ebp - 4]
    inc dword ptr [ebp - 4]
    mov dword ptr [ebp + edx*4 - 0x10], esi
    add dword ptr [ebp - 8], 4
    cmp dword ptr [ebp - 8], 8
    jb L3
    cmp dword ptr [ebp - 4], edi
    jne L4
    xor eax, eax
    jmp L5
    mov esi, dword ptr [eax + 8]
    mov eax, dword ptr [ecx + 0x18c]
    push edi
    mov edx, eax
    push edi
    neg edx
    push edi
    sbb edx, edx
    lea ebx, [ecx + 0x190]
    push edi
    and edx, ebx
    neg eax
    push 4
    sbb eax, eax
    lea ebx, [ecx + 0x1a0]
    and eax, ebx
    push eax
    push edx
    push esi
    push dword ptr [ebp - 4]
    lea eax, [ebp - 0x10]
    push eax
    push 0x25
    call sub_100c9b18
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_100ca5a1 ENDP
END