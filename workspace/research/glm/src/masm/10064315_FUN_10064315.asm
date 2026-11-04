.686
.MODEL FLAT, C
EXTRN sub_10067C80:PROC
.CODE
FUN_10064315 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 000000268h]
    mov eax, dword ptr [eax + 56]
    xor edx, edx
    cmp eax, edx
    jne L0
    push 01010C690h
    push 0000005E4h
    jmp L1
L0:
    cmp dword ptr [eax + 8], edx
    je L2
    push 01010C66Ch
    push 0000005E9h
L1:
    lea eax, [esi + 000000278h]
    push eax
    lea eax, [esi + 24]
    push eax
    call sub_10067C80
    add esp, 16
    mov dword ptr [esi + 68], 1
    mov eax, 080004005h
    jmp L6
L2:
    cmp dword ptr [ebp + 8], edx
    je L3
    cmp dword ptr [eax], edx
    jne L3
    cmp dword ptr [eax + 4], edx
    je L3
    xor ecx, ecx
    inc ecx
    jmp L4
L3:
    xor ecx, ecx
L4:
    cmp dword ptr [ebp + 8], edx
    mov dword ptr [esi + 84], ecx
    je L5
    mov dword ptr [eax], 1
L5:
    xor eax, eax
L6:
    pop esi
    pop ebp
    ret 4
FUN_10064315 ENDP
END
