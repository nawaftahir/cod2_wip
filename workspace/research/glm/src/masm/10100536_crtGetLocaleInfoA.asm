.686
.MODEL FLAT, C
EXTRN sub_100F5EC3:PROC
EXTRN fp_1010C190:DWORD
.CODE
crtGetLocaleInfoA PROC
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi
    push 26
    xor esi, esi
    pop edi
L0:
    mov ebx, dword ptr [ebp + 20]
    lea eax, [edi + esi]
    cdq
    sub eax, edx
    sar eax, 1
    mov ecx, eax
    imul ecx, ecx, 44
    mov ecx, dword ptr [ecx + 01017D488h]
    cmp dword ptr [ebp + 8], ecx
    je L5
    jae L1
    lea edi, [eax - 1]
    jmp L2
L1:
    lea esi, [eax + 1]
L2:
    cmp esi, edi
    jle L0
L3:
    push ebx
    push dword ptr [ebp + 16]
    push dword ptr [ebp + 12]
    push dword ptr [ebp + 8]
    call dword ptr [fp_1010C190]
L4:
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 16
L5:
    mov ecx, dword ptr [ebp + 12]
    dec ecx
    je L11
    dec ecx
    dec ecx
    je L10
    sub ecx, 4
    je L9
    sub ecx, 4
    je L8
    sub ecx, 000000FF6h
    je L7
    dec ecx
    je L6
    dec ecx
    dec ecx
    jne L3
    imul eax, eax, 44
    add eax, 01017D4ACh
    jmp L12
L6:
    imul eax, eax, 44
    mov eax, dword ptr [eax + 01017D49Ch]
    jmp L12
L7:
    imul eax, eax, 44
    mov eax, dword ptr [eax + 01017D494h]
    jmp L12
L8:
    imul eax, eax, 44
    add eax, 01017D4A4h
    jmp L12
L9:
    imul eax, eax, 44
    add eax, 01017D4A0h
    jmp L12
L10:
    imul eax, eax, 44
    add eax, 01017D498h
    jmp L12
L11:
    imul eax, eax, 44
    add eax, 01017D48Ch
L12:
    test eax, eax
    je L3
    cmp ebx, 1
    jl L3
    mov esi, dword ptr [ebp + 16]
    lea ecx, [ebx - 1]
    push ecx
    push eax
    push esi
    call sub_100F5EC3
    xor eax, eax
    add esp, 12
    mov byte ptr [esi + ebx - 1], 0
    inc eax
    jmp L4
crtGetLocaleInfoA ENDP
END
