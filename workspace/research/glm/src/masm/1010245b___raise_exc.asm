.686
.MODEL FLAT, C
EXTRN sub_10102D4D:PROC
EXTRN sub_10102E60:PROC
EXTRN fp_1010C0D8:DWORD
.CODE
__raise_exc PROC
    push ebp
    mov ebp, esp
    mov ecx, dword ptr [ebp + 8]
    xor eax, eax
    mov dword ptr [ecx + 4], eax
    mov ecx, dword ptr [ebp + 8]
    mov dword ptr [ecx + 8], eax
    mov ecx, dword ptr [ebp + 8]
    push ebx
    xor ebx, ebx
    mov dword ptr [ecx + 12], eax
    mov cl, byte ptr [ebp + 16]
    push esi
    inc ebx
    test cl, 16
    push edi
    je L0
    mov eax, dword ptr [ebp + 8]
    or dword ptr [eax + 4], ebx
    mov dword ptr [ebp + 16], 0C000008Fh
L0:
    test cl, 2
    je L1
    mov eax, dword ptr [ebp + 8]
    or dword ptr [eax + 4], 2
    mov dword ptr [ebp + 16], 0C0000093h
L1:
    test bl, cl
    je L2
    mov eax, dword ptr [ebp + 8]
    or dword ptr [eax + 4], 4
    mov dword ptr [ebp + 16], 0C0000091h
L2:
    test cl, 4
    je L3
    mov eax, dword ptr [ebp + 8]
    or dword ptr [eax + 4], 8
    mov dword ptr [ebp + 16], 0C000008Eh
L3:
    test cl, 8
    je L4
    mov eax, dword ptr [ebp + 8]
    or dword ptr [eax + 4], 16
    mov dword ptr [ebp + 16], 0C0000090h
L4:
    mov esi, dword ptr [ebp + 12]
    mov ecx, dword ptr [esi]
    mov eax, dword ptr [ebp + 8]
    shl ecx, 4
    not ecx
    xor ecx, dword ptr [eax + 8]
    push 2
    and ecx, 16
    xor dword ptr [eax + 8], ecx
    mov ecx, dword ptr [esi]
    mov eax, dword ptr [ebp + 8]
    shl ecx, 1
    not ecx
    xor ecx, dword ptr [eax + 8]
    pop edi
    and ecx, 8
    xor dword ptr [eax + 8], ecx
    mov ecx, dword ptr [esi]
    mov eax, dword ptr [ebp + 8]
    shr ecx, 1
    not ecx
    xor ecx, dword ptr [eax + 8]
    and ecx, 4
    xor dword ptr [eax + 8], ecx
    mov ecx, dword ptr [esi]
    mov eax, dword ptr [ebp + 8]
    shr ecx, 3
    not ecx
    xor ecx, dword ptr [eax + 8]
    and ecx, edi
    xor dword ptr [eax + 8], ecx
    mov ecx, dword ptr [esi]
    mov eax, dword ptr [ebp + 8]
    shr ecx, 5
    not ecx
    xor ecx, dword ptr [eax + 8]
    and ecx, ebx
    xor dword ptr [eax + 8], ecx
    call sub_10102D4D
    test bl, al
    je L5
    mov ecx, dword ptr [ebp + 8]
    or dword ptr [ecx + 12], 16
L5:
    test al, 4
    je L6
    mov ecx, dword ptr [ebp + 8]
    or dword ptr [ecx + 12], 8
L6:
    test al, 8
    je L7
    mov ecx, dword ptr [ebp + 8]
    or dword ptr [ecx + 12], 4
L7:
    test al, 16
    je L8
    mov ecx, dword ptr [ebp + 8]
    or dword ptr [ecx + 12], edi
L8:
    test al, 32
    je L9
    mov eax, dword ptr [ebp + 8]
    or dword ptr [eax + 12], ebx
L9:
    mov eax, dword ptr [esi]
    mov ecx, 000000C00h
    and eax, ecx
    je L13
    cmp eax, 000000400h
    je L11
    cmp eax, 000000800h
    je L10
    cmp eax, ecx
    jne L14
    mov eax, dword ptr [ebp + 8]
    or dword ptr [eax], 3
    jmp L14
L10:
    mov eax, dword ptr [ebp + 8]
    mov ecx, dword ptr [eax]
    and ecx, 0FFFFFFFEh
    or ecx, edi
    jmp L12
