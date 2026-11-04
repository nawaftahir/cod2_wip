.686
.MODEL FLAT, C
EXTRN sub_1006C508:PROC
EXTRN sub_100853A4:PROC
EXTRN sub_10085419:PROC
EXTRN sub_10085834:PROC
EXTRN sub_100858B1:PROC
EXTRN sub_10085BA3:PROC
EXTRN sub_100861E9:PROC
EXTRN sub_100C10CB:PROC
EXTRN sub_100C10DF:PROC
EXTRN sub_100C10F2:PROC
EXTRN sub_100C1105:PROC
EXTRN sub_100C1120:PROC
EXTRN sub_100C115C:PROC
EXTRN sub_100C115D:PROC
EXTRN sub_100C116F:PROC
.CODE
FUN_100c0faf PROC
    mov mov edi, edi
    push push esi
    mov mov esi, ecx
    mov mov eax, dword ptr [esi + 0100h]
    cmp cmp dword ptr [eax], 050000002h
    je L0
    xor xor eax, eax
    inc inc eax
    pop pop esi
    ret ret
    push push edi
    push push 116
    call sub_10085834
    test test eax, eax
    je L1
    mov mov ecx, eax
    call sub_100853A4
L0:
    mov mov edi, eax
    jmp L2
    xor xor edi, edi
    test test edi, edi
    push push ebx
    jne L3
    mov mov ebx, 08007000Eh
    jmp sub_100C10DF
    push push 0
    push push 1
    push push 6
    push push 070800002h
    mov mov ecx, edi
    call sub_100858B1
    mov mov ebx, eax
    test test ebx, ebx
    jl sub_100C10F2
    push push dword ptr [esi + 0100h]
    mov mov ecx, edi
    call sub_10085419
    mov mov ebx, eax
    test test ebx, ebx
    jl sub_100C1105
    mov mov eax, dword ptr [esi + 0100h]
    mov mov eax, dword ptr [eax + 16]
    mov mov eax, dword ptr [eax]
    mov mov ecx, dword ptr [edi + 16]
    mov mov dword ptr [ecx], eax
    xor xor eax, eax
    mov mov ecx, dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [ecx + 8]
    mov mov ecx, dword ptr [eax + ecx]
    mov mov edx, dword ptr [edi + 8]
    mov mov dword ptr [eax + edx], ecx
    add add eax, 4
    cmp cmp eax, 16
    jb sub_100C10CB
    push push ecx
    fldz fldz
    push push ecx
    fstp fstp qword ptr [esp]
    push push 0
    push push 0
    push push dword ptr [esi + 120]
    mov mov ecx, esi
    call sub_100861E9
    cmp cmp eax, -1
    jne sub_100C1120
    mov mov eax, 08007000Eh
    jmp sub_100C115D
    mov mov ecx, dword ptr [edi + 8]
    mov mov dword ptr [ecx + 16], eax
    mov mov ecx, dword ptr [edi + 8]
    mov mov dword ptr [ecx + 20], eax
    mov mov eax, dword ptr [esi]
    push push edi
    mov mov ecx, esi
    call call dword ptr [eax + 48]
    test test eax, eax
    je sub_100C115C
    xor xor ebx, ebx
    inc inc ebx
    jmp sub_100C116F
    mov mov ecx, dword ptr [esi + 0100h]
    push push edi
    call sub_10085BA3
    mov mov ebx, eax
    push push 1
    mov mov ecx, edi
    call sub_1006C508
    mov mov eax, ebx
    pop pop ebx
    pop pop edi
    pop pop esi
    ret ret
FUN_100c0faf ENDP
END
