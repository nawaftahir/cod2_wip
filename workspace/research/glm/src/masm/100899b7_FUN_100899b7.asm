.686
.MODEL FLAT, C
.CODE
FUN_100899b7 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    mov eax, ecx
    push ebx
    mov ebx, dword ptr [ebp + 12]
    xor ecx, ecx
    inc ecx
    cmp dword ptr [ebp + 16], ecx
    push esi
    push edi
    mov dword ptr [ebp - 4], eax
    jbe L1
    mov edx, dword ptr [eax + 20]
    mov eax, dword ptr [ebx]
    mov esi, dword ptr [edx + eax*4]
L0:
    mov eax, dword ptr [ebx + ecx*4]
    fld qword ptr [esi + 32]
    mov eax, dword ptr [edx + eax*4]
    fld qword ptr [eax + 32]
    fucompp
    fnstsw ax
    test ah, 68
    jp L6
    inc ecx
    cmp ecx, dword ptr [ebp + 16]
    jb L0
L1:
    and dword ptr [ebp + 12], 0
    mov edi, dword ptr [ebp + 8]
L2:
    mov edx, dword ptr [ebp + 12]
    dec edx
    and edx, 3
    mov esi, dword ptr [edi + edx*4]
    cmp esi, -1
    je L3
    mov eax, dword ptr [ebp - 4]
    mov eax, dword ptr [eax + 20]
    mov ecx, dword ptr [ebx]
    mov ecx, dword ptr [eax + ecx*4]
    mov eax, dword ptr [eax + esi*4]
    fld qword ptr [eax + 32]
    fld qword ptr [ecx + 32]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L4
L3:
    inc dword ptr [ebp + 12]
    cmp dword ptr [ebp + 12], 4
    jb L2
    jmp L12
L4:
    xor eax, eax
    cmp dword ptr [ebp + 16], eax
    jbe L12
    lea edx, [edi + edx*4]
L5:
    mov ecx, dword ptr [edx]
    mov dword ptr [ebx + eax*4], ecx
    inc eax
    cmp eax, dword ptr [ebp + 16]
    jb L5
    jmp L12
L6:
    xor esi, esi
    cmp dword ptr [ebp + 16], esi
    jbe L12
L7:
    and dword ptr [ebp + 12], 0
L8:
    mov eax, dword ptr [ebp + 12]
    lea edx, [eax + esi]
    mov eax, dword ptr [ebp + 8]
    and edx, 3
    mov edi, dword ptr [eax + edx*4]
    cmp edi, -1
    je L9
    mov eax, dword ptr [ebp - 4]
    mov eax, dword ptr [eax + 20]
    mov ecx, dword ptr [ebx + esi*4]
    mov ecx, dword ptr [eax + ecx*4]
    mov eax, dword ptr [eax + edi*4]
    fld qword ptr [eax + 32]
    fld qword ptr [ecx + 32]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L10
L9:
    inc dword ptr [ebp + 12]
    cmp dword ptr [ebp + 12], 4
    jb L8
    jmp L11
L10:
    mov eax, dword ptr [ebp + 8]
    mov eax, dword ptr [eax + edx*4]
    mov dword ptr [ebx + esi*4], eax
L11:
    inc esi
    cmp esi, dword ptr [ebp + 16]
    jb L7
L12:
    pop edi
    pop esi
    xor eax, eax
    pop ebx
    leave
    ret 12
FUN_100899b7 ENDP
END
