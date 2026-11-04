; FUN_100cba4c @ 0x100cba4c — auto-synthesized
    sub_100cba3b PROTO C
.CODE
FUN_100cba4c PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ecx + 4]
    mov edx, dword ptr [eax + 0x14]
    mov eax, dword ptr [eax + 0x10]
    push esi
    mov esi, dword ptr [ebp + 0xc]
    mov edx, dword ptr [edx + esi*4]
    mov esi, dword ptr [edx + 4]
    mov eax, dword ptr [eax + esi*4]
    test byte ptr [eax + 4], 0x20
    mov esi, dword ptr [ebp + 8]
    jne L0
    cmp dword ptr [edx + 0x5c], 0
    je L0
    mov eax, dword ptr [ecx + 0x24]
    test eax, eax
    je L1
    push ebx
    mov ebx, dword ptr [ecx + 0x1c]
    push edi
    mov edi, dword ptr [ecx + 0x20]
    shl esi, 2
    mov edi, dword ptr [edi + esi]
    add edi, dword ptr [ebx + esi]
    mov esi, dword ptr [ebp + 0xc]
    mov dword ptr [eax + edi*4], esi
    mov esi, dword ptr [ebp + 8]
    pop edi
    pop ebx
    mov eax, dword ptr [ecx + 0x1c]
    lea eax, [eax + esi*4]
    inc dword ptr [eax]
    mov edx, dword ptr [edx + 0x14]
    cmp edx, -1
    je L2
    push edx
    push esi
    call sub_100cba3b
    pop esi
    pop ebp
    ret 8
FUN_100cba4c ENDP
END