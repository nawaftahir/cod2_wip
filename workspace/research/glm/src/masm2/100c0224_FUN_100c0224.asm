.686
.MODEL FLAT, C
EXTRN sub_100B9A0E:PROC
EXTRN sub_100B9A3C:PROC
EXTRN sub_100C03C2:PROC
EXTRN sub_100C03CA:PROC
EXTRN sub_100C03FD:PROC
EXTRN sub_100C0402:PROC
EXTRN sub_100C0421:PROC
EXTRN sub_100C0433:PROC
EXTRN sub_100C0439:PROC
EXTRN sub_100C045E:PROC
EXTRN sub_100C046C:PROC
EXTRN sub_100C0490:PROC
EXTRN sub_100C049A:PROC
EXTRN EXTRN g_1019BE20:DWORD:DWORD
.CODE
FUN_100c0224 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 0FCh
    push push ebx
    push push esi
    push push edi
    mov mov edi, ecx
    mov mov eax, dword ptr [edi + 0100h]
    mov mov esi, dword ptr [eax]
    xor xor ecx, ecx
    mov mov dword ptr [ebp - 4], ecx
    mov mov dword ptr [ebp - 28], ecx
    xor xor ebx, ebx
    mov mov dword ptr [ebp - 12], ecx
    inc inc ebx
    push push ebx
    and and esi, 0FFFFFh
    push push esi
    lea lea ecx, [ebp - 28]
    push push ecx
    lea lea ecx, [ebp - 0FCh]
    push push ecx
    lea lea ecx, [ebp - 4]
    push push ecx
    lea lea ecx, [ebp - 92]
    push push ecx
    push push 010119138h
    push push eax
    mov mov ecx, edi
    mov mov dword ptr [ebp - 24], ebx
    mov mov dword ptr [ebp - 20], 2
    mov mov dword ptr [ebp - 16], 3
    call sub_100B9A0E
    cmp cmp eax, ebx
    jne L0
    push push ebx
    push push esi
    lea lea eax, [ebp - 28]
    push push eax
    lea lea eax, [ebp - 0FCh]
    push push eax
    lea lea eax, [ebp - 4]
    push push eax
    lea lea eax, [ebp - 92]
    push push eax
    push push 010119198h
    push push dword ptr [edi + 0100h]
    mov mov ecx, edi
    mov mov dword ptr [ebp - 12], ebx
    call sub_100B9A3C
    test test eax, eax
    jne sub_100C0402
    and and dword ptr [ebp - 8], eax
    test test esi, esi
    jbe sub_100C03C2
    mov mov eax, esi
    shl shl eax, 2
    mov mov dword ptr [ebp - 4], eax
    mov mov eax, dword ptr [ebp - 8]
    shl shl eax, 2
    mov mov ecx, dword ptr [ebp + eax - 0ECh]
    cmp cmp ecx, dword ptr [ebp + eax - 0DCh]
    jne sub_100C03FD
    mov mov eax, dword ptr [edi + 0100h]
    mov mov eax, dword ptr [eax + 8]
    mov mov ecx, dword ptr [ebp - 4]
    mov mov eax, dword ptr [ecx + eax]
    mov mov ecx, dword ptr [edi + 20]
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov eax, dword ptr [ecx + 4]
    mov mov edx, dword ptr [edi + 16]
    mov mov eax, dword ptr [edx + eax*4]
    test test byte ptr [eax + 5], 1
    je sub_100C0421
    fld fld qword ptr [g_1019BE20]
    fld fld qword ptr [ecx + 32]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp sub_100C0433
L0:
    cmp cmp dword ptr [ecx + 8], -1
    jne sub_100C0439
    inc inc dword ptr [ebp - 8]
    add add dword ptr [ebp - 4], 4
    cmp cmp dword ptr [ebp - 8], esi
    jb sub_100C03CA
    mov mov edx, dword ptr [edi + 0100h]
    mov mov ecx, esi
    xor xor eax, eax
    and and ecx, 0FFFFFh
    cmp cmp dword ptr [ebp - 12], eax
    je sub_100C045E
    or or ecx, 074400000h
    jmp sub_100C046C
    mov mov eax, ebx
    jmp sub_100C0490
    or or ecx, 074500000h
    cmp cmp esi, eax
    mov mov dword ptr [edx], ecx
    jbe sub_100C049A
    mov mov ecx, dword ptr [edi + 0100h]
    mov mov edx, dword ptr [ebp + eax*4 - 0ECh]
    mov mov ecx, dword ptr [ecx + 8]
    mov mov dword ptr [ecx + eax*4], edx
    inc inc eax
    cmp cmp eax, esi
    jb sub_100C049A
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_100c0224 ENDP
END
