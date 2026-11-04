.686
.MODEL FLAT, C
EXTRN sub_100861EE:PROC
EXTRN sub_1008B1DA:PROC
EXTRN sub_100AA1AC:PROC
EXTRN sub_100AA1B7:PROC
EXTRN sub_100AA1C0:PROC
EXTRN sub_100AA1CE:PROC
EXTRN sub_100AA1D7:PROC
EXTRN sub_100AA1F6:PROC
EXTRN sub_100AA244:PROC
EXTRN sub_100AA276:PROC
EXTRN sub_100AA297:PROC
EXTRN sub_100AA2B2:PROC
.CODE
FUN_100aa07d PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 12
    push push ebx
    mov mov ebx, ecx
    xor xor ecx, ecx
    xor xor eax, eax
    cmp cmp dword ptr [ebp + 12], ecx
    push push esi
    push push edi
    mov mov dword ptr [ebp - 12], eax
    jbe L2
    mov mov edx, dword ptr [ebp + 8]
    mov mov edi, dword ptr [edx + eax*4]
    cmp cmp edi, ecx
    je L1
    cmp cmp dword ptr [edi + 4], ecx
    mov mov dword ptr [ebp - 8], ecx
    jbe L3
    mov mov esi, dword ptr [ebp - 8]
    mov mov edx, dword ptr [edi + 8]
    mov mov edx, dword ptr [edx + esi*4]
    mov mov eax, dword ptr [ebx + 20]
    mov mov esi, dword ptr [eax + edx*4]
    mov mov edx, dword ptr [esi + 4]
    cmp cmp edx, dword ptr [ebx + 080h]
    jne sub_100AA1B7
    cmp cmp dword ptr [esi + 60], ecx
    je sub_100AA1C0
    mov mov edx, dword ptr [esi + 108]
    and and edx, 0FFh
    cmp cmp edx, dword ptr [ebp + 16]
    jne sub_100AA1CE
    movzx movzx edx, byte ptr [esi + 109]
    cmp cmp dword ptr [ebp + 20], edx
    jne sub_100AA1D7
    cmp cmp dword ptr [ebp + 24], ecx
    mov mov dword ptr [ebp - 4], ecx
    jbe sub_100AA1D7
    mov mov edx, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [ebp + 28]
    mov mov ecx, dword ptr [ecx + edx*4]
    mov mov edx, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [esi + 16]
    cmp cmp ecx, dword ptr [edx + 16]
    je sub_100AA1AC
    inc inc dword ptr [ebp - 4]
    mov mov ecx, dword ptr [ebp - 4]
    cmp cmp ecx, dword ptr [ebp + 24]
    jb L0
    jmp sub_100AA1F6
    push push ecx
    fldz fldz
    push push ecx
    fstp fstp qword ptr [esp]
    push push ecx
    push push 0
    push push dword ptr [ebx + 088h]
    mov mov ecx, ebx
    call sub_100861EE
    cmp cmp eax, -1
    je sub_100AA244
    mov mov ecx, dword ptr [ebx + 20]
    mov mov edx, dword ptr [esi + 60]
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov esi, dword ptr [ebp - 4]
    mov mov dword ptr [ecx + 60], edx
    mov mov edx, dword ptr [ebp + 28]
    mov mov edx, dword ptr [edx + esi*4]
    mov mov dword ptr [ecx + 56], edx
    mov mov ecx, dword ptr [edi + 8]
    mov mov edx, dword ptr [ebp - 8]
    mov mov dword ptr [ecx + edx*4], eax
    xor xor ecx, ecx
    mov mov eax, dword ptr [ebp + 24]
    cmp cmp dword ptr [ebp - 4], eax
    je sub_100AA276
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [edi + 4]
    jb L3
    mov mov eax, dword ptr [ebp - 12]
    inc inc eax
    cmp cmp eax, dword ptr [ebp + 12]
    mov mov dword ptr [ebp - 12], eax
    jb L2
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 24
    mov mov eax, 08007000Eh
    jmp sub_100AA297
    push push 010116D20h
L0:
    push push 012C2h
    push push ecx
L1:
    push push ebx
    call sub_1008B1DA
    add add esp, 16
    mov mov eax, 080004005h
    jmp sub_100AA2B2
FUN_100aa07d ENDP
END
