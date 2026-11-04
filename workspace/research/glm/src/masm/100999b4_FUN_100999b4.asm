.686
.MODEL FLAT, C
EXTRN sub_1008288C:PROC
EXTRN sub_10099405:PROC
EXTRN sub_1009950D:PROC
.CODE
FUN_100999b4 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    mov ebx, dword ptr [ebp + 8]
    push esi
    mov esi, dword ptr [ebp + 12]
    mov eax, dword ptr [esi + 16]
    test dword ptr [ebx + 16], eax
    push edi
    mov edi, ecx
    mov dword ptr [ebp - 4], edi
    je L0
    push 01011473Ch
    push 000000BE8h
    lea eax, [edi + 32]
    push eax
    push edi
    call sub_1009950D
    add esp, 16
L0:
    cmp dword ptr [ebx + 20], 0
    je L1
    mov eax, dword ptr [esi + 20]
    test eax, eax
    je L1
    push 8
    pop ecx
    push 01010C5E8h
    push dword ptr [ebp - 4]
    lea esi, [eax + 16]
    add edi, 32
    rep movsd dword ptr es:[edi], dword ptr [esi]
    call sub_10099405
    mov esi, dword ptr [ebp + 12]
    pop ecx
    pop ecx
L1:
    mov eax, dword ptr [esi + 16]
    or dword ptr [ebx + 16], eax
    cmp dword ptr [ebx + 20], 0
    jne L2
    mov esi, dword ptr [esi + 20]
    test esi, esi
    je L2
    push esi
    call sub_1008288C
    test eax, eax
    mov dword ptr [ebx + 20], eax
    jne L2
    mov eax, 08007000Eh
    jmp L3
L2:
    xor eax, eax
L3:
    pop edi
    pop esi
    pop ebx
    leave
    ret 8
FUN_100999b4 ENDP
END
