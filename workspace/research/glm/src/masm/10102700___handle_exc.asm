.686
.MODEL FLAT, C
EXTRN sub_1010250A:PROC
EXTRN sub_10102CCA:PROC
EXTRN sub_10102CE4:PROC
EXTRN sub_10102D06:PROC
EXTRN sub_10102E9F:PROC
EXTRN sub_10102EBA:PROC
EXTRN g_1019BE20:DWORD
EXTRN g_101A5100:DWORD
EXTRN g_101A5110:DWORD
.CODE
__handle_exc PROC
    push ebp
    mov ebp, esp
    sub esp, 16
    mov eax, dword ptr [ebp + 8]
    push ebx
    push esi
    xor ebx, ebx
    mov esi, eax
    and esi, 31
    inc ebx
    test al, 8
    mov dword ptr [ebp - 4], esi
    je L0
    test byte ptr [ebp + 16], bl
    je L0
    push ebx
    call sub_10102CCA
    pop ecx
    and esi, 0FFFFFFF7h
    jmp L27
L0:
    test al, 4
    je L1
    test byte ptr [ebp + 16], 4
    je L1
    push 4
    call sub_10102CE4
    pop ecx
    and esi, 0FFFFFFFBh
    jmp L27
L1:
    test bl, al
    je L13
    test byte ptr [ebp + 16], 8
    je L13
    push 8
    call sub_10102D06
    mov eax, dword ptr [ebp + 16]
    pop ecx
    mov ecx, 000000C00h
    and eax, ecx
    je L9
    cmp eax, 000000400h
    je L6
    cmp eax, 000000800h
    je L3
    cmp eax, ecx
    jne L12
    mov ecx, dword ptr [ebp + 12]
    fld qword ptr [ecx]
    fcomp qword ptr [g_1019BE20]
    fld qword ptr [g_101A5110]
    fnstsw ax
    test ah, 65
    je L2
    fchs
L2:
    fstp qword ptr [ebp - 16]
    fld qword ptr [ebp - 16]
    jmp L11
L3:
    mov ecx, dword ptr [ebp + 12]
    fld qword ptr [ecx]
    fcomp qword ptr [g_1019BE20]
    fnstsw ax
    test ah, 65
    jne L4
    fld qword ptr [g_101A5100]
    jmp L5
L4:
    fld qword ptr [g_101A5110]
    fchs
L5:
    fstp qword ptr [ebp - 16]
    fld qword ptr [ebp - 16]
    jmp L11
L6:
    mov ecx, dword ptr [ebp + 12]
    fld qword ptr [ecx]
    fcomp qword ptr [g_1019BE20]
    fnstsw ax
    test ah, 65
    jne L7
    fld qword ptr [g_101A5110]
    jmp L8
L7:
    fld qword ptr [g_101A5100]
    fchs
L8:
    fstp qword ptr [ebp - 16]
    fld qword ptr [ebp - 16]
    jmp L11
L9:
    mov ecx, dword ptr [ebp + 12]
    fld qword ptr [ecx]
    fcomp qword ptr [g_1019BE20]
    fld qword ptr [g_101A5100]
    fnstsw ax
    test ah, 65
    je L10
    fchs
L10:
    fstp qword ptr [ebp - 16]
    fld qword ptr [ebp - 16]
L11:
    fstp qword ptr [ecx]
L12:
    and esi, 0FFFFFFFEh
    jmp L27
L13:
    test al, 2
    je L27
    test byte ptr [ebp + 16], 16
    je L27
    xor esi, esi
    test al, 16
    je L14
    mov esi, ebx
L14:
    fld qword ptr [g_1019BE20]
    push edi
    mov edi, dword ptr [ebp + 12]
    fld qword ptr [edi]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L24
    fld qword ptr [edi]
    lea eax, [ebp - 8]
    push eax
    push ecx
    push ecx
    fstp qword ptr [esp]
    call sub_1010250A
    mov ecx, dword ptr [ebp - 8]
    fstp qword ptr [ebp - 16]
    fld qword ptr [ebp - 16]
    add ecx, 0FFFFFA00h
    add esp, 12
    cmp ecx, 0FFFFFBCEh
    jge L15
    fmul qword ptr [g_1019BE20]
    mov esi, ebx
    jmp L22
L15:
    fcomp qword ptr [g_1019BE20]
    fnstsw ax
    test ah, 5
    jp L16
    mov edx, ebx
    jmp L17
L16:
    xor edx, edx
L17:
    xor eax, eax
    mov al, byte ptr [ebp - 10]
    and eax, 15
    or eax, 16
    mov word ptr [ebp - 10], ax
    mov eax, 0FFFFFC03h
    cmp ecx, eax
    jge L21
    sub eax, ecx
L18:
    test byte ptr [ebp - 16], bl
    je L19
    test esi, esi
    jne L19
    mov esi, ebx
L19:
    shr dword ptr [ebp - 16], 1
    test byte ptr [ebp - 12], bl
    je L20
    or byte ptr [ebp - 13], 000000080h
L20:
    shr dword ptr [ebp - 12], 1
    dec eax
    jne L18
L21:
    test edx, edx
    je L23
    fld qword ptr [ebp - 16]
    fchs
L22:
    fstp qword ptr [ebp - 16]
L23:
    fld qword ptr [ebp - 16]
    fstp qword ptr [edi]
    jmp L25
L24:
    mov esi, ebx
L25:
    test esi, esi
    pop edi
    je L26
    push 16
    call sub_10102E9F
    pop ecx
L26:
    and dword ptr [ebp - 4], 0FFFFFFFDh
    mov esi, dword ptr [ebp - 4]
L27:
    test byte ptr [ebp + 8], 16
    je L28
    test byte ptr [ebp + 16], 32
    je L28
    push 32
    call sub_10102EBA
    pop ecx
    and esi, 0FFFFFFEFh
L28:
    xor eax, eax
    test esi, esi
    pop esi
    sete al
    pop ebx
    leave
    ret
__handle_exc ENDP
END
