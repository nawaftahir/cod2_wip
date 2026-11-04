.686
.MODEL FLAT, C
EXTRN sub_10063852:PROC
EXTRN sub_10063EEB:PROC
EXTRN sub_10063F13:PROC
EXTRN sub_10063F54:PROC
EXTRN sub_1006429F:PROC
EXTRN sub_10067893:PROC
EXTRN sub_10067B70:PROC
EXTRN sub_10067D41:PROC
EXTRN sub_10067E34:PROC
EXTRN sub_10067E58:PROC
EXTRN sub_10067F87:PROC
EXTRN sub_10069BB8:PROC
EXTRN sub_10069C50:PROC
EXTRN sub_10069C89:PROC
EXTRN sub_10069D25:PROC
EXTRN sub_1006A56C:PROC
EXTRN sub_1006A817:PROC
EXTRN sub_1006AAE9:PROC
EXTRN sub_1006ABA4:PROC
EXTRN sub_1006AC80:PROC
EXTRN sub_1006AD1E:PROC
EXTRN sub_1006BC35:PROC
EXTRN sub_100F78A1:PROC
EXTRN sub_100F7B3D:PROC
EXTRN fp_1010C04C:DWORD
EXTRN fp_1010C050:DWORD
EXTRN fp_1010C07C:DWORD
EXTRN g_101AC958:DWORD
.CODE
FUN_1006be48 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 16
    test dword ptr [ebp + 12], 0FFFFFF3Ch
    push esi
    mov esi, ecx
    je L0
    mov eax, 08876086Ch
    jmp L51
L0:
    mov eax, dword ptr [ebp + 20]
    push ebx
    xor ebx, ebx
    cmp eax, ebx
    jne L1
    mov eax, 08876086Ch
    jmp L50
L1:
    mov dword ptr [eax], ebx
    push dword ptr [esi + 88]
    call sub_100F78A1
    pop ecx
    mov ecx, dword ptr [esi + 120]
    cmp ecx, ebx
    je L2
    push 1
    call sub_1006AC80
L2:
    mov ecx, dword ptr [ebp + 8]
    mov dword ptr [g_101AC958], esi
    or dword ptr [esi + 56], 0FFFFFFFFh
    lea eax, [ecx + 24]
    mov dword ptr [esi], eax
    mov eax, dword ptr [ebp + 12]
    push edi
    mov dword ptr [esi + 60], eax
    push ebx
    lea eax, [ebp - 4]
    lea edi, [esi + 108]
    push eax
    mov dword ptr [esi + 4], ecx
    mov dword ptr [esi + 8], ebx
    mov dword ptr [esi + 48], ebx
    mov dword ptr [esi + 52], ebx
    mov dword ptr [esi + 88], ebx
    mov dword ptr [esi + 92], ebx
    mov dword ptr [esi + 96], ebx
    mov dword ptr [esi + 100], ebx
    mov dword ptr [esi + 104], ebx
    mov dword ptr [esi + 76], ebx
    mov dword ptr [esi + 80], ebx
    mov dword ptr [esi + 84], ebx
    mov dword ptr [edi], ebx
    mov dword ptr [esi + 112], ebx
    mov dword ptr [esi + 116], ebx
    call sub_10063F13
    cmp dword ptr [ebp - 4], ebx
    jne L3
    mov ecx, dword ptr [esi + 4]
    lea eax, [esi + 112]
    push eax
    push edi
    call sub_10063F54
L3:
    mov ecx, dword ptr [esi + 4]
    push 2
    call sub_10063EEB
    cmp eax, ebx
    jl L49
    mov ecx, esi
    call sub_1006AD1E
    cmp dword ptr [esi + 16], 9
    jne L4
    lea eax, [ebp - 16]
    push eax
    push 1
    push dword ptr [esi + 24]
    call sub_10063852
    test eax, eax
    jl L4
    mov eax, dword ptr [ebp - 12]
    mov dword ptr [esi + 16], ebx
    mov dword ptr [esi + 24], eax
L4:
    cmp dword ptr [esi + 16], ebx
    je L7
    push 01010F764h
    push 0000007D1h
L5:
    lea eax, [esi + 16]
    push eax
    push dword ptr [esi]
    call sub_10067D41
    add esp, 16
