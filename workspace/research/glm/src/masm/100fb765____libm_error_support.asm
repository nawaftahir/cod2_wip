.686
.MODEL FLAT, C
EXTRN sub_100FC3FF:PROC
EXTRN sub_100FC48E:PROC
EXTRN sub_10100FD9:PROC
EXTRN fp_101A4B20:DWORD
EXTRN g_101A50D0:DWORD
.CODE
___libm_error_support PROC
    push ebp
    mov ebp, esp
    sub esp, 36
    mov eax, dword ptr [g_101A50D0]
    mov dword ptr [ebp - 4], eax
    mov eax, dword ptr [ebp + 20]
    mov ecx, 0000000A1h
    cmp eax, ecx
    push esi
    jg L13
    je L12
    cmp eax, 24
    jg L7
    je L5
    push 2
    pop ecx
    sub eax, ecx
    je L4
    dec eax
    je L3
    sub eax, 5
    je L2
    dec eax
    je L1
    sub eax, 5
    je L0
    dec eax
    jne L31
    mov dword ptr [ebp - 32], 01010EB1Ch
    jmp L11
L0:
    mov dword ptr [ebp - 36], 3
    mov dword ptr [ebp - 32], 01010EB1Ch
    jmp L20
L1:
    mov dword ptr [ebp - 32], 0101145BCh
    jmp L24
L2:
    mov dword ptr [ebp - 36], ecx
    mov dword ptr [ebp - 32], 0101145BCh
    jmp L20
L3:
    mov dword ptr [ebp - 32], 01010EB18h
    jmp L24
L4:
    mov dword ptr [ebp - 36], ecx
    mov dword ptr [ebp - 32], 01010EB18h
    jmp L20
L5:
    mov dword ptr [ebp - 36], 3
L6:
    mov dword ptr [ebp - 32], 01010EAACh
    jmp L20
L7:
    sub eax, 25
    je L10
    dec eax
    je L9
    dec eax
    je L8
    dec eax
    je L23
    dec eax
    jne L31
    mov dword ptr [ebp - 32], 01010EAACh
    jmp L28
L8:
    mov dword ptr [ebp - 36], 2
    jmp L6
L9:
    mov eax, dword ptr [ebp + 16]
    fld1
    fstp qword ptr [eax]
    jmp L31
L10:
    mov dword ptr [ebp - 32], 01010EAACh
L11:
    mov eax, dword ptr [ebp + 8]
    fld qword ptr [eax]
    mov eax, dword ptr [ebp + 12]
    mov esi, dword ptr [ebp + 16]
    fstp qword ptr [ebp - 28]
    fld qword ptr [eax]
    lea eax, [ebp - 36]
    fstp qword ptr [ebp - 20]
    push eax
    fld qword ptr [esi]
    mov dword ptr [ebp - 36], 4
    fstp qword ptr [ebp - 12]
    call dword ptr [fp_101A4B20]
    pop ecx
    jmp L30
L12:
    mov dword ptr [ebp - 36], 3
    jmp L19
L13:
    mov ecx, 0000003EAh
    cmp eax, ecx
    jg L22
    je L21
    sub eax, 0000000A2h
    je L18
    sub eax, 4
    je L17
    sub eax, 4
    je L16
    dec eax
    je L15
    sub eax, 00000033Dh
    je L14
    dec eax
    jne L31
    mov dword ptr [ebp - 32], 0101145BCh
    jmp L28
L14:
    mov dword ptr [ebp - 32], 01010EB18h
    jmp L28
L15:
    mov dword ptr [ebp - 32], 0101145B4h
    jmp L24
L16:
    mov dword ptr [ebp - 36], 2
    mov dword ptr [ebp - 32], 0101145B4h
    jmp L20
L17:
    mov dword ptr [ebp - 36], 3
    mov dword ptr [ebp - 32], 01017C868h
    jmp L20
L18:
    mov dword ptr [ebp - 36], 4
L19:
    mov dword ptr [ebp - 32], 010114638h
L20:
    mov eax, dword ptr [ebp + 8]
    fld qword ptr [eax]
    mov eax, dword ptr [ebp + 12]
    mov esi, dword ptr [ebp + 16]
    fstp qword ptr [ebp - 28]
    fld qword ptr [eax]
    lea eax, [ebp - 36]
    fstp qword ptr [ebp - 20]
    push eax
    fld qword ptr [esi]
    fstp qword ptr [ebp - 12]
    call dword ptr [fp_101A4B20]
    test eax, eax
    pop ecx
    jne L30
    call sub_100FC3FF
    mov dword ptr [eax], 34
    jmp L30
L21:
    mov dword ptr [ebp - 32], 01010EB1Ch
    jmp L28
L22:
    sub eax, 0000003EBh
    je L27
    dec eax
    je L26
    dec eax
    je L25
    dec eax
    je L23
    dec eax
    jne L31
    mov dword ptr [ebp - 32], 0101145ACh
    jmp L28
L23:
    mov dword ptr [ebp - 32], 01010EAACh
L24:
    mov eax, dword ptr [ebp + 8]
    mov esi, dword ptr [ebp + 16]
    jmp L29
L25:
    mov dword ptr [ebp - 32], 010114618h
    jmp L28
L26:
    mov dword ptr [ebp - 32], 010114690h
    jmp L28
L27:
    mov dword ptr [ebp - 32], 0101146A0h
L28:
    mov eax, dword ptr [ebp + 8]
    fld qword ptr [eax]
    mov esi, dword ptr [ebp + 16]
    fstp qword ptr [esi]
L29:
    fld qword ptr [eax]
    mov eax, dword ptr [ebp + 12]
    fstp qword ptr [ebp - 28]
    mov dword ptr [ebp - 36], 1
    fld qword ptr [eax]
    lea eax, [ebp - 36]
    fstp qword ptr [ebp - 20]
    push eax
    fld qword ptr [esi]
    fstp qword ptr [ebp - 12]
    call dword ptr [fp_101A4B20]
    test eax, eax
    pop ecx
    jne L30
    call sub_100FC48E
    mov dword ptr [eax], 33
L30:
    fld qword ptr [ebp - 12]
    fstp qword ptr [esi]
L31:
    mov ecx, dword ptr [ebp - 4]
    pop esi
    call sub_10100FD9
    leave
    ret
___libm_error_support ENDP
END
