.686
.MODEL FLAT, C
EXTRN sub_100650BB:PROC
EXTRN sub_100650E3:PROC
EXTRN sub_1006510B:PROC
EXTRN sub_10065151:PROC
EXTRN sub_10082969:PROC
EXTRN sub_10082EC1:PROC
EXTRN sub_100832B5:PROC
EXTRN sub_10083474:PROC
EXTRN sub_10083493:PROC
EXTRN sub_1009A677:PROC
EXTRN sub_1009BEE9:PROC
EXTRN sub_1009BF2D:PROC
EXTRN sub_1009BF3A:PROC
EXTRN sub_1009BF47:PROC
EXTRN sub_1009BF5F:PROC
EXTRN sub_1009BF61:PROC
EXTRN sub_1009BF62:PROC
EXTRN sub_1009BF75:PROC
EXTRN sub_1009BFA8:PROC
EXTRN sub_1009BFAD:PROC
EXTRN sub_1009BFC1:PROC
EXTRN sub_1009BFCF:PROC
EXTRN sub_1009BFE1:PROC
.CODE
FUN_1009bdcd PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ecx
    mov mov eax, dword ptr [ebp + 8]
    push push ebx
    push push esi
    push push edi
    xor xor ebx, ebx
    push push 2
    mov mov dword ptr [ebp - 8], ecx
    xor xor edi, edi
    pop pop ecx
    inc inc ebx
    cmp cmp eax, edi
    mov mov dword ptr [ebp - 4], ecx
    je L0
    jle L2
    cmp cmp eax, 4
    jle L1
    cmp cmp eax, 8
    jle L1
    cmp cmp eax, 12
    jg L3
    mov mov dword ptr [ebp - 4], 3
    jmp L4
    mov mov dword ptr [ebp - 4], ecx
    jmp L5
    mov mov dword ptr [ebp - 4], ebx
    jmp L6
    mov mov dword ptr [ebp - 4], edi
    push push 80
    call sub_100650BB
    cmp cmp eax, edi
    je L7
    push push dword ptr [ebp + 24]
    mov mov ecx, eax
    push push ebx
    push push edi
    push push edi
    push push edi
    push push edi
    call sub_100832B5
    mov mov esi, eax
L0:
    jmp L8
L1:
    xor xor esi, esi
    cmp cmp esi, edi
    je sub_1009BF3A
    push push 36
    call sub_100650E3
    cmp cmp eax, edi
    je L9
    push push 0200h
    push push ebx
L4:
    push push ebx
    push push dword ptr [ebp + 8]
    mov mov ecx, eax
    push push edi
    call sub_10082EC1
    jmp sub_1009BEE9
    xor xor eax, eax
    cmp cmp eax, edi
    mov mov dword ptr [esi + 16], eax
    je sub_1009BF62
    push push 64
    call sub_1006510B
    cmp cmp dword ptr [ebp - 4], 3
    jne sub_1009BF2D
    cmp cmp eax, edi
    je sub_1009BF47
    push push dword ptr [ebp + 24]
    fld fld qword ptr [ebp + 16]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push 3
    mov mov ecx, eax
    call sub_10083493
    jmp sub_1009BF5F
    cmp cmp eax, edi
    je sub_1009BF61
    push push dword ptr [ebp + 24]
    mov mov ecx, eax
    push push dword ptr [ebp + 12]
    push push dword ptr [ebp - 4]
    call sub_10083474
    jmp sub_1009BF75
    xor xor eax, eax
    cmp cmp eax, edi
    mov mov dword ptr [esi + 32], eax
    je sub_1009BFA8
    push push 20
    call sub_10065151
    cmp cmp eax, edi
    je sub_1009BFAD
    push push 010114AE8h
    push push edi
    push push dword ptr [esi + 32]
    mov mov ecx, eax
    call sub_10082969
    jmp sub_1009BFC1
    xor xor eax, eax
    cmp cmp eax, edi
    jne sub_1009BFCF
    xor xor eax, eax
    jmp sub_1009BFE1
    mov mov ecx, dword ptr [ebp - 8]
L9:
    push push esi
    mov mov dword ptr [esi + 32], eax
    call sub_1009A677
    mov mov eax, esi
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 20
FUN_1009bdcd ENDP
END
