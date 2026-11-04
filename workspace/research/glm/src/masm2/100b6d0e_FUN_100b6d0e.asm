.686
.MODEL FLAT, C
EXTRN sub_100B6FE0:PROC
EXTRN sub_100B6FF4:PROC
EXTRN sub_100B7013:PROC
EXTRN sub_100B7018:PROC
EXTRN sub_100B701D:PROC
EXTRN sub_100B703B:PROC
EXTRN sub_100B707C:PROC
EXTRN sub_100B7083:PROC
EXTRN sub_100B7084:PROC
EXTRN sub_100B708E:PROC
EXTRN sub_100B709C:PROC
EXTRN sub_100B70F9:PROC
EXTRN sub_100B7108:PROC
EXTRN sub_100B7138:PROC
EXTRN sub_100B716A:PROC
EXTRN sub_100B716D:PROC
EXTRN sub_100B717F:PROC
EXTRN sub_100B7191:PROC
EXTRN sub_100B7195:PROC
EXTRN sub_100B71A6:PROC
EXTRN sub_100B71B6:PROC
EXTRN sub_100B720B:PROC
EXTRN sub_100B7239:PROC
EXTRN sub_100B7260:PROC
EXTRN sub_100C9AE3:PROC
EXTRN sub_100C9B26:PROC
EXTRN sub_100C9C12:PROC
EXTRN sub_100C9C3D:PROC
EXTRN sub_100C9CE5:PROC
EXTRN sub_100C9D0C:PROC
.CODE
FUN_100b6d0e PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 44
    push push ebx
    push push esi
    mov mov esi, ecx
    mov mov eax, dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [eax + 12]
    push push edi
    xor xor edi, edi
    cmp cmp ecx, dword ptr [eax + 4]
    mov mov dword ptr [ebp - 20], edi
    jbe L0
    mov mov eax, dword ptr [esi]
    push push edi
    push push edi
    push push 4
    lea lea ecx, [ebp - 44]
    push push ecx
    push push dword ptr [esi + 0FCh]
    mov mov ecx, esi
    call call dword ptr [eax + 080h]
    cmp cmp eax, edi
    jl sub_100B7013
    mov mov eax, dword ptr [esi + 0100h]
    push push edi
    push push edi
    push push edi
    push push edi
    push push 1
    push push edi
    push push edi
    push push dword ptr [eax + 8]
    lea lea eax, [ebp - 40]
    push push 1
    push push eax
    push push 78
    mov mov ecx, esi
    call sub_100C9AE3
    cmp cmp eax, edi
    jl sub_100B703B
    mov mov eax, dword ptr [esi + 0100h]
    xor xor ecx, ecx
    cmp cmp dword ptr [eax + 12], edi
    jbe L1
    mov mov edx, dword ptr [ebp - 40]
    mov mov dword ptr [ebp + ecx*4 - 44], edx
    inc inc ecx
    cmp cmp ecx, dword ptr [eax + 12]
    jb L1
    mov mov eax, dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [eax + 12]
    push push edi
    push push edi
    push push edi
    push push edi
    push push ecx
    push push edi
    push push edi
    lea lea edx, [ebp - 44]
    push push edx
    push push ecx
    push push dword ptr [eax + 16]
    mov mov ecx, esi
    push push 1
    call sub_100C9B26
    cmp cmp eax, edi
    jge sub_100B707C
    jmp sub_100B7083
    mov mov dword ptr [ebp - 16], edi
    mov mov eax, dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [eax + 12]
    cmp cmp ecx, edi
    mov mov dword ptr [ebp - 4], edi
    mov mov dword ptr [ebp - 24], ecx
    jbe sub_100B708E
    mov mov dword ptr [ebp - 12], 1
    mov mov dword ptr [ebp - 8], 2
    mov mov ebx, dword ptr [ebp - 4]
    mov mov eax, dword ptr [eax + 16]
    mov mov ecx, dword ptr [esi + 20]
    shl shl ebx, 2
    add add eax, ebx
    mov mov edx, dword ptr [eax]
    mov mov ecx, dword ptr [ecx + edx*4]
    mov mov ecx, dword ptr [ecx + 16]
    cmp cmp ecx, 1
    mov mov dword ptr [ebp - 28], ecx
    jne L2
    mov mov ecx, dword ptr [ebp - 8]
    cmp cmp ecx, dword ptr [ebp - 24]
    jae L3
    cmp cmp dword ptr [ebp - 16], 1
    jne sub_100B6FE0
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
    jmp sub_100B6FF4
    mov mov ecx, dword ptr [ebp - 12]
    cmp cmp ecx, dword ptr [ebp - 24]
    jb sub_100B701D
    cmp cmp dword ptr [ebp - 16], edi
    jne sub_100B7018
    cmp cmp dword ptr [ebp - 20], edi
    jne L4
    mov mov eax, dword ptr [esi]
    push push edi
    push push edi
    push push 4
    lea lea ecx, [ebp - 44]
    push push ecx
    push push dword ptr [esi + 0FCh]
    mov mov ecx, esi
    call call dword ptr [eax + 080h]
    cmp cmp eax, edi
    jl sub_100B7138
    mov mov dword ptr [ebp - 20], 1
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
    lea lea eax, [ebp - 40]
    push push eax
    push push 78
    mov mov ecx, esi
    call sub_100C9C12
    cmp cmp eax, edi
    jl sub_100B716A
    push push edi
    push push edi
    push push edi
    push push edi
    push push 1
    push push edi
    push push edi
    lea lea eax, [ebp - 40]
    push push eax
    mov mov eax, dword ptr [esi + 0100h]
    mov mov eax, dword ptr [eax + 16]
    push push 1
    add add eax, ebx
    push push eax
    push push 1
    mov mov ecx, esi
    call sub_100C9C3D
    cmp cmp eax, edi
    jl sub_100B7195
    inc inc dword ptr [ebp - 4]
    inc inc dword ptr [ebp - 8]
    inc inc dword ptr [ebp - 12]
    jmp sub_100B717F
    cmp cmp dword ptr [ebp - 28], edi
    jne sub_100B70F9
    mov mov ecx, dword ptr [eax + 4]
    mov mov eax, dword ptr [esi + 20]
    mov mov eax, dword ptr [eax + ecx*4]
    cmp cmp dword ptr [eax + 16], 1
    jne sub_100B7108
    cmp cmp dword ptr [ebp - 16], 1
    jne sub_100B7191
    mov mov eax, dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [eax + 8]
    mov mov eax, dword ptr [eax + 16]
    push push edi
    push push edi
    push push edi
    push push edi
    push push 2
    push push edi
    push push edi
    add add ecx, ebx
    push push ecx
    push push 2
    add add eax, ebx
    push push eax
    push push 19
    jmp sub_100B71A6
    cmp cmp dword ptr [ebp - 16], edi
    jne sub_100B71B6
    cmp cmp dword ptr [ebp - 20], edi
    jne sub_100B716D
    mov mov eax, dword ptr [esi]
    push push edi
    push push edi
    push push 4
    lea lea ecx, [ebp - 44]
    push push ecx
    push push dword ptr [esi + 0FCh]
    mov mov ecx, esi
    call call dword ptr [eax + 080h]
    cmp cmp eax, edi
    jl sub_100B720B
    mov mov dword ptr [ebp - 20], 1
    mov mov eax, dword ptr [esi + 0100h]
    mov mov eax, dword ptr [eax + 8]
    push push edi
    push push edi
    push push edi
    push push edi
    push push 2
    push push edi
    push push edi
    add add eax, ebx
    push push eax
    push push 2
    lea lea eax, [ebp - 44]
    push push eax
    push push 19
    mov mov ecx, esi
    call sub_100C9CE5
    cmp cmp eax, edi
    jl sub_100B7239
    push push edi
    push push edi
    push push edi
    push push edi
    push push 2
    push push edi
    push push edi
    lea lea eax, [ebp - 44]
    push push eax
    mov mov eax, dword ptr [esi + 0100h]
    mov mov eax, dword ptr [eax + 16]
    push push 2
    add add eax, ebx
    push push eax
    push push 1
    mov mov ecx, esi
    call sub_100C9D0C
    cmp cmp eax, edi
    jl sub_100B7260
    add add dword ptr [ebp - 8], 2
    add add dword ptr [ebp - 4], 2
    add add dword ptr [ebp - 12], 2
    mov mov eax, dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [eax + 12]
    cmp cmp dword ptr [ebp - 4], ecx
    mov mov dword ptr [ebp - 24], ecx
    jb sub_100B709C
    inc inc dword ptr [ebp - 16]
    cmp cmp dword ptr [ebp - 16], 2
L4:
    jb sub_100B7084
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_100b6d0e ENDP
END
