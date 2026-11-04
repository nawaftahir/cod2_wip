.686
.MODEL FLAT, C
EXTRN sub_1010270F:PROC
EXTRN sub_10102745:PROC
EXTRN sub_1010274B:PROC
EXTRN sub_10102763:PROC
EXTRN sub_1010276B:PROC
EXTRN sub_10102776:PROC
EXTRN sub_10102866:PROC
EXTRN sub_10102878:PROC
EXTRN sub_1010288A:PROC
EXTRN sub_1010289C:PROC
EXTRN sub_101028AC:PROC
EXTRN sub_101028E2:PROC
EXTRN sub_101028EF:PROC
EXTRN sub_101028FE:PROC
EXTRN sub_10102909:PROC
EXTRN sub_1010290F:PROC
EXTRN sub_10102919:PROC
EXTRN sub_10102931:PROC
EXTRN sub_1010295A:PROC
EXTRN sub_10102963:PROC
EXTRN sub_10102975:PROC
EXTRN sub_10102979:PROC
EXTRN sub_10102983:PROC
EXTRN sub_10102D4D:PROC
EXTRN sub_10102E60:PROC
EXTRN EXTRN fp_1010C0D8:DWORD:DWORD
.CODE
__raise_exc PROC
    push push ebp
    mov mov ebp, esp
    mov mov ecx, dword ptr [ebp + 8]
    xor xor eax, eax
    mov mov dword ptr [ecx + 4], eax
    mov mov ecx, dword ptr [ebp + 8]
    mov mov dword ptr [ecx + 8], eax
    mov mov ecx, dword ptr [ebp + 8]
    push push ebx
    xor xor ebx, ebx
    mov mov dword ptr [ecx + 12], eax
    mov mov cl, byte ptr [ebp + 16]
    push push esi
    inc inc ebx
    test test cl, 16
    push push edi
    je L0
    mov mov eax, dword ptr [ebp + 8]
    or or dword ptr [eax + 4], ebx
    mov mov dword ptr [ebp + 16], 0C000008Fh
    test test cl, 2
    je L1
    mov mov eax, dword ptr [ebp + 8]
    or or dword ptr [eax + 4], 2
    mov mov dword ptr [ebp + 16], 0C0000093h
    test test bl, cl
    je L2
    mov mov eax, dword ptr [ebp + 8]
    or or dword ptr [eax + 4], 4
    mov mov dword ptr [ebp + 16], 0C0000091h
