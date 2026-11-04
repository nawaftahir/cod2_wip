.686
.MODEL FLAT, C
EXTRN sub_10068CA3:PROC
EXTRN sub_10068CBE:PROC
EXTRN sub_1006A7FE:PROC
EXTRN sub_1008420E:PROC
EXTRN sub_10084229:PROC
EXTRN sub_10084252:PROC
EXTRN sub_100C4FCE:PROC
EXTRN sub_100C4FDA:PROC
EXTRN sub_100C4FF9:PROC
EXTRN sub_100C502C:PROC
EXTRN sub_100C5030:PROC
EXTRN sub_100C50B1:PROC
EXTRN sub_100C50B3:PROC
EXTRN sub_100C50D2:PROC
EXTRN sub_100C50D8:PROC
EXTRN sub_100C50F3:PROC
EXTRN sub_100C511C:PROC
EXTRN sub_100F5F8A:PROC
EXTRN sub_100F63E6:PROC
EXTRN sub_100F78AF:PROC
EXTRN sub_100F7A15:PROC
.CODE
FUN_100c4df7 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 56
    push push esi
    push push edi
    xor xor edi, edi
    mov mov esi, ecx
    cmp cmp dword ptr [esi + 0158h], edi
    mov mov dword ptr [ebp - 4], edi
    mov mov dword ptr [ebp - 8], edi
    jne L0
    xor xor eax, eax
    jmp sub_100C4FCE
    mov mov eax, dword ptr [esi + 01D0h]
    add add eax, dword ptr [esi + 01F0h]
    add add eax, dword ptr [esi + 01F4h]
    je sub_100C4FDA
    shl shl eax, 2
    push push ebx
L0:
    push push eax
    call sub_100F78AF
    mov mov ebx, eax
    cmp cmp ebx, edi
    pop pop ecx
    mov mov dword ptr [ebp - 8], ebx
    jne L1
    mov mov dword ptr [ebp - 4], 08007000Eh
    jmp sub_100C4FF9
    cmp cmp dword ptr [esi + 44], 0
    jbe L2
    lea lea ebx, [esi + 01B4h]
    push push edi
    lea lea eax, [ebp - 56]
    push push 01011A3ACh
    push push eax
    call sub_100F5F8A
    add add esp, 12
    push push 1
    push push edi
    lea lea eax, [ebp - 56]
    push push eax
    mov mov ecx, ebx
    call sub_1006A7FE
    test test eax, eax
    mov mov dword ptr [ebp - 4], eax
    jl sub_100C5030
    inc inc edi
    cmp cmp edi, dword ptr [esi + 44]
    jb L3
    mov mov ebx, dword ptr [ebp - 8]
    push push ebx
    lea lea ecx, [esi + 01B4h]
    call sub_10068CA3
    mov mov edi, dword ptr [esi + 01D0h]
    add add edi, dword ptr [esi + 01F4h]
    lea lea ecx, [esi + 01D4h]
    lea lea eax, [ebx + edi*4]
    push push eax
    call sub_10068CBE
    add add edi, dword ptr [esi + 01F0h]
    push push 01006A087h
    push push 4
    push push edi
    push push ebx
    call sub_100F63E6
    mov mov eax, dword ptr [ebp + 16]
    mov mov edx, dword ptr [ebp + 12]
    xor xor ecx, ecx
    add add esp, 16
    cmp cmp edi, ecx
    lea lea eax, [eax + eax*4]
    mov mov word ptr [ebp - 24], 1
    mov mov word ptr [ebp - 22], 3
    mov mov word ptr [ebp - 20], 1
    mov mov word ptr [ebp - 18], 4
    mov mov word ptr [ebp - 16], 1
    mov mov word ptr [ebp - 14], cx
    mov mov dword ptr [ebp - 12], ecx
    lea lea esi, [edx + eax*4]
    mov mov dword ptr [ebp + 16], ecx
    jbe sub_100C50B1
    jmp sub_100C502C
    mov mov ebx, dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp + 16]
    mov mov ecx, dword ptr [ebp + 8]
    push push esi
    push push 7
    lea lea ebx, [ebx + eax*4]
    mov mov eax, dword ptr [ebx]
    push push -1
    push push dword ptr [eax]
    call sub_1008420E
    test test eax, eax
    mov mov dword ptr [ebp - 4], eax
    jl sub_100C50D8
    mov mov ecx, dword ptr [ebp + 8]
    lea lea eax, [esi + 12]
    push push eax
    push push 6
    push push 16
    lea lea eax, [ebp - 24]
    push push eax
    call sub_10084229
    test test eax, eax
    mov mov dword ptr [ebp - 4], eax
    jl sub_100C50F3
    mov mov eax, dword ptr [ebx]
    cmp cmp dword ptr [eax + 12], 0
    je sub_100C50D2
    or or byte ptr [esi + 10], 1
    mov mov ecx, dword ptr [ebp + 8]
    lea lea eax, [esi + 16]
    push push eax
    mov mov eax, dword ptr [ebx]
    push push 7
    push push 16
    add add eax, 16
    push push eax
    call sub_10084252
    test test eax, eax
    mov mov dword ptr [ebp - 4], eax
    jl sub_100C511C
    inc inc dword ptr [ebp + 16]
    mov mov word ptr [esi + 4], 2
    mov mov eax, dword ptr [ebx]
    mov mov ax, word ptr [eax + 4]
    mov mov word ptr [esi + 6], ax
    mov mov word ptr [esi + 8], 1
    add add esi, 20
    cmp cmp dword ptr [ebp + 16], edi
    jb sub_100C50B3
    and and dword ptr [ebp - 4], 0
    pop pop ebx
    push push dword ptr [ebp - 8]
    call sub_100F7A15
    mov mov eax, dword ptr [ebp - 4]
    pop pop ecx
    pop pop edi
    pop pop esi
    leave leave
    ret ret 12
FUN_100c4df7 ENDP
END
