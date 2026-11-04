.686
.MODEL FLAT, C
EXTRN sub_1008B20A:PROC
EXTRN sub_100ACB1F:PROC
EXTRN sub_100ACB2E:PROC
EXTRN sub_100ACB35:PROC
EXTRN sub_100ACB39:PROC
EXTRN sub_100ACB65:PROC
EXTRN sub_100ACB79:PROC
EXTRN sub_100ACB83:PROC
EXTRN sub_100ACB8A:PROC
EXTRN sub_100ACB92:PROC
EXTRN sub_100ACBAC:PROC
EXTRN sub_100ACBF3:PROC
EXTRN sub_100ACC54:PROC
.CODE
FUN_100ac9bb PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 32
    mov mov eax, dword ptr [ebp + 12]
    push push ebx
    push push esi
    push push edi
    mov mov dword ptr [ebp - 16], ecx
    jmp L6
    mov mov ecx, dword ptr [ebp + 8]
    mov mov ecx, dword ptr [ecx + eax*4]
    test test ecx, ecx
    mov mov dword ptr [ebp - 28], ecx
    je L8
    mov mov eax, dword ptr [ecx]
    mov mov esi, eax
    and and esi, 0FFFFFh
    test test eax, eax
    mov mov dword ptr [ebp - 20], esi
    je sub_100ACB1F
    mov mov eax, dword ptr [ecx + 4]
    xor xor edx, edx
    div div esi
    and and dword ptr [ebp - 12], 0
    test test eax, eax
    mov mov dword ptr [ebp - 32], eax
    jbe sub_100ACB35
    and and dword ptr [ebp + 12], 0
    and and dword ptr [ebp - 4], 0
    test test esi, esi
    jbe sub_100ACB2E
    mov mov eax, dword ptr [ebp - 16]
    mov mov edx, dword ptr [ecx + 8]
    mov mov edi, dword ptr [eax + 20]
    add add edx, dword ptr [ebp + 12]
    mov mov dword ptr [ebp - 8], esi
    mov mov esi, dword ptr [edx]
    mov mov ebx, dword ptr [edi + esi*4]
    xor xor eax, eax
    cmp cmp dword ptr [ebp + 24], eax
    jbe L3
    mov mov ecx, dword ptr [ebp + 20]
    mov mov ecx, dword ptr [ecx + eax*4]
    cmp cmp esi, ecx
    je L0
    cmp cmp dword ptr [ebx + 56], ecx
    jne L4
    cmp cmp dword ptr [ebx + 12], -1
    jne L5
    mov mov dword ptr [ebp - 4], 1
    inc inc eax
    cmp cmp eax, dword ptr [ebp + 24]
    jb L2
    mov mov ecx, dword ptr [ebp - 28]
    add add edx, 4
    dec dec dword ptr [ebp - 8]
    jne L1
    cmp cmp dword ptr [ebp - 4], 0
    je sub_100ACB79
    mov mov eax, dword ptr [ebp + 12]
    and and dword ptr [ebp - 8], 0
    mov mov dword ptr [ebp - 4], eax
    mov mov eax, dword ptr [ecx + 8]
    mov mov edx, dword ptr [ebp - 4]
    mov mov edx, dword ptr [edx + eax]
    mov mov eax, dword ptr [ebp - 16]
    mov mov eax, dword ptr [eax + 20]
    mov mov esi, dword ptr [eax + edx*4]
    mov mov esi, dword ptr [esi + 56]
    cmp cmp esi, -1
    jne sub_100ACB65
    mov mov esi, edx
    mov mov eax, dword ptr [ebp + 32]
    mov mov edx, dword ptr [eax]
    xor xor edi, edi
    test test edx, edx
    jbe sub_100ACB8A
    mov mov ebx, dword ptr [ebp + 28]
    cmp cmp dword ptr [ebx + edi*4], esi
    je sub_100ACB92
    inc inc edi
    cmp cmp edi, dword ptr [eax]
    jb sub_100ACB8A
    cmp cmp edi, edx
    jne sub_100ACBAC
    cmp cmp edi, 32
    je sub_100ACBF3
    mov mov edi, dword ptr [ebp + 28]
    mov mov dword ptr [edi + edx*4], esi
    inc inc dword ptr [eax]
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    add add dword ptr [ebp - 4], 4
    cmp cmp eax, dword ptr [ebp - 20]
    jb sub_100ACB83
    mov mov esi, dword ptr [ebp - 20]
    inc inc dword ptr [ebp - 12]
    mov mov eax, esi
    shl shl eax, 2
    add add dword ptr [ebp + 12], eax
L2:
    mov mov eax, dword ptr [ebp - 12]
L3:
    cmp cmp eax, dword ptr [ebp - 32]
    jb sub_100ACB39
    mov mov eax, dword ptr [ebp - 24]
L5:
    inc inc eax
    cmp cmp eax, dword ptr [ebp + 16]
    mov mov dword ptr [ebp - 24], eax
    jb L7
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 28
    push push 01011721Ch
    push push 012C3h
    push push 0
    push push dword ptr [ebp - 16]
    call sub_1008B20A
    add add esp, 16
    mov mov eax, 080004005h
    jmp sub_100ACC54
FUN_100ac9bb ENDP
END
