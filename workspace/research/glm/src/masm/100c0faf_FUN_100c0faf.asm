.686
.MODEL FLAT, C
EXTRN sub_1006C508:PROC
EXTRN sub_100853A4:PROC
EXTRN sub_10085419:PROC
EXTRN sub_10085834:PROC
EXTRN sub_100858B1:PROC
EXTRN sub_10085BA3:PROC
EXTRN sub_100861E9:PROC
.CODE
FUN_100c0faf PROC
    mov edi, edi
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 000000100h]
    cmp dword ptr [eax], 050000002h
    je L0
    xor eax, eax
    inc eax
    pop esi
    ret
L0:
    push edi
    push 116
    call sub_10085834
    test eax, eax
    je L1
    mov ecx, eax
    call sub_100853A4
    mov edi, eax
    jmp L2
L1:
    xor edi, edi
L2:
    test edi, edi
    push ebx
    jne L3
    mov ebx, 08007000Eh
    jmp L8
L3:
    push 0
    push 1
    push 6
    push 070800002h
    mov ecx, edi
    call sub_100858B1
    mov ebx, eax
    test ebx, ebx
    jl L7
    push dword ptr [esi + 000000100h]
    mov ecx, edi
    call sub_10085419
    mov ebx, eax
    test ebx, ebx
    jl L7
    mov eax, dword ptr [esi + 000000100h]
    mov eax, dword ptr [eax + 16]
    mov eax, dword ptr [eax]
    mov ecx, dword ptr [edi + 16]
    mov dword ptr [ecx], eax
    xor eax, eax
L4:
    mov ecx, dword ptr [esi + 000000100h]
    mov ecx, dword ptr [ecx + 8]
    mov ecx, dword ptr [eax + ecx]
    mov edx, dword ptr [edi + 8]
    mov dword ptr [eax + edx], ecx
    add eax, 4
    cmp eax, 16
    jb L4
    push ecx
    fldz
    push ecx
    fstp qword ptr [esp]
    push 0
    push 0
    push dword ptr [esi + 120]
    mov ecx, esi
    call sub_100861E9
    cmp eax, -1
    jne L5
    mov eax, 08007000Eh
    jmp L9
L5:
    mov ecx, dword ptr [edi + 8]
    mov dword ptr [ecx + 16], eax
    mov ecx, dword ptr [edi + 8]
    mov dword ptr [ecx + 20], eax
    mov eax, dword ptr [esi]
    push edi
    mov ecx, esi
    call dword ptr [eax + 0x30]
    test eax, eax
    je L6
    xor ebx, ebx
    inc ebx
    jmp L7
L6:
    mov ecx, dword ptr [esi + 000000100h]
    push edi
    call sub_10085BA3
    mov ebx, eax
L7:
    push 1
    mov ecx, edi
    call sub_1006C508
L8:
    mov eax, ebx
L9:
    pop ebx
    pop edi
    pop esi
    ret
FUN_100c0faf ENDP
END
