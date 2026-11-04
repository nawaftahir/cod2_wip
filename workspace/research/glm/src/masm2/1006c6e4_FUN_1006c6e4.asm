.686
.MODEL FLAT, C
EXTRN sub_1006C83C:PROC
EXTRN sub_1006C845:PROC
EXTRN sub_1006C84E:PROC
EXTRN sub_1006C8C1:PROC
EXTRN sub_1006C901:PROC
EXTRN sub_1006C905:PROC
EXTRN sub_1006C91B:PROC
EXTRN sub_10082732:PROC
EXTRN sub_1008274D:PROC
EXTRN EXTRN g_101AC95C:DWORD:DWORD
.CODE
FUN_1006c6e4 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ebx
    push push esi
    mov mov esi, dword ptr [ebp + 8]
    mov mov eax, dword ptr [esi + 20]
    xor xor edx, edx
    cmp cmp eax, edx
    mov mov ebx, ecx
    push push edi
    mov mov dword ptr [ebp - 4], ebx
    je sub_1006C83C
    cmp cmp dword ptr [esi + 40], edx
    je sub_1006C845
    cmp cmp dword ptr [esi + 56], edx
    jne sub_1006C84E
    cmp cmp eax, edx
    mov mov dword ptr [esi + 52], edx
    jbe L0
    mov mov ecx, dword ptr [esi + 16]
    shl shl ecx, 2
    mov mov eax, dword ptr [ebx + 24]
    mov mov eax, dword ptr [ecx + eax]
    mov mov edi, dword ptr [ebx + 8]
    mov mov edi, dword ptr [edi + 20]
    mov mov eax, dword ptr [edi + eax*4]
    mov mov eax, dword ptr [eax + 112]
    inc inc eax
    cmp cmp dword ptr [esi + 52], eax
    jae L2
    mov mov dword ptr [esi + 52], eax
    inc inc edx
    add add ecx, 4
    cmp cmp edx, dword ptr [esi + 20]
    jb L1
    mov mov eax, dword ptr [esi + 52]
    mov mov ecx, dword ptr [g_101AC95C]
    shl shl eax, 2
    push push 16
    push push eax
    call sub_10082732
    test test eax, eax
    mov mov dword ptr [esi + 56], eax
    je L3
    mov mov eax, dword ptr [esi + 20]
    mov mov ecx, dword ptr [g_101AC95C]
    shl shl eax, 2
    push push 16
    push push eax
    call sub_1008274D
    test test eax, eax
    mov mov dword ptr [esi + 60], eax
    jne L4
    mov mov eax, 08007000Eh
    jmp sub_1006C8C1
    mov mov ecx, dword ptr [esi + 52]
    mov mov edi, dword ptr [esi + 56]
    shl shl ecx, 2
    mov mov edx, ecx
    shr shr ecx, 2
    and and dword ptr [ebp + 8], 0
    xor xor eax, eax
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
    and and ecx, 3
    rep stosb rep stosb byte ptr es:[edi], al
    mov mov ecx, dword ptr [esi + 20]
    mov mov edi, dword ptr [esi + 60]
    shl shl ecx, 2
    mov mov edx, ecx
    shr shr ecx, 2
    xor xor eax, eax
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
    and and ecx, 3
    rep stosb rep stosb byte ptr es:[edi], al
    cmp cmp dword ptr [esi + 20], 0
    mov mov eax, dword ptr [esi + 40]
    mov mov eax, dword ptr [eax + 32]
    jbe sub_1006C901
    test test eax, eax
    je sub_1006C905
    mov mov ecx, dword ptr [esi + 16]
    add add ecx, dword ptr [ebp + 8]
    mov mov edi, dword ptr [ebx + 24]
    mov mov edx, dword ptr [ebx + 8]
    mov mov ecx, dword ptr [edi + ecx*4]
    mov mov edi, dword ptr [edx + 20]
    mov mov ecx, dword ptr [edi + ecx*4]
    mov mov edi, dword ptr [ecx + 4]
    mov mov edx, dword ptr [edx + 16]
    mov mov edx, dword ptr [edx + edi*4]
    test test byte ptr [edx + 4], 080h
    jne sub_1006C91B
    mov mov edx, dword ptr [eax + 8]
    mov mov edi, dword ptr [ecx + 112]
    mov mov ebx, dword ptr [esi + 56]
    add add edx, 16
    mov mov dword ptr [ebx + edi*4], edx
    mov mov edx, dword ptr [eax + 8]
    mov mov ecx, dword ptr [ecx + 100]
    mov mov edi, dword ptr [esi + 60]
    mov mov ebx, dword ptr [ebp - 4]
    add add edx, 16
    mov mov dword ptr [edi + ecx*4], edx
    inc inc dword ptr [ebp + 8]
    mov mov ecx, dword ptr [ebp + 8]
    cmp cmp ecx, dword ptr [esi + 20]
    mov mov eax, dword ptr [eax + 12]
L4:
    jb sub_1006C901
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 4
FUN_1006c6e4 ENDP
END
