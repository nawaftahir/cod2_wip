.686
.MODEL FLAT, C
EXTRN sub_10063C2B:PROC
EXTRN sub_10063D03:PROC
EXTRN sub_10063D0F:PROC
EXTRN sub_10063F33:PROC
EXTRN sub_10067CFC:PROC
EXTRN sub_100686EB:PROC
EXTRN sub_100F79B5:PROC
EXTRN sub_100F79F2:PROC
EXTRN fp_1010C040:DWORD
.CODE
FUN_10063fd8 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 000000218h
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 000000298h]
    mov ecx, dword ptr [esi + 00000026Ch]
    push edi
    lea edi, [esi + 000000278h]
    push edi
    or eax, 12
    push eax
    call sub_100686EB
    xor ecx, ecx
    cmp eax, ecx
    jl L21
    mov eax, dword ptr [edi]
    sub eax, 10
    push ebx
    push 1
    pop ebx
    je L2
    dec eax
    je L1
    push 01010C5E8h
    push esi
    call sub_10063F33
    pop ecx
    pop ecx
L0:
    mov eax, 080004005h
    jmp L20
L1:
    mov dword ptr [ebp - 8], ebx
    jmp L3
L2:
    mov dword ptr [ebp - 8], ecx
L3:
    mov edx, dword ptr [esi + 000000270h]
    cmp edx, ecx
    mov eax, dword ptr [esi + 000000280h]
    mov dword ptr [ebp - 4], eax
    jne L4
    mov eax, dword ptr [esi + 00000026Ch]
    cmp dword ptr [eax + 24], ecx
    jne L4
    push 01010C618h
    push 0000005E1h
    push edi
    jmp L6
L4:
    mov eax, dword ptr [esi + 000000268h]
    test eax, eax
    je L7
L5:
    mov eax, dword ptr [eax + 108]
    inc ecx
    test eax, eax
    jne L5
    cmp ecx, 32
    jb L7
    push 01010C5F8h
    push 0000005E2h
    lea eax, [esi + 000000278h]
    push eax
L6:
    lea eax, [esi + 24]
    push eax
    call sub_10067CFC
    add esp, 16
    mov dword ptr [esi + 72], ebx
    mov dword ptr [esi + 68], ebx
    jmp L0
L7:
    test edx, edx
    jne L13
    lea eax, [ebp - 16]
    push eax
    lea eax, [ebp - 000000114h]
    push eax
    mov edi, 000000104h
    push edi
    push dword ptr [ebp - 4]
    call dword ptr [fp_1010C040]
    mov ecx, dword ptr [ebp - 4]
    lea eax, [ebp - 000000114h]
L8:
    mov bl, byte ptr [ecx]
    mov dl, bl
    cmp bl, byte ptr [eax]
    jne L10
    test dl, dl
    je L9
    mov bl, byte ptr [ecx + 1]
    mov dl, bl
    cmp bl, byte ptr [eax + 1]
    jne L10
    inc ecx
    inc ecx
    inc eax
    inc eax
    test dl, dl
    jne L8
L9:
    xor eax, eax
    jmp L11
L10:
    sbb eax, eax
    sbb eax, -1
L11:
    test eax, eax
    je L12
    push dword ptr [ebp - 4]
    mov eax, dword ptr [esi + 000000268h]
    push dword ptr [eax + 96]
    lea eax, [ebp - 000000218h]
    push 010194930h
    push edi
    push eax
    call sub_100F79B5
    add esp, 20
    lea eax, [ebp - 16]
    push eax
    lea eax, [ebp - 000000114h]
    push eax
    push edi
    lea eax, [ebp - 000000218h]
    push eax
    call dword ptr [fp_1010C040]
L12:
    lea eax, [ebp - 000000114h]
    xor ebx, ebx
    mov dword ptr [ebp - 4], eax
    inc ebx
L13:
    mov eax, dword ptr [esi + 000000268h]
    test eax, eax
    je L14
    cmp dword ptr [eax + 88], 0
    je L14
    mov eax, dword ptr [eax + 100]
    mov dword ptr [ebp - 12], eax
    jmp L15
L14:
    and dword ptr [ebp - 12], 0
L15:
    push 112
    call sub_100F79F2
    test eax, eax
    pop ecx
    je L16
    mov ecx, eax
    call sub_10063C2B
    mov edi, eax
    jmp L17
L16:
    xor edi, edi
L17:
    test edi, edi
    jne L18
    mov eax, 08007000Eh
    jmp L20
L18:
    push dword ptr [ebp - 12]
    lea eax, [esi + 24]
    push dword ptr [ebp - 8]
    mov ecx, edi
    push dword ptr [esi + 000000270h]
    push eax
    lea eax, [esi + 000000278h]
    push eax
    push esi
    push 0
    push dword ptr [ebp - 4]
    call sub_10063D0F
    test eax, eax
    mov dword ptr [ebp - 8], eax
    jge L19
    push ebx
    mov ecx, edi
    mov dword ptr [esi + 72], ebx
    mov dword ptr [esi + 68], ebx
    call sub_10063D03
    mov eax, dword ptr [ebp - 8]
    jmp L20
L19:
    mov eax, dword ptr [esi + 000000268h]
    mov dword ptr [edi + 108], eax
    mov dword ptr [esi + 000000268h], edi
    xor eax, eax
L20:
    pop ebx
L21:
    pop edi
    pop esi
    leave
    ret
FUN_10063fd8 ENDP
END
