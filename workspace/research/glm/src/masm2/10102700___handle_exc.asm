.686
.MODEL FLAT, C
EXTRN sub_1010250A:PROC
EXTRN sub_1010292E:PROC
EXTRN sub_10102930:PROC
EXTRN sub_1010294A:PROC
EXTRN sub_10102982:PROC
EXTRN sub_10102A14:PROC
EXTRN sub_10102A2A:PROC
EXTRN sub_10102A32:PROC
EXTRN sub_10102A3C:PROC
EXTRN sub_10102A42:PROC
EXTRN sub_10102A47:PROC
EXTRN sub_10102A71:PROC
EXTRN sub_10102A88:PROC
EXTRN sub_10102A8C:PROC
EXTRN sub_10102A93:PROC
EXTRN sub_10102A95:PROC
EXTRN sub_10102AA2:PROC
EXTRN sub_10102AC2:PROC
EXTRN sub_10102ADA:PROC
EXTRN sub_10102AEE:PROC
EXTRN sub_10102B21:PROC
EXTRN sub_10102B27:PROC
EXTRN sub_10102CCA:PROC
EXTRN sub_10102CE4:PROC
EXTRN sub_10102D06:PROC
EXTRN sub_10102E9F:PROC
EXTRN sub_10102EBA:PROC
EXTRN EXTRN g_1019BE20:DWORD:DWORD
EXTRN EXTRN g_101A5100:DWORD:DWORD
EXTRN EXTRN g_101A5110:DWORD:DWORD
.CODE
__handle_exc PROC
    push push ebp
    mov mov ebp, esp
    sub sub esp, 16
    mov mov eax, dword ptr [ebp + 8]
    push push ebx
    push push esi
    xor xor ebx, ebx
    mov mov esi, eax
    and and esi, 31
    inc inc ebx
    test test al, 8
    mov mov dword ptr [ebp - 4], esi
    je L0
    test test byte ptr [ebp + 16], bl
    je L1
    push push ebx
    call sub_10102CCA
    pop pop ecx
    and and esi, -9
    jmp sub_10102930
    test test al, 4
    je L2
    test test byte ptr [ebp + 16], 4
    je L3
    push push 4
    call sub_10102CE4
    pop pop ecx
    and and esi, -5
    jmp sub_1010294A
L0:
    test test bl, al
    je L8
    test test byte ptr [ebp + 16], 8
    je L10
    push push 8
    call sub_10102D06
    mov mov eax, dword ptr [ebp + 16]
    pop pop ecx
    mov mov ecx, 0C00h
    and and eax, ecx
    je L7
    cmp cmp eax, 0400h
    je L6
    cmp cmp eax, 0800h
    je L4
L3:
    cmp cmp eax, ecx
    jne L12
    mov mov ecx, dword ptr [ebp + 12]
    fld fld qword ptr [ecx]
    fcomp fcomp qword ptr [g_1019BE20]
    fld fld qword ptr [g_101A5110]
    fnstsw fnstsw ax
    test test ah, 65
    je L5
    fchs fchs
    fstp fstp qword ptr [ebp - 16]
    fld fld qword ptr [ebp - 16]
    jmp L13
    mov mov ecx, dword ptr [ebp + 12]
    fld fld qword ptr [ecx]
    fcomp fcomp qword ptr [g_1019BE20]
    fnstsw fnstsw ax
    test test ah, 65
    jne L9
    fld fld qword ptr [g_101A5100]
    jmp L11
    fld fld qword ptr [g_101A5110]
    fchs fchs
    fstp fstp qword ptr [ebp - 16]
    fld fld qword ptr [ebp - 16]
    jmp L16
    mov mov ecx, dword ptr [ebp + 12]
    fld fld qword ptr [ecx]
    fcomp fcomp qword ptr [g_1019BE20]
    fnstsw fnstsw ax
    test test ah, 65
    jne L14
    fld fld qword ptr [g_101A5110]
    jmp L15
    fld fld qword ptr [g_101A5100]
    fchs fchs
    fstp fstp qword ptr [ebp - 16]
    fld fld qword ptr [ebp - 16]
    jmp L17
    mov mov ecx, dword ptr [ebp + 12]
    fld fld qword ptr [ecx]
    fcomp fcomp qword ptr [g_1019BE20]
    fld fld qword ptr [g_101A5100]
    fnstsw fnstsw ax
    test test ah, 65
    je sub_1010292E
    fchs fchs
    fstp fstp qword ptr [ebp - 16]
    fld fld qword ptr [ebp - 16]
    fstp fstp qword ptr [ecx]
    and and esi, -2
    jmp sub_10102A2A
    test test al, 2
L4:
    je sub_10102A32
    test test byte ptr [ebp + 16], 16
    je sub_10102A3C
    xor xor esi, esi
    test test al, 16
    je sub_10102982
    mov mov esi, ebx
L5:
    fld fld qword ptr [g_1019BE20]
    push push edi
    mov mov edi, dword ptr [ebp + 12]
    fld fld qword ptr [edi]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp sub_10102A47
    fld fld qword ptr [edi]
    lea lea eax, [ebp - 8]
    push push eax
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    call sub_1010250A
    mov mov ecx, dword ptr [ebp - 8]
    fstp fstp qword ptr [ebp - 16]
    fld fld qword ptr [ebp - 16]
    add add ecx, 0FFFFFA00h
    add add esp, 12
    cmp cmp ecx, 0FFFFFBCEh
    jge sub_10102A14
    fmul fmul qword ptr [g_1019BE20]
    mov mov esi, ebx
    jmp sub_10102A71
    fcomp fcomp qword ptr [g_1019BE20]
    fnstsw fnstsw ax
    test test ah, 5
    jp sub_10102A3C
    mov mov edx, ebx
    jmp sub_10102A42
    xor xor edx, edx
    xor xor eax, eax
    mov mov al, byte ptr [ebp - 10]
    and and eax, 15
    or or eax, 16
    mov mov word ptr [ebp - 10], ax
    mov mov eax, 0FFFFFC03h
    cmp cmp ecx, eax
    jge sub_10102A93
    sub sub eax, ecx
    test test byte ptr [ebp - 16], bl
    je sub_10102A88
    test test esi, esi
    jne sub_10102A8C
    mov mov esi, ebx
    shr shr dword ptr [ebp - 16], 1
    test test byte ptr [ebp - 12], bl
    je sub_10102AA2
    or or byte ptr [ebp - 13], 080h
    shr shr dword ptr [ebp - 12], 1
    dec dec eax
    jne sub_10102A95
    test test edx, edx
    je sub_10102AC2
    fld fld qword ptr [ebp - 16]
    fchs fchs
    fstp fstp qword ptr [ebp - 16]
    fld fld qword ptr [ebp - 16]
    fstp fstp qword ptr [edi]
    jmp sub_10102ADA
    mov mov esi, ebx
    test test esi, esi
    pop pop edi
    je sub_10102AEE
    push push 16
    call sub_10102E9F
    pop pop ecx
    and and dword ptr [ebp - 4], -3
    mov mov esi, dword ptr [ebp - 4]
    test test byte ptr [ebp + 8], 16
    je sub_10102B21
    test test byte ptr [ebp + 16], 32
    je sub_10102B27
    push push 32
    call sub_10102EBA
    pop pop ecx
    and and esi, -17
    xor xor eax, eax
    test test esi, esi
    pop pop esi
    sete sete al
    pop pop ebx
    leave leave
    ret ret
__handle_exc ENDP
END
