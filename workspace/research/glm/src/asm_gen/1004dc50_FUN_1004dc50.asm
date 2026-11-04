; FUN_1004dc50 @ 0x1004dc50 — auto-synthesized
.CODE
FUN_1004dc50 PROC
    mov eax, dword ptr [esi]
    push ebx
    mov dword ptr [eax + 0x14], 0x66
    mov ecx, dword ptr [esi]
    push 1
    push esi
    call dword ptr [ecx + 4]
    mov edx, dword ptr [esi + 0x19c]
    mov al, byte ptr [edx + 0xc]
    xor ebx, ebx
    add esp, 8
    cmp al, bl
    je L0
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 0x14], 0x3d
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    add esp, 4
    lea eax, [esi + 0xe2]
    mov ecx, 0x10
    mov dl, 5
    mov byte ptr [eax - 0x10], bl
    mov byte ptr [eax], 1
    mov byte ptr [eax + 0x10], dl
    inc eax
    dec ecx
    jne L1
    mov edx, dword ptr [esi + 0x19c]
    mov dword ptr [esi + 0x104], ebx
    mov dword ptr [esi + 0x30], ebx
    mov byte ptr [esi + 0x112], bl
    mov byte ptr [esi + 0x108], bl
    mov byte ptr [esi + 0x10b], bl
    mov byte ptr [esi + 0x110], bl
    mov byte ptr [esi + 0x111], bl
    mov byte ptr [esi + 0x109], 1
    mov byte ptr [esi + 0x10a], 1
    mov word ptr [esi + 0x10c], 1
    mov word ptr [esi + 0x10e], 1
    mov byte ptr [edx + 0xc], 1
    mov al, 1
    pop ebx
    ret
FUN_1004dc50 ENDP
END