L6:
    mov edi, 088760B59h
    jmp L45
L7:
    cmp dword ptr [esi + 24], 0FFFE0100h
    mov edi, 0000007DFh
    jne L8
    push 01010F738h
    push edi
    lea eax, [esi + 16]
    push eax
    push dword ptr [esi]
    call sub_10067E34
    add esp, 16
    mov dword ptr [esi + 24], 0FFFE0101h
L8:
    cmp dword ptr [esi + 24], 0FFFF0100h
    jne L9
    push 01010F70Ch
    push edi
    lea eax, [esi + 16]
    push eax
    push dword ptr [esi]
    call sub_10067E58
    add esp, 16
    mov dword ptr [esi + 24], 0FFFF0101h
L9:
    cmp dword ptr [esi + 24], 0FFFF0202h
    mov edi, 0FFFF0201h
    jne L10
    mov dword ptr [esi + 24], edi
L10:
    test byte ptr [ebp + 12], 64
    mov eax, 0FFFF0000h
    je L11
    mov ecx, dword ptr [esi + 24]
    and ecx, eax
    cmp ecx, 0FFFE0000h
    je L12
L11:
    test byte ptr [ebp + 12], 000000080h
    je L13
    mov ecx, dword ptr [esi + 24]
    and ecx, eax
    cmp ecx, eax
    jne L13
L12:
    or dword ptr [esi + 60], 1
L13:
    mov eax, dword ptr [esi + 24]
    mov ecx, 0FFFF0102h
    cmp eax, ecx
    ja L21
    je L20
    cmp eax, 0FFFE0101h
    je L19
    cmp eax, 0FFFE0200h
    je L18
    cmp eax, 0FFFE0201h
    je L17
    cmp eax, 0FFFE02FFh
    je L16
    cmp eax, 0FFFE0300h
    je L15
    cmp eax, 0FFFE03FFh
    je L14
    cmp eax, 0FFFF0101h
    jne L22
    mov dword ptr [esi + 56], 6
    jmp L30
L14:
    mov dword ptr [esi + 56], 5
    jmp L30
L15:
    mov dword ptr [esi + 56], 4
    jmp L30
L16:
    mov dword ptr [esi + 56], 3
    jmp L30
L17:
    mov dword ptr [esi + 56], 2
    jmp L30
L18:
    mov dword ptr [esi + 56], 1
    jmp L30
L19:
    mov dword ptr [esi + 56], ebx
    jmp L30
L20:
    mov dword ptr [esi + 56], 7
    jmp L30
L21:
    cmp eax, 0FFFF0103h
    je L29
    cmp eax, 0FFFF0104h
    je L28
    cmp eax, 0FFFF0200h
    je L27
    cmp eax, edi
    je L26
    cmp eax, 0FFFF02FFh
    je L25
    cmp eax, 0FFFF0300h
    je L24
    cmp eax, 0FFFF03FFh
    je L23
L22:
    push 01010F6F0h
    push 0000007D2h
    jmp L5
L23:
    mov dword ptr [esi + 56], 14
    jmp L30
L24:
    mov dword ptr [esi + 56], 13
    jmp L30
L25:
    mov dword ptr [esi + 56], 12
    jmp L30
L26:
    mov dword ptr [esi + 56], 11
    jmp L30
L27:
    mov dword ptr [esi + 56], 10
    jmp L30
L28:
    mov dword ptr [esi + 56], 9
    jmp L30
L29:
    mov dword ptr [esi + 56], 8
L30:
    mov eax, dword ptr [ebp + 16]
    cmp eax, ebx
    je L37
    or dword ptr [esi + 60], 2
    push 0000000B8h
    mov dword ptr [esi + 124], eax
    call sub_100F7B3D
    cmp eax, ebx
    pop ecx
    je L31
    push dword ptr [esi + 56]
    mov ecx, eax
    call sub_1006AAE9
    jmp L32
L31:
    xor eax, eax
L32:
    cmp eax, ebx
    mov dword ptr [esi + 120], eax
    jne L33
    mov eax, 08007000Eh
    jmp L49
