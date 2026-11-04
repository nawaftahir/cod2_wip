.686
.MODEL FLAT, C
EXTRN sub_100B3FAD:PROC
EXTRN sub_100B5185:PROC
EXTRN sub_100B5194:PROC
EXTRN sub_100B5196:PROC
EXTRN sub_100B51AA:PROC
EXTRN sub_100B51B7:PROC
EXTRN sub_100B51DB:PROC
EXTRN sub_100B51DF:PROC
EXTRN sub_100B51F2:PROC
EXTRN sub_100B5222:PROC
EXTRN sub_100B523C:PROC
.CODE
FUN_100b50b6 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 36
    mov mov eax, dword ptr [ebp + 8]
    push push ebx
    mov mov ebx, dword ptr [eax]
    and and ebx, 0FFFFFh
    mov mov dword ptr [ebp - 16], ecx
    jne L0
    xor xor eax, eax
    inc inc eax
    jmp sub_100B5196
    mov mov eax, dword ptr [eax + 4]
    xor xor edx, edx
    div div ebx
    and and dword ptr [ebp - 12], 0
    push push esi
    push push edi
    test test eax, eax
    mov mov dword ptr [ebp - 20], eax
    jbe sub_100B51AA
    mov mov esi, dword ptr [ecx + 108]
    shl shl esi, 30
    sar sar esi, 31
    and and dword ptr [ebp - 8], 0
    or or eax, -1
    lea lea edi, [ebp - 36]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    xor xor ecx, ecx
    test test ebx, ebx
    stosd stosd dword ptr es:[edi], eax
    jbe sub_100B5185
    mov mov eax, dword ptr [ebp - 16]
    mov mov edx, dword ptr [eax + 20]
    mov mov eax, dword ptr [ebp + 8]
    mov mov eax, dword ptr [eax + 8]
    add add eax, dword ptr [ebp - 8]
    mov mov edi, dword ptr [eax]
    mov mov edi, dword ptr [edx + edi*4]
    mov mov edi, dword ptr [edi + 16]
    mov mov dword ptr [ebp + ecx*4 - 36], edi
    inc inc ecx
    add add eax, 4
    cmp cmp ecx, ebx
    jb sub_100B5194
    test test esi, esi
    je sub_100B51DB
    xor xor edi, edi
    mov mov dword ptr [ebp - 4], 0101A4218h
    push push dword ptr [ebp - 4]
    mov mov ecx, dword ptr [ebp - 16]
    lea lea eax, [ebp - 36]
    push push eax
    call sub_100B3FAD
    test test eax, eax
    jne sub_100B51F2
    add add dword ptr [ebp - 4], 16
    inc inc edi
    cmp cmp edi, 8
    jb sub_100B51DF
    cmp cmp edi, 8
    je sub_100B5222
    inc inc dword ptr [ebp - 12]
    mov mov eax, ebx
    shl shl eax, 2
    add add dword ptr [ebp - 8], eax
    mov mov eax, dword ptr [ebp - 12]
    cmp cmp eax, dword ptr [ebp - 20]
    jb sub_100B51B7
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 4
    xor xor eax, eax
    inc inc eax
    jmp sub_100B523C
FUN_100b50b6 ENDP
END
