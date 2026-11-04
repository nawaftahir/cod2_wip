.686
.MODEL FLAT, C
EXTRN sub_1008288C:PROC
EXTRN sub_10099405:PROC
EXTRN sub_1009950D:PROC
EXTRN sub_10099A4A:PROC
EXTRN sub_10099A51:PROC
EXTRN sub_10099AA1:PROC
EXTRN sub_10099AA8:PROC
EXTRN sub_10099AB5:PROC
EXTRN sub_10099ABE:PROC
.CODE
FUN_100999b4 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ebx
    mov mov ebx, dword ptr [ebp + 8]
    push push esi
    mov mov esi, dword ptr [ebp + 12]
    mov mov eax, dword ptr [esi + 16]
    test test dword ptr [ebx + 16], eax
    push push edi
    mov mov edi, ecx
    mov mov dword ptr [ebp - 4], edi
    je L0
    push push 01011473Ch
    push push 0BE8h
    lea lea eax, [edi + 32]
    push push eax
    push push edi
    call sub_1009950D
    add add esp, 16
    cmp cmp dword ptr [ebx + 20], 0
    je sub_10099A4A
    mov mov eax, dword ptr [esi + 20]
    test test eax, eax
    je sub_10099A51
    push push 8
    pop pop ecx
    push push 01010C5E8h
    push push dword ptr [ebp - 4]
    lea lea esi, [eax + 16]
    add add edi, 32
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    call sub_10099405
    mov mov esi, dword ptr [ebp + 12]
    pop pop ecx
    pop pop ecx
    mov mov eax, dword ptr [esi + 16]
    or or dword ptr [ebx + 16], eax
    cmp cmp dword ptr [ebx + 20], 0
    jne sub_10099AA1
    mov mov esi, dword ptr [esi + 20]
    test test esi, esi
    je sub_10099AA8
    push push esi
    call sub_1008288C
    test test eax, eax
    mov mov dword ptr [ebx + 20], eax
    jne sub_10099AB5
    mov mov eax, 08007000Eh
    jmp sub_10099ABE
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 8
FUN_100999b4 ENDP
END