L33:
    mov eax, dword ptr [esi + 56]
    cmp eax, ebx
    jl L35
    cmp eax, 5
    jg L35
    movzx eax, byte ptr [esi + 25]
    or eax, 0007FFE00h
L34:
    mov ecx, dword ptr [esi + 24]
    shl eax, 8
    and ecx, 0000000FFh
    or eax, ecx
    mov dword ptr [esi + 24], eax
    jmp L37
L35:
    cmp eax, 10
    jl L36
    cmp eax, 14
    jg L36
    movzx eax, byte ptr [esi + 25]
    or eax, 0007FFF00h
    jmp L34
L36:
    push 01010F688h
    push 0000007D1h
    lea eax, [esi + 16]
    push eax
    push dword ptr [esi]
    call sub_10067F87
    add esp, 16
L37:
    test byte ptr [esi + 60], 2
    jne L39
    mov edi, 01010F67Ch
    push edi
    call dword ptr [fp_1010C07C]
    cmp eax, ebx
    jne L38
    push edi
    call dword ptr [fp_1010C050]
    cmp eax, ebx
    je L39
L38:
    push 01010F65Ch
    push eax
    call dword ptr [fp_1010C04C]
    cmp eax, ebx
    je L39
    call eax
    cmp eax, ebx
    mov dword ptr [esi + 8], eax
    je L39
    mov ecx, dword ptr [eax]
    push ebx
    push esi
    push 010068D02h
    push eax
    call dword ptr [ecx + 0xc]
    mov edi, eax
    cmp edi, ebx
    jl L45
L39:
    push dword ptr [esi + 24]
    mov ecx, esi
    call sub_10069C89
    mov edi, eax
    cmp edi, ebx
    jl L45
    lea eax, [esi + 16]
    push eax
    mov ecx, esi
    call sub_10069BB8
    mov edi, eax
    cmp edi, ebx
    jl L45
    cmp dword ptr [esi + 76], ebx
    jne L6
    call sub_1006BC35
    test eax, eax
    je L40
    mov dword ptr [esi + 76], 1
L40:
    cmp dword ptr [esi + 76], ebx
    jne L6
    cmp dword ptr [esi + 108], ebx
    je L41
    mov ecx, dword ptr [esi + 4]
    push ebx
    lea eax, [ebp + 12]
    push eax
    call sub_1006429F
    mov ecx, dword ptr [esi + 108]
    mov eax, dword ptr [ebp + 12]
    cmp ecx, eax
    jae L41
    mov edx, dword ptr [esi + 112]
    add edx, ecx
    cmp edx, eax
    jbe L41
    sub eax, ecx
    mov dword ptr [esi + 112], eax
L41:
    cmp dword ptr [esi + 120], ebx
    je L42
    mov ecx, esi
    call sub_1006A56C
    mov edi, eax
    cmp edi, ebx
    jl L45
L42:
    test byte ptr [esi + 60], 1
    je L43
    mov ecx, esi
    call sub_1006A817
    mov edi, eax
    cmp edi, ebx
    jl L45
L43:
    push 00000FFFFh
    mov ecx, esi
    call sub_10069D25
    mov edi, eax
    cmp edi, ebx
    jl L45
    lea eax, [esi + 16]
    push eax
    mov ecx, esi
    call sub_10069C50
    mov edi, eax
    cmp edi, ebx
    jl L45
    mov eax, dword ptr [esi + 8]
    cmp eax, ebx
    je L44
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 0x14]
    mov edi, eax
    cmp edi, ebx
    jl L45
L44:
    mov ecx, dword ptr [esi]
    call sub_10067B70
    test eax, eax
    jne L6
    push dword ptr [ebp + 20]
    mov ecx, esi
    call sub_1006ABA4
    mov edi, eax
    cmp edi, ebx
    jge L46
L45:
    mov dword ptr [esi + 76], 1
    jmp L47
L46:
    xor edi, edi
L47:
    mov eax, dword ptr [esi + 8]
    cmp eax, ebx
    je L48
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 8]
    mov dword ptr [esi + 8], ebx
L48:
    mov ecx, dword ptr [esi + 4]
    call sub_10067893
    mov eax, edi
L49:
    pop edi
L50:
    pop ebx
L51:
    pop esi
    leave
    ret 16
FUN_1006be48 ENDP
END
