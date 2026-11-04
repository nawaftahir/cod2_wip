; FUN_1004a130 @ 0x1004a130 — auto-synthesized
    sub_1004a201 PROTO C
.CODE
FUN_1004a130 PROC
    mov eax, dword ptr [esi + 0x14]
    cmp eax, 0xc8
    je L0
    cmp eax, 0xc9
    je L0
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 0x14], 0x14
    mov ecx, dword ptr [esi]
    mov edx, dword ptr [esi + 0x14]
    mov dword ptr [ecx + 0x18], edx
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
    mov eax, esi
    call sub_1004a201
    mov ecx, eax
    dec ecx
    je L1
    dec ecx
    jne L2
    mov al, byte ptr [esp + 4]
    test al, al
    je L3
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 0x14], 0x33
    mov edx, dword ptr [esi]
    push esi
    call dword ptr [edx]
    add esp, 4
    mov eax, dword ptr [esi + 4]
    test eax, eax
    je L4
    push 1
    push esi
    call dword ptr [eax + 0x24]
    mov al, byte ptr [esi + 0x10]
    add esp, 8
    test al, al
    je L5
    mov dword ptr [esi + 0x14], 0xc8
    mov dword ptr [esi + 0x114], 0
    mov eax, 2
    ret
    mov dword ptr [esi + 0x14], 0x64
    mov eax, 2
    ret
    mov eax, 1
    ret
FUN_1004a130 ENDP
END