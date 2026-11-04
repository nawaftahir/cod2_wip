.686
.MODEL FLAT, C
EXTRN sub_100B749C:PROC
EXTRN sub_100B74CB:PROC
EXTRN sub_100B74D7:PROC
EXTRN sub_100B74F4:PROC
EXTRN sub_100B751E:PROC
EXTRN sub_100B7534:PROC
EXTRN sub_100B753B:PROC
EXTRN sub_100B7544:PROC
EXTRN sub_100B7547:PROC
EXTRN sub_100B7563:PROC
EXTRN sub_100B75A6:PROC
EXTRN sub_100B75D4:PROC
EXTRN sub_100B75FE:PROC
EXTRN sub_100C9B5B:PROC
EXTRN sub_100C9B9D:PROC
EXTRN sub_100C9C3F:PROC
EXTRN sub_100C9C69:PROC
EXTRN sub_100CB3D0:PROC
.CODE
FUN_100b720b PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 24
    push push ebx
    push push esi
    mov mov esi, ecx
    mov mov eax, dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [eax + 12]
    push push edi
    xor xor edi, edi
    cmp cmp ecx, edi
    mov mov dword ptr [ebp - 4], edi
    jbe L0
    mov mov edx, dword ptr [esi + 20]
    mov mov eax, dword ptr [eax + 16]
    mov mov ebx, dword ptr [eax]
    mov mov ebx, dword ptr [edx + ebx*4]
    test test byte ptr [ebx + 3], 2
    je L2
    inc inc dword ptr [ebp - 4]
    add add eax, 4
    cmp cmp dword ptr [ebp - 4], ecx
    jb L1
    cmp cmp dword ptr [ebp - 4], ecx
    jae L3
    mov mov eax, dword ptr [esi + 0100h]
    push push edi
    push push edi
    push push dword ptr [eax + 4]
    push push dword ptr [eax + 12]
    push push dword ptr [eax + 8]
    push push dword ptr [eax + 16]
    push push 15
    jmp L4
    mov mov eax, dword ptr [esi + 0C8h]
    and and eax, 0FFFFh
    cmp cmp eax, 0200h
    mov mov eax, dword ptr [esi + 0100h]
    jb L5
    push push edi
    push push edi
    push push dword ptr [eax + 4]
    push push dword ptr [eax + 12]
    push push dword ptr [eax + 8]
    push push dword ptr [eax + 16]
    push push 79
    mov mov ecx, esi
    call sub_100CB3D0
    jmp sub_100B749C
    mov mov edx, dword ptr [eax + 12]
    cmp cmp edx, dword ptr [eax + 4]
    mov mov dword ptr [ebp - 8], edi
    jbe L6
    mov mov eax, dword ptr [esi]
    push push edi
    push push edi
    push push 4
    lea lea ecx, [ebp - 24]
    push push ecx
    push push dword ptr [esi + 0FCh]
    mov mov ecx, esi
    call call dword ptr [eax + 080h]
    cmp cmp eax, edi
    jl sub_100B74CB
    mov mov eax, dword ptr [esi + 0100h]
    push push edi
    push push edi
    push push edi
    push push edi
    xor xor ebx, ebx
    inc inc ebx
    push push ebx
    push push edi
    push push edi
    push push dword ptr [eax + 8]
    lea lea eax, [ebp - 16]
    push push ebx
    push push eax
    push push 79
    mov mov ecx, esi
    call sub_100C9B5B
    cmp cmp eax, edi
    jl sub_100B74F4
    mov mov eax, dword ptr [esi + 0100h]
    xor xor ecx, ecx
    cmp cmp dword ptr [eax + 12], edi
    jbe L7
    mov mov edx, dword ptr [ebp - 16]
    mov mov dword ptr [ebp + ecx*4 - 24], edx
    inc inc ecx
    cmp cmp ecx, dword ptr [eax + 12]
L5:
    jb L7
    mov mov eax, dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [eax + 12]
    push push edi
    push push edi
    push push edi
    push push edi
    push push ecx
    push push edi
    push push edi
    lea lea edx, [ebp - 24]
    push push edx
    push push ecx
    push push dword ptr [eax + 16]
    mov mov ecx, esi
    push push ebx
    call sub_100C9B9D
    cmp cmp eax, edi
    jge sub_100B7534
    jmp sub_100B753B
    cmp cmp ecx, edi
    mov mov dword ptr [ebp - 4], edi
    jbe sub_100B7544
    xor xor ebx, ebx
    inc inc ebx
    mov mov ecx, dword ptr [ebp - 4]
    mov mov eax, dword ptr [esi + 0100h]
    mov mov eax, dword ptr [eax + 16]
    mov mov edx, dword ptr [esi + 20]
    shl shl ecx, 2
    mov mov eax, dword ptr [ecx + eax]
    mov mov eax, dword ptr [edx + eax*4]
    cmp cmp dword ptr [eax + 16], 2
    jne sub_100B74D7
    mov mov eax, dword ptr [esi + 0100h]
    mov mov edx, dword ptr [eax + 8]
    mov mov eax, dword ptr [eax + 16]
    push push edi
    push push edi
    push push edi
    push push edi
    push push ebx
    push push edi
    push push edi
    add add edx, ecx
    push push edx
    push push ebx
    add add eax, ecx
    push push eax
    push push 79
    jmp sub_100B7563
    cmp cmp dword ptr [ebp - 8], edi
    jne sub_100B751E
    mov mov eax, dword ptr [esi]
    push push edi
    push push edi
    push push 4
    lea lea ecx, [ebp - 24]
    push push ecx
    push push dword ptr [esi + 0FCh]
    mov mov ecx, esi
    call call dword ptr [eax + 080h]
    cmp cmp eax, edi
    jl sub_100B75A6
    mov mov dword ptr [ebp - 8], ebx
    mov mov eax, dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [eax + 8]
    mov mov eax, dword ptr [ebp - 4]
    push push edi
    push push edi
    push push edi
    push push edi
    push push ebx
    push push edi
    push push edi
    shl shl eax, 2
    add add ecx, eax
    push push ecx
    push push ebx
    lea lea eax, [ebp - 16]
    push push eax
    push push 79
    mov mov ecx, esi
    call sub_100C9C3F
    cmp cmp eax, edi
    jl sub_100B75D4
    push push edi
    push push edi
L6:
    push push edi
    push push edi
    push push ebx
    push push edi
    push push edi
    lea lea eax, [ebp - 16]
    push push eax
    mov mov eax, dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [eax + 16]
    mov mov eax, dword ptr [ebp - 4]
    shl shl eax, 2
    push push ebx
    add add ecx, eax
    push push ecx
    push push ebx
    mov mov ecx, esi
    call sub_100C9C69
    cmp cmp eax, edi
    jl sub_100B75FE
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [ebp - 4]
    cmp cmp ecx, dword ptr [eax + 12]
    jb sub_100B7547
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_100b720b ENDP
END
