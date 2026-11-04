.686
.MODEL FLAT, C
.CODE
FUN_10044e40 PROC
    mov eax, dword ptr [esi + 32]
    mov ecx, dword ptr [eax]
    mov byte ptr [ecx], 0000000FFh
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
    mov dword ptr [edx + 20], 24
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
L0:
    mov eax, dword ptr [esi + 32]
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
    mov dword ptr [eax + 20], 24
    mov ecx, dword ptr [esi]
    mov dword ptr [esp + 4], esi
    jmp dword ptr [ecx]
L1:
    ret
FUN_10044e40 ENDP
END