L11:
    mov eax, dword ptr [ebp + 8]
    mov ecx, dword ptr [eax]
    and ecx, 0FFFFFFFDh
    or ecx, ebx
L12:
    mov dword ptr [eax], ecx
    jmp L14
L13:
    mov eax, dword ptr [ebp + 8]
    and dword ptr [eax], 0FFFFFFFCh
L14:
    mov eax, dword ptr [esi]
    mov ecx, 000000300h
    and eax, ecx
    je L16
    cmp eax, 000000200h
    je L15
    cmp eax, ecx
    jne L18
    mov eax, dword ptr [ebp + 8]
    and dword ptr [eax], 0FFFFFFE3h
    jmp L18
L15:
    mov eax, dword ptr [ebp + 8]
    mov ecx, dword ptr [eax]
    and ecx, 0FFFFFFE7h
    or ecx, 4
    jmp L17
L16:
    mov eax, dword ptr [ebp + 8]
    mov ecx, dword ptr [eax]
    and ecx, 0FFFFFFEBh
    or ecx, 8
L17:
    mov dword ptr [eax], ecx
L18:
    mov eax, dword ptr [ebp + 8]
    mov ecx, dword ptr [ebp + 20]
    shl ecx, 5
    xor ecx, dword ptr [eax]
    and ecx, 00001FFE0h
    xor dword ptr [eax], ecx
    mov eax, dword ptr [ebp + 8]
    or dword ptr [eax + 32], ebx
    mov eax, dword ptr [ebp + 8]
    mov ecx, dword ptr [eax + 32]
    and ecx, 0FFFFFFE3h
    or ecx, edi
    mov dword ptr [eax + 32], ecx
    mov eax, dword ptr [ebp + 24]
    fld qword ptr [eax]
    mov eax, dword ptr [ebp + 8]
    fstp qword ptr [eax + 16]
    mov eax, dword ptr [ebp + 8]
    or dword ptr [eax + 96], ebx
    mov eax, dword ptr [ebp + 8]
    mov ecx, dword ptr [eax + 96]
    and ecx, 0FFFFFFE3h
    or ecx, edi
    mov edi, dword ptr [ebp + 28]
    mov dword ptr [eax + 96], ecx
    fld qword ptr [edi]
    mov eax, dword ptr [ebp + 8]
    fstp qword ptr [eax + 80]
    call sub_10102E60
    lea eax, [ebp + 8]
    push eax
    push ebx
    push 0
    push dword ptr [ebp + 16]
    call dword ptr [fp_1010C0D8]
    mov eax, dword ptr [ebp + 8]
    test byte ptr [eax + 8], 16
    je L19
    and dword ptr [esi], 0FFFFFFFEh
L19:
    test byte ptr [eax + 8], 8
    je L20
    and dword ptr [esi], 0FFFFFFFBh
L20:
    test byte ptr [eax + 8], 4
    je L21
    and dword ptr [esi], 0FFFFFFF7h
L21:
    test byte ptr [eax + 8], 2
    je L22
    and dword ptr [esi], 0FFFFFFEFh
L22:
    test byte ptr [eax + 8], bl
    je L23
    and dword ptr [esi], 0FFFFFFDFh
L23:
    mov ecx, dword ptr [eax]
    and ecx, 3
    sub ecx, 0
    mov edx, 0FFFFF3FFh
    je L27
    dec ecx
    je L25
    dec ecx
    je L24
    dec ecx
    jne L28
    or byte ptr [esi + 1], 12
    jmp L28
L24:
    mov ecx, dword ptr [esi]
    and ecx, 0FFFFFBFFh
    or ecx, 000000800h
    jmp L26
L25:
    mov ecx, dword ptr [esi]
    and ecx, 0FFFFF7FFh
    or ecx, 000000400h
L26:
    mov dword ptr [esi], ecx
    jmp L28
L27:
    and dword ptr [esi], edx
L28:
    mov ecx, dword ptr [eax]
    shr ecx, 2
    and ecx, 7
    sub ecx, 0
    je L30
    dec ecx
    je L29
    dec ecx
    jne L32
    and dword ptr [esi], edx
    jmp L32
L29:
    mov ecx, dword ptr [esi]
    and ecx, edx
    or ecx, 000000200h
    jmp L31
L30:
    mov ecx, dword ptr [esi]
    and ecx, edx
    or ecx, 000000300h
L31:
    mov dword ptr [esi], ecx
L32:
    fld qword ptr [eax + 80]
    fstp qword ptr [edi]
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret
__raise_exc ENDP
END
