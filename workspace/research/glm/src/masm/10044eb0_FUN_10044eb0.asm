.686
.MODEL FLAT, C
.CODE
FUN_10044eb0 PROC
    mov eax, dword ptr [esi + 32]
    mov edx, dword ptr [eax]
    mov ecx, ebx
    sar ecx, 8
    mov byte ptr [edx], cl
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
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], 24
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    add esp, 4
L0:
    mov eax, dword ptr [esi + 32]
    mov edx, dword ptr [eax]
    mov byte ptr [edx], bl
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
    push esi
    call dword ptr [ecx]
    pop ecx
L1:
    ret
FUN_10044eb0 ENDP
END