L0:
    test test cl, 4
    je L3
    mov mov eax, dword ptr [ebp + 8]
    or or dword ptr [eax + 4], 8
    mov mov dword ptr [ebp + 16], 0C000008Eh
    test test cl, 8
    je L4
    mov mov eax, dword ptr [ebp + 8]
    or or dword ptr [eax + 4], 16
    mov mov dword ptr [ebp + 16], 0C0000090h
    mov mov esi, dword ptr [ebp + 12]
    mov mov ecx, dword ptr [esi]
    mov mov eax, dword ptr [ebp + 8]
    shl shl ecx, 4
    not not ecx
    xor xor ecx, dword ptr [eax + 8]
    push push 2
    and and ecx, 16
    xor xor dword ptr [eax + 8], ecx
    mov mov ecx, dword ptr [esi]
    mov mov eax, dword ptr [ebp + 8]
    shl shl ecx, 1
    not not ecx
    xor xor ecx, dword ptr [eax + 8]
    pop pop edi
    and and ecx, 8
    xor xor dword ptr [eax + 8], ecx
    mov mov ecx, dword ptr [esi]
    mov mov eax, dword ptr [ebp + 8]
    shr shr ecx, 1
    not not ecx
    xor xor ecx, dword ptr [eax + 8]
    and and ecx, 4
    xor xor dword ptr [eax + 8], ecx
    mov mov ecx, dword ptr [esi]
    mov mov eax, dword ptr [ebp + 8]
    shr shr ecx, 3
    not not ecx
    xor xor ecx, dword ptr [eax + 8]
    and and ecx, edi
    xor xor dword ptr [eax + 8], ecx
    mov mov ecx, dword ptr [esi]
    mov mov eax, dword ptr [ebp + 8]
    shr shr ecx, 5
    not not ecx
    xor xor ecx, dword ptr [eax + 8]
    and and ecx, ebx
    xor xor dword ptr [eax + 8], ecx
    call sub_10102D4D
    test test bl, al
    je L5
    mov mov ecx, dword ptr [ebp + 8]
    or or dword ptr [ecx + 12], 16
    test test al, 4
    je L6
    mov mov ecx, dword ptr [ebp + 8]
    or or dword ptr [ecx + 12], 8
    test test al, 8
    je L7
    mov mov ecx, dword ptr [ebp + 8]
    or or dword ptr [ecx + 12], 4
    test test al, 16
    je L8
    mov mov ecx, dword ptr [ebp + 8]
    or or dword ptr [ecx + 12], edi
    test test al, 32
    je L9
    mov mov eax, dword ptr [ebp + 8]
    or or dword ptr [eax + 12], ebx
    mov mov eax, dword ptr [esi]
    mov mov ecx, 0C00h
    and and eax, ecx
    je L12
    cmp cmp eax, 0400h
    je L11
    cmp cmp eax, 0800h
    je L10
    cmp cmp eax, ecx
    jne L13
    mov mov eax, dword ptr [ebp + 8]
    or or dword ptr [eax], 3
    jmp L14
    mov mov eax, dword ptr [ebp + 8]
    mov mov ecx, dword ptr [eax]
    and and ecx, -2
    or or ecx, edi
    jmp L15
    mov mov eax, dword ptr [ebp + 8]
    mov mov ecx, dword ptr [eax]
    and and ecx, -3
    or or ecx, ebx
    mov mov dword ptr [eax], ecx
    jmp sub_1010270F
    mov mov eax, dword ptr [ebp + 8]
    and and dword ptr [eax], -4
    mov mov eax, dword ptr [esi]
    mov mov ecx, 0300h
    and and eax, ecx
    je sub_1010274B
    cmp cmp eax, 0200h
    je sub_10102745
    cmp cmp eax, ecx
    jne sub_10102763
    mov mov eax, dword ptr [ebp + 8]
    and and dword ptr [eax], -29
    jmp sub_1010276B
    mov mov eax, dword ptr [ebp + 8]
    mov mov ecx, dword ptr [eax]
    and and ecx, -25
    or or ecx, 4
    jmp sub_10102776
    mov mov eax, dword ptr [ebp + 8]
    mov mov ecx, dword ptr [eax]
    and and ecx, -21
    or or ecx, 8
    mov mov dword ptr [eax], ecx
    mov mov eax, dword ptr [ebp + 8]
    mov mov ecx, dword ptr [ebp + 20]
    shl shl ecx, 5
    xor xor ecx, dword ptr [eax]
    and and ecx, 01FFE0h
    xor xor dword ptr [eax], ecx
    mov mov eax, dword ptr [ebp + 8]
    or or dword ptr [eax + 32], ebx
    mov mov eax, dword ptr [ebp + 8]
    mov mov ecx, dword ptr [eax + 32]
    and and ecx, -29
    or or ecx, edi
    mov mov dword ptr [eax + 32], ecx
    mov mov eax, dword ptr [ebp + 24]
    fld fld qword ptr [eax]
    mov mov eax, dword ptr [ebp + 8]
    fstp fstp qword ptr [eax + 16]
    mov mov eax, dword ptr [ebp + 8]
    or or dword ptr [eax + 96], ebx
    mov mov eax, dword ptr [ebp + 8]
    mov mov ecx, dword ptr [eax + 96]
    and and ecx, -29
    or or ecx, edi
    mov mov edi, dword ptr [ebp + 28]
    mov mov dword ptr [eax + 96], ecx
    fld fld qword ptr [edi]
    mov mov eax, dword ptr [ebp + 8]
    fstp fstp qword ptr [eax + 80]
    call sub_10102E60
L6:
    lea lea eax, [ebp + 8]
    push push eax
    push push ebx
    push push 0
    push push dword ptr [ebp + 16]
    call dword ptr [fp_1010C0D8]
    mov mov eax, dword ptr [ebp + 8]
    test test byte ptr [eax + 8], 16
    je sub_10102866
    and and dword ptr [esi], -2
    test test byte ptr [eax + 8], 8
    je sub_10102878
    and and dword ptr [esi], -5
    test test byte ptr [eax + 8], 4
    je sub_1010288A
L8:
    and and dword ptr [esi], -9
    test test byte ptr [eax + 8], 2
    je sub_1010289C
    and and dword ptr [esi], -17
    test test byte ptr [eax + 8], bl
    je sub_101028AC
    and and dword ptr [esi], -33
L9:
    mov mov ecx, dword ptr [eax]
    and and ecx, 3
    sub sub ecx, 0
    mov mov edx, 0FFFFF3FFh
    je sub_101028FE
    dec dec ecx
    je sub_101028EF
    dec dec ecx
    je sub_101028E2
    dec dec ecx
    jne sub_10102909
    or or byte ptr [esi + 1], 12
    jmp sub_1010290F
    mov mov ecx, dword ptr [esi]
    and and ecx, 0FFFFFBFFh
    or or ecx, 0800h
    jmp sub_10102919
    mov mov ecx, dword ptr [esi]
    and and ecx, 0FFFFF7FFh
    or or ecx, 0400h
    mov mov dword ptr [esi], ecx
    jmp sub_10102931
    and and dword ptr [esi], edx
    mov mov ecx, dword ptr [eax]
L10:
    shr shr ecx, 2
    and and ecx, 7
    sub sub ecx, 0
    je sub_10102963
    dec dec ecx
L12:
    je sub_1010295A
    dec dec ecx
    jne sub_10102975
    and and dword ptr [esi], edx
    jmp sub_10102979
    mov mov ecx, dword ptr [esi]
    and and ecx, edx
    or or ecx, 0200h
    jmp sub_10102983
    mov mov ecx, dword ptr [esi]
    and and ecx, edx
    or or ecx, 0300h
    mov mov dword ptr [esi], ecx
    fld fld qword ptr [eax + 80]
    fstp fstp qword ptr [edi]
    pop pop edi
    pop pop esi
    pop pop ebx
    pop pop ebp
    ret ret
__raise_exc ENDP
END
