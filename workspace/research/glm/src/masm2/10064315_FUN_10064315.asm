.686
.MODEL FLAT, C
EXTRN sub_100643D3:PROC
EXTRN sub_100643D7:PROC
EXTRN sub_100643DC:PROC
EXTRN sub_100643E0:PROC
EXTRN sub_100643E3:PROC
EXTRN sub_100643FB:PROC
EXTRN sub_10067C80:PROC
.CODE
FUN_10064315 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push esi
    mov mov esi, ecx
    mov mov eax, dword ptr [esi + 0268h]
    mov mov eax, dword ptr [eax + 56]
    xor xor edx, edx
    cmp cmp eax, edx
    jne L0
    push push 01010C690h
    push push 05E4h
    jmp L1
    cmp cmp dword ptr [eax + 8], edx
    je L2
    push push 01010C66Ch
    push push 05E9h
    lea lea eax, [esi + 0278h]
    push push eax
    lea lea eax, [esi + 24]
    push push eax
    call sub_10067C80
    add add esp, 16
    mov mov dword ptr [esi + 68], 1
    mov mov eax, 080004005h
    jmp sub_100643E0
    cmp cmp dword ptr [ebp + 8], edx
    je sub_100643D3
    cmp cmp dword ptr [eax], edx
    jne sub_100643D7
    cmp cmp dword ptr [eax + 4], edx
    je sub_100643DC
    xor xor ecx, ecx
    inc inc ecx
    jmp sub_100643E3
    xor xor ecx, ecx
    cmp cmp dword ptr [ebp + 8], edx
    mov mov dword ptr [esi + 84], ecx
    je sub_100643FB
    mov mov dword ptr [eax], 1
    xor xor eax, eax
    pop pop esi
    pop pop ebp
    ret ret 4
FUN_10064315 ENDP
END
