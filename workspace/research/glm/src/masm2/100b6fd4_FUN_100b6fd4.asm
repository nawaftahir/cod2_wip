.686
.MODEL FLAT, C
EXTRN sub_100B7292:PROC
EXTRN sub_100B7299:PROC
EXTRN sub_100B72C1:PROC
EXTRN sub_100B72CA:PROC
EXTRN sub_100B72D1:PROC
EXTRN sub_100B72E9:PROC
EXTRN sub_100B7307:PROC
EXTRN sub_100B732A:PROC
EXTRN sub_100B732D:PROC
EXTRN sub_100B7331:PROC
EXTRN sub_100B7336:PROC
EXTRN sub_100B733A:PROC
EXTRN sub_100B7347:PROC
EXTRN sub_100B73AC:PROC
EXTRN sub_100B73D6:PROC
EXTRN sub_100B73DA:PROC
EXTRN sub_100B7421:PROC
EXTRN sub_100C9B5A:PROC
EXTRN sub_100C9B9D:PROC
EXTRN sub_100C9C4F:PROC
EXTRN sub_100C9C96:PROC
EXTRN sub_100CB3D0:PROC
.CODE
FUN_100b6fd4 PROC
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
    push push 14
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
    push push 78
    mov mov ecx, esi
    call sub_100CB3D0
    jmp sub_100B7292
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
    jl sub_100B72C1
    mov mov eax, dword ptr [esi + 0100h]
    push push edi
    push push edi
    push push edi
    push push edi
    push push 1
    push push edi
    push push edi
    push push dword ptr [eax + 8]
    lea lea eax, [ebp - 16]
    push push 1
    push push eax
    push push 78
    mov mov ecx, esi
    call sub_100C9B5A
    cmp cmp eax, edi
    jl sub_100B72E9
    mov mov eax, dword ptr [esi + 0100h]
    xor xor ecx, ecx
    cmp cmp dword ptr [eax + 12], edi
    jbe L7
    mov mov edx, dword ptr [ebp - 16]
    mov mov dword ptr [ebp + ecx*4 - 24], edx
    inc inc ecx
    cmp cmp ecx, dword ptr [eax + 12]
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
    push push 1
    call sub_100C9B9D
    cmp cmp eax, edi
    jge sub_100B732A
    jmp sub_100B7331
    cmp cmp ecx, edi
    mov mov dword ptr [ebp - 4], edi
    jbe sub_100B733A
    mov mov eax, dword ptr [esi + 0100h]
    mov mov ebx, dword ptr [ebp - 4]
    mov mov edx, dword ptr [eax + 16]
    mov mov ecx, dword ptr [esi + 20]
    mov mov eax, dword ptr [eax + 8]
    shl shl ebx, 2
    mov mov edx, dword ptr [ebx + edx]
    mov mov edx, dword ptr [ecx + edx*4]
    mov mov edx, dword ptr [edx + 16]
    cmp cmp edx, edi
    mov mov eax, dword ptr [ebx + eax]
    mov mov ecx, dword ptr [ecx + eax*4]
    jne sub_100B7299
    test test byte ptr [ecx], 2
    jne sub_100B732D
    cmp cmp edx, 2
    je sub_100B7336
    cmp cmp edx, 3
    jne sub_100B72CA
    mov mov ecx, dword ptr [ecx]
    test test cl, 4
    je sub_100B72D1
    test test cl, 8
    jne sub_100B7347
    cmp cmp dword ptr [ebp - 8], edi
    jne sub_100B7307
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
    jl sub_100B73AC
    mov mov dword ptr [ebp - 8], 1
    mov mov eax, dword ptr [esi + 0100h]
    mov mov eax, dword ptr [eax + 8]
    push push edi
    push push edi
    push push edi
    push push edi
    push push 1
    push push edi
    push push edi
    add add eax, ebx
    push push eax
    push push 1
    lea lea eax, [ebp - 16]
L6:
    push push eax
    push push 78
    mov mov ecx, esi
    call sub_100C9C4F
    cmp cmp eax, edi
    jl sub_100B73DA
    push push edi
    push push edi
    push push edi
    push push edi
    push push 1
    push push edi
    push push edi
    lea lea eax, [ebp - 16]
    push push eax
    mov mov eax, dword ptr [esi + 0100h]
    mov mov eax, dword ptr [eax + 16]
    push push 1
    add add eax, ebx
L7:
    push push eax
    push push 1
    jmp sub_100B73D6
    mov mov eax, dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [eax + 8]
    mov mov eax, dword ptr [eax + 16]
    push push edi
    push push edi
    push push edi
    push push edi
    push push 1
    push push edi
    push push edi
    add add ecx, ebx
    push push ecx
    push push 1
    add add eax, ebx
    push push eax
    push push 78
    mov mov ecx, esi
    call sub_100C9C96
    cmp cmp eax, edi
    jl sub_100B7421
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [ebp - 4]
    cmp cmp ecx, dword ptr [eax + 12]
    jb sub_100B733A
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_100b6fd4 ENDP
END
