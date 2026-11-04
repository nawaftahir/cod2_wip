.686
.MODEL FLAT, C
EXTRN sub_1006DE23:PROC
EXTRN sub_1007B759:PROC
EXTRN sub_1007B7CE:PROC
EXTRN sub_1007CEA1:PROC
EXTRN sub_1007CEA6:PROC
EXTRN sub_1007CEA8:PROC
EXTRN sub_1007CEB7:PROC
EXTRN sub_1007CEC2:PROC
EXTRN sub_1007CEC3:PROC
EXTRN sub_1007CEC8:PROC
EXTRN sub_1007CECE:PROC
EXTRN sub_1007CF05:PROC
EXTRN sub_1007CF1C:PROC
EXTRN sub_1007CF1E:PROC
EXTRN sub_1007CF28:PROC
EXTRN sub_1007CF35:PROC
EXTRN sub_1007CF49:PROC
EXTRN sub_1007CF52:PROC
EXTRN sub_1007CF6B:PROC
EXTRN sub_1007CF6E:PROC
EXTRN sub_1007CF96:PROC
EXTRN sub_1007CFA4:PROC
EXTRN sub_1007CFAB:PROC
EXTRN sub_1007CFDA:PROC
EXTRN sub_1007CFE0:PROC
EXTRN sub_1007CFE2:PROC
EXTRN sub_1007CFE8:PROC
EXTRN sub_1007CFF1:PROC
EXTRN sub_1007CFF6:PROC
EXTRN sub_1007D001:PROC
EXTRN sub_1007D00D:PROC
EXTRN sub_1007D027:PROC
EXTRN sub_1007D02A:PROC
EXTRN sub_1007D051:PROC
EXTRN sub_1007D055:PROC
EXTRN sub_1007D07F:PROC
EXTRN sub_1008617D:PROC
EXTRN sub_1008626C:PROC
EXTRN EXTRN g_1010C728:DWORD:DWORD
.CODE
FUN_1007cc9c PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ebx
    mov mov ebx, dword ptr [ebp + 8]
    push push esi
    xor xor edx, edx
    cmp cmp ebx, edx
    push push edi
    mov mov edi, ecx
    jne L1
    mov mov ebx, dword ptr [ebp + 12]
    cmp cmp ebx, edx
    je sub_1007CEB7
    xor xor esi, esi
    cmp cmp dword ptr [ebp + 16], edx
    jbe sub_1007CEC2
    jmp L0
    xor xor edx, edx
    mov mov ecx, dword ptr [edi + 8]
    fldz fldz
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push edx
    push push edx
    push push dword ptr [ecx + 088h]
    call sub_1008617D
    mov mov dword ptr [ebx + esi*4], eax
    mov mov ecx, dword ptr [edi + 8]
    cmp cmp eax, dword ptr [ecx + 8]
    jae L3
    mov mov ecx, dword ptr [ecx + 20]
    mov mov eax, dword ptr [ecx + eax*4]
    jmp L4
    xor xor eax, eax
    test test eax, eax
    je L5
    or or dword ptr [eax + 48], -1
    inc inc esi
    cmp cmp esi, dword ptr [ebp + 16]
    jb L2
    jmp sub_1007CF05
    mov mov eax, dword ptr [ebx + 4]
    cmp cmp eax, 14
    jne L12
    mov mov esi, dword ptr [ebp + 12]
    cmp cmp esi, edx
    je sub_1007CF1C
    mov mov eax, dword ptr [ebx + 16]
    cmp cmp eax, 6
    jne L8
    xor xor eax, eax
    cmp cmp dword ptr [ebx + 24], -1
    jne L6
    cmp cmp dword ptr [ebp + 16], edx
    jbe sub_1007CF35
    mov mov ecx, dword ptr [edi + 28]
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov dword ptr [esi + eax*4], ecx
    inc inc eax
L3:
    cmp cmp eax, dword ptr [ebp + 16]
    jb L7
    jmp sub_1007CF49
