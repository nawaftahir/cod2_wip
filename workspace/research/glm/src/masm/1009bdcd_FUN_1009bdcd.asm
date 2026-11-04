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
.CODE
FUN_1009bdcd PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    mov eax, dword ptr [ebp + 8]
    push ebx
    push esi
    push edi
    xor ebx, ebx
    push 2
    mov dword ptr [ebp - 8], ecx
    xor edi, edi
    pop ecx
    inc ebx
    cmp eax, edi
    mov dword ptr [ebp - 4], ecx
    je L2
    jle L3
    cmp eax, 4
    jle L1
    cmp eax, 8
    jle L0
    cmp eax, 12
    jg L3
    mov dword ptr [ebp - 4], 3
    jmp L3
L0:
    mov dword ptr [ebp - 4], ecx
    jmp L3
L1:
    mov dword ptr [ebp - 4], ebx
    jmp L3
L2:
    mov dword ptr [ebp - 4], edi
L3:
    push 80
    call sub_100650BB
    cmp eax, edi
    je L4
    push dword ptr [ebp + 24]
    mov ecx, eax
    push ebx
    push edi
    push edi
    push edi
    push edi
    call sub_100832B5
    mov esi, eax
    jmp L5
L4:
    xor esi, esi
L5:
    cmp esi, edi
    je L13
    push 36
    call sub_100650E3
    cmp eax, edi
    je L6
    push 000000200h
    push ebx
    push ebx
    push dword ptr [ebp + 8]
    mov ecx, eax
    push edi
    call sub_10082EC1
    jmp L7
L6:
    xor eax, eax
L7:
    cmp eax, edi
    mov dword ptr [esi + 16], eax
    je L13
    push 64
    call sub_1006510B
    cmp dword ptr [ebp - 4], 3
    jne L8
    cmp eax, edi
    je L9
    push dword ptr [ebp + 24]
    fld qword ptr [ebp + 16]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push 3
    mov ecx, eax
    call sub_10083493
    jmp L10
L8:
    cmp eax, edi
    je L9
    push dword ptr [ebp + 24]
    mov ecx, eax
    push dword ptr [ebp + 12]
    push dword ptr [ebp - 4]
    call sub_10083474
    jmp L10
L9:
    xor eax, eax
L10:
    cmp eax, edi
    mov dword ptr [esi + 32], eax
    je L13
    push 20
    call sub_10065151
    cmp eax, edi
    je L11
    push 010114AE8h
    push edi
    push dword ptr [esi + 32]
    mov ecx, eax
    call sub_10082969
    jmp L12
L11:
    xor eax, eax
L12:
    cmp eax, edi
    jne L14
L13:
    xor eax, eax
    jmp L15
L14:
    mov ecx, dword ptr [ebp - 8]
    push esi
    mov dword ptr [esi + 32], eax
    call sub_1009A677
    mov eax, esi
L15:
    pop edi
    pop esi
    pop ebx
    leave
    ret 20
FUN_1009bdcd ENDP
END
