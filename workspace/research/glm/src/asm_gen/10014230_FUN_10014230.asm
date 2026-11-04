; FUN_10014230 @ 0x10014230 — auto-synthesized
    sub_10014444 PROTO C
.CODE
FUN_10014230 PROC
    push ebp
    mov ebp, dword ptr [esp + 8]
    push esi
    push edi
    mov edi, eax
    lea esi, [edi + edi + 2]
    cmp esi, ebp
    mov dword ptr [esp + 0x10], edi
    jge L0
    mov eax, esi
    shl eax, 4
    add eax, ebx
    lea ecx, [eax - 0x10]
    push ecx
    push eax
    call dword ptr [esp + 0x2c]
    add esp, 8
    test al, al
    je L1
    dec esi
    mov edx, esi
    shl edx, 4
    shl edi, 4
    add edx, ebx
    mov eax, dword ptr [edx]
    add edi, ebx
    mov dword ptr [edi], eax
    mov ecx, dword ptr [edx + 4]
    mov dword ptr [edi + 4], ecx
    mov eax, dword ptr [edx + 8]
    mov dword ptr [edi + 8], eax
    mov ecx, dword ptr [edx + 0xc]
    mov dword ptr [edi + 0xc], ecx
    mov edi, esi
    lea esi, [esi + esi + 2]
    cmp esi, ebp
    jl L2
    jne L3
    mov edx, ebp
    shl edx, 4
    shl edi, 4
    lea eax, [edx + ebx - 0x10]
    mov ecx, dword ptr [eax]
    add edi, ebx
    mov dword ptr [edi], ecx
    mov edx, dword ptr [eax + 4]
    mov dword ptr [edi + 4], edx
    mov ecx, dword ptr [eax + 8]
    mov dword ptr [edi + 8], ecx
    mov edx, dword ptr [eax + 0xc]
    mov dword ptr [edi + 0xc], edx
    lea edi, [ebp - 1]
    mov eax, dword ptr [esp + 0x24]
    mov edx, dword ptr [esp + 0x14]
    push eax
    mov eax, dword ptr [esp + 0x1c]
    sub esp, 0x10
    mov ecx, esp
    mov dword ptr [ecx], edx
    mov edx, dword ptr [esp + 0x30]
    mov dword ptr [ecx + 4], eax
    mov eax, dword ptr [esp + 0x34]
    mov dword ptr [ecx + 8], edx
    mov dword ptr [ecx + 0xc], eax
    mov ecx, dword ptr [esp + 0x24]
    push ecx
    push ebx
    mov eax, edi
    call sub_10014444
    add esp, 0x1c
    pop edi
    pop esi
    pop ebp
    ret
FUN_10014230 ENDP
END