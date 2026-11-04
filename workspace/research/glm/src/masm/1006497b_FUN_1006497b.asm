.686
.MODEL FLAT, C
EXTRN sub_10067A94:PROC
EXTRN sub_100686E4:PROC
EXTRN sub_10068726:PROC
EXTRN sub_1006875A:PROC
EXTRN sub_10068795:PROC
EXTRN sub_100687CF:PROC
EXTRN sub_10068810:PROC
EXTRN sub_1006884E:PROC
EXTRN sub_100688E8:PROC
EXTRN sub_10068929:PROC
EXTRN sub_100F7AEE:PROC
EXTRN sub_100F7BA2:PROC
EXTRN g_1010C728:DWORD
.CODE
FUN_1006497b PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 52
    push ebx
    mov ebx, ecx
    mov ecx, dword ptr [ebx + 00000026Ch]
    push esi
    lea esi, [ebx + 000000278h]
    push esi
    push dword ptr [ebx + 000000298h]
    call sub_100686E4
    test eax, eax
    jl L17
    cmp dword ptr [esi], 1
    push edi
    jne L14
    push 2
    lea esi, [ebx + 000000280h]
    mov edi, 010195544h
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L14
    mov ecx, dword ptr [ebx + 00000026Ch]
    lea esi, [ebx + 000000278h]
    push esi
    push dword ptr [ebx + 000000298h]
    call sub_10068726
    test eax, eax
    jl L16
    cmp dword ptr [esi], 9
    jne L14
    mov ecx, dword ptr [ebx + 00000026Ch]
    lea edi, [ebx + 000000278h]
    push edi
    push dword ptr [ebx + 000000298h]
    lea esi, [ebx + 000000280h]
    mov eax, dword ptr [esi]
    mov dword ptr [ebp - 12], eax
    call sub_1006875A
    test eax, eax
    jl L16
    cmp dword ptr [edi], 1
    jne L14
    push 2
    mov edi, 01019581Ch
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L14
    mov ecx, dword ptr [ebx + 00000026Ch]
    lea esi, [ebx + 000000278h]
    push esi
    push dword ptr [ebx + 000000298h]
    call sub_10068795
    test eax, eax
    jl L16
    cmp dword ptr [esi], 9
    jne L14
    mov eax, dword ptr [ebx + 000000280h]
    and dword ptr [ebp - 4], 0
    mov dword ptr [ebp - 16], eax
L0:
    mov ecx, dword ptr [ebx + 00000026Ch]
    and dword ptr [ebp - 8], 0
    lea esi, [ebx + 000000278h]
    push esi
    push dword ptr [ebx + 000000298h]
    call sub_100687CF
    test eax, eax
    jl L16
    cmp dword ptr [esi], 1
    jne L14
    push 2
    mov edi, 01019581Ch
    lea esi, [ebx + 000000280h]
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L14
    mov ecx, dword ptr [ebx + 00000026Ch]
    lea esi, [ebx + 000000278h]
    push esi
    push dword ptr [ebx + 000000298h]
    call sub_10068810
    test eax, eax
    jl L16
    xor eax, eax
    inc eax
    cmp dword ptr [esi], eax
    jne L1
    push 2
    mov edi, 01010C730h
    lea esi, [ebx + 000000280h]
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L1
    mov ecx, dword ptr [ebx + 00000026Ch]
    mov dword ptr [ebp - 8], eax
    lea eax, [ebx + 000000278h]
    push eax
    push dword ptr [ebx + 000000298h]
    call sub_1006884E
    test eax, eax
    jl L16
L1:
    mov eax, dword ptr [ebx + 000000278h]
    cmp eax, 2
    je L3
    cmp eax, 3
    je L2
    cmp eax, 4
    je L3
    jle L14
    cmp eax, 8
    jg L14
    mov eax, dword ptr [ebp - 4]
    fld qword ptr [ebx + 000000280h]
    lea eax, [ebp + eax*8 - 52]
    jmp L4
L2:
    mov eax, dword ptr [ebp - 4]
    fild dword ptr [ebx + 000000280h]
    lea eax, [ebp + eax*8 - 52]
    jmp L4
L3:
    mov ecx, dword ptr [ebx + 000000280h]
    fild dword ptr [ebx + 000000280h]
    test ecx, ecx
    mov eax, dword ptr [ebp - 4]
    lea eax, [ebp + eax*8 - 52]
    jge L4
    fadd qword ptr [g_1010C728]
L4:
    cmp dword ptr [ebp - 8], 0
    fstp qword ptr [eax]
    je L5
    fld qword ptr [eax]
    fchs
    fstp qword ptr [eax]
L5:
    inc dword ptr [ebp - 4]
    cmp dword ptr [ebp - 4], 4
    jb L0
    mov ecx, dword ptr [ebx + 00000026Ch]
    lea esi, [ebx + 000000278h]
    push esi
    push dword ptr [ebx + 000000298h]
    call sub_100688E8
    test eax, eax
    jl L16
    cmp dword ptr [esi], 1
    jne L14
    push 2
    mov edi, 010195540h
    lea esi, [ebx + 000000280h]
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L14
    mov ecx, dword ptr [ebx + 00000026Ch]
    lea esi, [ebx + 000000278h]
    push esi
    push dword ptr [ebx + 000000298h]
    call sub_10068929
    test eax, eax
    jl L16
    mov esi, dword ptr [esi]
    cmp esi, 12
    je L6
    cmp esi, 13
    jne L14
L6:
    push 48
    call sub_100F7AEE
    test eax, eax
    pop ecx
    je L7
    and dword ptr [eax + 40], 0
    mov dword ptr [ebp - 4], eax
    jmp L8
L7:
    and dword ptr [ebp - 4], 0
    mov eax, dword ptr [ebp - 4]
L8:
    test eax, eax
    jne L9
    mov eax, 08007000Eh
    jmp L16
L9:
    mov ecx, dword ptr [ebp - 12]
    mov dword ptr [eax], ecx
    mov ecx, dword ptr [ebp - 16]
    mov dword ptr [eax + 4], ecx
    push 8
    lea edi, [eax + 8]
    pop ecx
    lea esi, [ebp - 52]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    lea esi, [ebx + 60]
    mov ecx, dword ptr [esi]
    test ecx, ecx
    je L13
    jmp L11
L10:
    mov eax, dword ptr [ebp - 4]
L11:
    push dword ptr [eax + 4]
    push dword ptr [ecx + 4]
    call sub_100F7BA2
    test eax, eax
    pop ecx
    pop ecx
    jge L12
    mov esi, dword ptr [esi]
    add esi, 40
    mov ecx, dword ptr [esi]
    test ecx, ecx
    jne L10
L12:
    mov eax, dword ptr [ebp - 4]
L13:
    mov ecx, dword ptr [esi]
    mov dword ptr [eax + 40], ecx
    mov dword ptr [esi], eax
    jmp L15
L14:
    mov eax, dword ptr [ebx + 000000278h]
    cmp eax, 12
    je L15
    cmp eax, 13
    je L15
    mov ecx, dword ptr [ebx + 00000026Ch]
    call sub_10067A94
L15:
    xor eax, eax
L16:
    pop edi
L17:
    pop esi
    mov dword ptr [ebx + 64], 1
    pop ebx
    leave
    ret
FUN_1006497b ENDP
END
