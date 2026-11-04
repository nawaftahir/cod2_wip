.686
.MODEL FLAT, C
EXTRN fp_1010C080:DWORD
EXTRN fp_1010C0D0:DWORD
EXTRN g_1010C080:DWORD
EXTRN g_101AE1E0:DWORD
.CODE
__ValidateEH3RN PROC
    push ebp
    mov ebp, esp
    sub esp, 32
    push ebx
    push esi
    mov esi, dword ptr [ebp + 8]
    mov ebx, dword ptr [esi + 8]
    test bl, 3
    jne L0
    mov eax, dword ptr fs:[24]
    mov dword ptr [ebp + 8], eax
    mov eax, dword ptr [ebp + 8]
    mov ecx, dword ptr [eax + 8]
    cmp ebx, ecx
    mov dword ptr [ebp - 4], ecx
    jb L1
    cmp ebx, dword ptr [eax + 4]
    jae L1
L0:
    xor eax, eax
    jmp L29
L1:
    push edi
    mov edi, dword ptr [esi + 12]
    cmp edi, -1
    jne L3
L2:
    xor eax, eax
    inc eax
    jmp L28
L3:
    xor edx, edx
    mov dword ptr [ebp + 8], edx
    mov eax, ebx
L4:
    mov ecx, dword ptr [eax]
    cmp ecx, -1
    je L5
    cmp ecx, edx
    jae L17
L5:
    cmp dword ptr [eax + 4], 0
    je L6
    inc dword ptr [ebp + 8]
L6:
    inc edx
    add eax, 12
    cmp edx, edi
    jbe L4
    cmp dword ptr [ebp + 8], 0
    je L7
    mov eax, dword ptr [esi - 8]
    cmp eax, dword ptr [ebp - 4]
    jb L17
    cmp eax, esi
    jae L17
L7:
    mov eax, dword ptr [g_101AE1E0]
    mov edi, ebx
    and edi, 0FFFFF000h
    xor esi, esi
    test eax, eax
    jle L9
L8:
    cmp dword ptr [esi*4 + 0101AE1E8h], edi
    je L18
    inc esi
    cmp esi, eax
    jl L8
L9:
    push 28
    lea eax, [ebp - 32]
    push eax
    push ebx
    call dword ptr [fp_1010C0D0]
    test eax, eax
    je L27
    cmp dword ptr [ebp - 8], 001000000h
    jne L27
    test byte ptr [ebp - 12], 0000000CCh
    je L10
    mov ecx, dword ptr [ebp - 28]
    cmp word ptr [ecx], 000005A4Dh
    jne L27
    mov eax, dword ptr [ecx + 60]
    add eax, ecx
    cmp dword ptr [eax], 000004550h
    jne L27
    cmp word ptr [eax + 24], 00000010Bh
    jne L27
    sub ebx, ecx
    cmp word ptr [eax + 6], 0
    movzx ecx, word ptr [eax + 20]
    lea ecx, [ecx + eax + 24]
    jbe L27
    mov eax, dword ptr [ecx + 12]
    cmp ebx, eax
    jb L10
    mov edx, dword ptr [ecx + 8]
    add edx, eax
    cmp ebx, edx
    jae L10
    test byte ptr [ecx + 39], 000000080h
    jne L17
L10:
    push 1
    push 0101AE228h
    call dword ptr [fp_1010C080]
    test eax, eax
    jne L2
    mov ecx, dword ptr [g_101AE1E0]
    test ecx, ecx
    mov edx, ecx
    jle L12
    lea eax, [ecx*4 + 0101AE1E4h]
L11:
    cmp dword ptr [eax], edi
    je L12
    dec edx
    sub eax, 4
    test edx, edx
    jg L11
L12:
    test edx, edx
    jne L16
    push 15
    pop ebx
    cmp ecx, ebx
    jg L13
    mov ebx, ecx
L13:
    xor edx, edx
    test ebx, ebx
    jl L15
L14:
    lea eax, [edx*4 + 0101AE1E8h]
    mov esi, dword ptr [eax]
    inc edx
    cmp edx, ebx
    mov dword ptr [eax], edi
    mov edi, esi
    jle L14
L15:
    cmp ecx, 16
    jge L16
    inc ecx
    mov dword ptr [g_101AE1E0], ecx
L16:
    push 0
    push 0101AE228h
    call dword ptr [fp_1010C080]
    jmp L2
L17:
    xor eax, eax
    jmp L28
L18:
    test esi, esi
    jle L2
    mov ebx, dword ptr [g_1010C080]
    push 1
    push 0101AE228h
    call ebx
    test eax, eax
    jne L2
    cmp dword ptr [esi*4 + 0101AE1E8h], edi
    je L24
    mov eax, dword ptr [g_101AE1E0]
    lea esi, [eax - 1]
    test esi, esi
    jl L21
L19:
    cmp dword ptr [esi*4 + 0101AE1E8h], edi
    je L20
    dec esi
    jns L19
L20:
    test esi, esi
    jge L23
L21:
    cmp eax, 16
    jge L22
    inc eax
    mov dword ptr [g_101AE1E0], eax
L22:
    lea esi, [eax - 1]
    jmp L24
L23:
    je L26
L24:
    xor ecx, ecx
    test esi, esi
    jl L26
L25:
    lea eax, [ecx*4 + 0101AE1E8h]
    mov edx, dword ptr [eax]
    inc ecx
    cmp ecx, esi
    mov dword ptr [eax], edi
    mov edi, edx
    jle L25
L26:
    push 0
    push 0101AE228h
    call ebx
    jmp L2
L27:
    or eax, 0FFFFFFFFh
L28:
    pop edi
L29:
    pop esi
    pop ebx
    leave
    ret
__ValidateEH3RN ENDP
END
