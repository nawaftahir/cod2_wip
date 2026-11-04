; FUN_10044e40 @ 0x10044e40 — auto-synthesized
.CODE
FUN_10044e40 PROC
    mov eax, dword ptr [esi + 0x20]
    mov ecx, dword ptr [eax]
    mov byte ptr [ecx], 0xff
    mov edx, dword ptr [eax]
    mov ecx, dword ptr [eax + 4]
    inc edx
    dec ecx
    mov dword ptr [eax], edx
    mov dword ptr [eax + 4], ecx
    jne L0
    push esi
    call dword ptr [eax + 0xc]
    add esp, 4
    test al, al
    jne L0
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 0x14], 0x18
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
    mov eax, dword ptr [esi + 0x20]
    mov ecx, dword ptr [eax]
    mov dl, byte ptr [esp + 4]
    mov byte ptr [ecx], dl
    mov edx, dword ptr [eax]
    mov ecx, dword ptr [eax + 4]
    inc edx
    dec ecx
    mov dword ptr [eax], edx
    mov dword ptr [eax + 4], ecx
    jne L1
    push esi
    call dword ptr [eax + 0xc]
    add esp, 4
    test al, al
    jne L1
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 0x14], 0x18
    mov ecx, dword ptr [esi]
    mov dword ptr [esp + 4], esi
    jmp dword ptr [ecx]
    ret
FUN_10044e40 ENDP
END