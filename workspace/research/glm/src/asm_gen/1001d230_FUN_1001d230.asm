; FUN_1001d230 @ 0x1001d230 — auto-synthesized
.CODE
FUN_1001d230 PROC
    sub esp, 0xc
    push ebx
    push ebp
    push edi
    push esi
    mov ebx, eax
    call dword ptr [esp + 0x20]
    add esp, 8
    test al, al
    je L0
    mov ecx, esi
    mov eax, dword ptr [ecx]
    mov edx, dword ptr [ecx + 4]
    mov ecx, dword ptr [ecx + 8]
    mov dword ptr [esp + 0xc], edx
    mov dword ptr [esp + 0x10], ecx
    mov edx, edi
    mov ebp, dword ptr [edx]
    mov ecx, esi
    mov dword ptr [ecx], ebp
    mov ebp, dword ptr [edx + 4]
    mov dword ptr [ecx + 4], ebp
    mov edx, dword ptr [edx + 8]
    mov dword ptr [ecx + 8], edx
    mov edx, dword ptr [esp + 0xc]
    mov ecx, edi
    mov dword ptr [ecx], eax
    mov eax, dword ptr [esp + 0x10]
    mov dword ptr [ecx + 4], edx
    mov dword ptr [ecx + 8], eax
    push esi
    push ebx
    call dword ptr [esp + 0x20]
    add esp, 8
    test al, al
    je L1
    mov edx, ebx
    mov eax, dword ptr [edx]
    mov ecx, dword ptr [edx + 4]
    mov edx, dword ptr [edx + 8]
    mov dword ptr [esp + 0x10], edx
    mov edx, esi
    mov ebp, dword ptr [edx]
    mov dword ptr [ebx], ebp
    mov ebp, dword ptr [edx + 4]
    mov dword ptr [ebx + 4], ebp
    mov edx, dword ptr [edx + 8]
    mov dword ptr [ebx + 8], edx
    mov edx, esi
    mov dword ptr [edx], eax
    mov eax, dword ptr [esp + 0x10]
    mov dword ptr [edx + 4], ecx
    mov dword ptr [edx + 8], eax
    push edi
    push esi
    call dword ptr [esp + 0x20]
    add esp, 8
    test al, al
    je L2
    mov edx, esi
    mov eax, dword ptr [edx]
    mov ecx, dword ptr [edx + 4]
    mov edx, dword ptr [edx + 8]
    mov ebx, edi
    mov ebp, dword ptr [ebx]
    mov dword ptr [esi], ebp
    mov ebp, dword ptr [ebx + 4]
    mov dword ptr [esi + 4], ebp
    mov ebx, dword ptr [ebx + 8]
    mov dword ptr [esi + 8], ebx
    mov dword ptr [edi], eax
    mov dword ptr [edi + 4], ecx
    mov dword ptr [edi + 8], edx
    pop ebp
    pop ebx
    add esp, 0xc
    ret
FUN_1001d230 ENDP
END