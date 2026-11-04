.686
.MODEL FLAT, C
EXTRN sub_10067C7D:PROC
.CODE
FUN_10064392 PROC
    mov edi, edi
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 000000268h]
    mov eax, dword ptr [eax + 56]
    xor edx, edx
    cmp eax, edx
    jne L0
    push 01010C6C8h
    push 0000005E5h
    jmp L1
L0:
    cmp dword ptr [eax + 8], edx
    je L2
    push 01010C6A4h
    push 0000005EAh
L1:
    lea eax, [esi + 000000278h]
    push eax
    lea eax, [esi + 24]
    push eax
    call sub_10067C7D
    add esp, 16
    mov dword ptr [esi + 68], 1
    mov eax, 080004005h
    pop esi
    ret
L2:
    xor ecx, ecx
    inc ecx
    cmp dword ptr [eax], edx
    jne L3
    cmp dword ptr [eax + 4], edx
    je L3
    mov edx, ecx
L3:
    mov dword ptr [esi + 84], edx
    mov dword ptr [eax], ecx
    mov dword ptr [eax + 8], ecx
    xor eax, eax
    pop esi
    ret
FUN_10064392 ENDP
END