L4:
    cmp cmp dword ptr [ebp + 16], edx
    jbe sub_1007CF52
    mov mov ecx, dword ptr [ebx + 24]
    mov mov edx, dword ptr [edi + 24]
    add add ecx, eax
    mov mov ecx, dword ptr [edx + ecx*4]
    mov mov dword ptr [esi + eax*4], ecx
    inc inc eax
    cmp cmp eax, dword ptr [ebp + 16]
    jb L9
    jmp sub_1007CF6B
    sub sub eax, edx
    fldz fldz
    mov mov dword ptr [ebp + 12], edx
    je L14
    dec dec eax
    je L13
    dec dec eax
    je L11
    dec dec eax
    jne sub_1007CEA1
    fstp fstp st(0)
    fld fld qword ptr [ebx + 24]
    jmp sub_1007CEA8
    mov mov eax, dword ptr [ebx + 24]
    fstp fstp st(0)
    test test eax, eax
    fild fild dword ptr [ebx + 24]
    jge L15
    fadd fadd qword ptr [g_1010C728]
    mov mov dword ptr [ebp + 12], 2
    jmp sub_1007CEC3
    fstp fstp st(0)
    fild fild dword ptr [ebx + 24]
    jmp sub_1007CEA6
    cmp cmp dword ptr [ebx + 24], edx
    fstp fstp st(0)
    je sub_1007CEC8
    fld1 fld1
    jmp sub_1007CECE
    fldz fldz
    mov mov dword ptr [ebp + 12], 23
    mov mov ecx, dword ptr [edi + 8]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push edx
    push push edx
    push push dword ptr [ecx + 120]
    call sub_1008626C
    mov mov dword ptr [esi], eax
    mov mov edi, dword ptr [edi + 8]
    cmp cmp eax, dword ptr [edi + 8]
    jae sub_1007CF1E
    mov mov ecx, dword ptr [edi + 20]
    mov mov eax, dword ptr [ecx + eax*4]
L6:
    jmp sub_1007CF28
    xor xor eax, eax
L7:
    test test eax, eax
    je sub_1007CFE8
    mov mov ecx, dword ptr [ebp + 12]
    or or dword ptr [eax], ecx
    or or dword ptr [eax + 48], -1
    jmp sub_1007CFF6
L8:
    cmp cmp eax, 13
    jne sub_1007CF6E
    push push edx
    push push dword ptr [ebp + 12]
    mov mov ecx, edi
    push push ebx
    call sub_1007B759
    jmp sub_1007CF96
    cmp cmp eax, 1
    je sub_1007CFA4
    push push 01010FC44h
    push push edx
    push push edx
    push push edi
    call sub_1006DE23
    add add esp, 16
    mov mov eax, 080004005h
    pop pop edi
    pop pop esi
    pop pop ebx
    pop pop ebp
    ret ret 12
    xor xor edx, edx
    mov mov eax, dword ptr [ebx + 8]
    cmp cmp eax, edx
    je sub_1007CFAB
    cmp cmp dword ptr [eax + 4], 14
    jne sub_1007D001
    xor xor esi, esi
    inc inc esi
    cmp cmp dword ptr [eax + 16], 6
    jne sub_1007CFF1
    mov mov esi, dword ptr [eax + 28]
    push push esi
    push push dword ptr [ebp + 12]
    mov mov ecx, edi
    push push eax
    call L10
L10:
    test test eax, eax
    jl sub_1007CFE2
    mov mov eax, dword ptr [ebp + 12]
    test test eax, eax
    je sub_1007D055
    jmp sub_1007D051
    cmp cmp eax, edx
    je sub_1007CFDA
    cmp cmp dword ptr [eax + 4], 13
    jne sub_1007CFE0
    mov mov esi, dword ptr [eax + 24]
    imul imul esi, dword ptr [eax + 20]
    push push 0
    push push dword ptr [ebp + 12]
    mov mov ecx, edi
    push push eax
    call sub_1007B7CE
    test test eax, eax
    jl sub_1007D00D
    cmp cmp dword ptr [ebp + 12], 0
    je sub_1007D07F
    mov mov eax, dword ptr [ebp + 12]
    lea lea eax, [eax + esi*4]
    mov mov dword ptr [ebp + 12], eax
    mov mov ebx, dword ptr [ebx + 12]
    test test ebx, ebx
    jne sub_1007D02A
    xor xor eax, eax
    jmp sub_1007D027
FUN_1007cc9c ENDP
END
