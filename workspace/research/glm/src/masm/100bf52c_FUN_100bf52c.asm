.686
.MODEL FLAT, C
EXTRN sub_1006C4B3:PROC
EXTRN sub_1006C8C4:PROC
EXTRN sub_1006C8EA:PROC
EXTRN sub_100853DE:PROC
EXTRN sub_10085779:PROC
EXTRN sub_100857E4:PROC
EXTRN sub_1008586E:PROC
EXTRN sub_10085B4A:PROC
EXTRN sub_10085C09:PROC
EXTRN sub_10085C7F:PROC
EXTRN sub_10085F5F:PROC
EXTRN sub_10086471:PROC
EXTRN sub_100864DD:PROC
EXTRN sub_100865AF:PROC
EXTRN sub_100865CB:PROC
EXTRN sub_100B9AF3:PROC
EXTRN sub_100B9B37:PROC
EXTRN g_1019BC88:DWORD
EXTRN g_1019BE20:DWORD
.CODE
FUN_100bf52c PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 000000218h
    or eax, 0FFFFFFFFh
    push esi
    mov esi, ecx
    mov dword ptr [ebp - 84], eax
    mov dword ptr [ebp - 80], eax
    mov dword ptr [ebp - 76], eax
    mov dword ptr [ebp - 68], eax
    mov dword ptr [ebp - 64], eax
    mov dword ptr [ebp - 60], eax
    mov eax, dword ptr [esi + 000000100h]
    mov eax, dword ptr [eax]
    mov ecx, eax
    push edi
    xor edi, edi
    and ecx, 0000FFFFFh
    and eax, 0FFF00000h
    cmp eax, 020900000h
    mov dword ptr [ebp - 88], edi
    mov dword ptr [ebp - 72], edi
    mov dword ptr [ebp - 56], ecx
    je L0
    xor eax, eax
    inc eax
    jmp L30
L0:
    push 116
    call sub_1008586E
    cmp eax, edi
    je L1
    mov ecx, eax
    call sub_100853DE
    mov dword ptr [ebp - 32], eax
    jmp L2
L1:
    mov dword ptr [ebp - 32], edi
L2:
    push ebx
    mov ebx, dword ptr [ebp - 32]
    cmp ebx, edi
    jne L4
L3:
    mov eax, 08007000Eh
    jmp L29
L4:
    push dword ptr [esi + 000000100h]
    mov ecx, ebx
    call sub_10085B4A
    mov edi, eax
    test edi, edi
    jge L5
    push 1
    mov ecx, ebx
    call sub_1006C4B3
    mov eax, edi
    jmp L29
L5:
    mov ecx, dword ptr [ebp - 56]
    xor eax, eax
    test ecx, ecx
    mov dword ptr [ebx + 12], 1
    mov dword ptr [ebx + 4], 2
    mov dword ptr [ebx], 020900001h
    mov dword ptr [ebp - 52], eax
    jbe L28
    shl ecx, 2
    mov dword ptr [ebp - 40], ecx
    jmp L7
L6:
    mov ebx, dword ptr [ebp - 32]
L7:
    mov ecx, dword ptr [esi + 000000100h]
    mov ecx, dword ptr [ecx + 16]
    mov edx, dword ptr [ebx + 16]
    shl eax, 2
    mov ecx, dword ptr [eax + ecx]
    mov dword ptr [edx], ecx
    mov ecx, dword ptr [esi + 000000100h]
    mov ecx, dword ptr [ecx + 8]
    mov eax, dword ptr [eax + ecx]
    mov edx, dword ptr [ebx + 8]
    mov dword ptr [edx], eax
    mov eax, dword ptr [esi + 000000100h]
    mov eax, dword ptr [eax + 8]
    mov edx, dword ptr [ebp - 40]
    mov eax, dword ptr [edx + eax]
    mov ecx, dword ptr [ebx + 8]
    and dword ptr [ebp - 12], 0
    push 40
    mov dword ptr [ecx + 4], eax
    pop ecx
    push 1
    or eax, 0FFFFFFFFh
    push 1
    lea edi, [ebp - 0000000F8h]
    rep stosd dword ptr es:[edi], eax
    lea eax, [ebp - 88]
    push eax
    lea eax, [ebp - 0000000F8h]
    push eax
    lea eax, [ebp - 12]
    push eax
    lea eax, [ebp - 0000001D8h]
    push eax
    push 010119B38h
    push ebx
    mov ecx, esi
    call sub_100B9AF3
    test eax, eax
    jne L27
    mov edi, dword ptr [ebp - 0000000E8h]
    cmp edi, dword ptr [ebp - 0000000D8h]
    jne L27
    and dword ptr [ebp - 12], eax
    push 1
    push 1
    lea eax, [ebp - 72]
    push eax
    lea eax, [ebp - 000000198h]
    push eax
    lea eax, [ebp - 12]
    push eax
    lea eax, [ebp - 000000218h]
    push eax
    push 010119BF8h
    push ebx
    mov ecx, esi
    call sub_100B9B37
    mov edx, dword ptr [ebp - 0000000F8h]
    cmp dword ptr [ebp - 000000198h], edx
    jne L8
    mov eax, dword ptr [ebp - 000000188h]
    mov dword ptr [ebp - 16], eax
    jmp L9
L8:
    mov dword ptr [ebp - 16], edx
L9:
    cmp dword ptr [ebp - 16], -1
    je L27
    mov eax, dword ptr [ebx + 16]
    mov eax, dword ptr [eax]
    mov ecx, dword ptr [esi + 20]
    shl eax, 2
    mov ecx, dword ptr [ecx + eax]
    cmp dword ptr [ecx + 20], -1
    je L27
    mov ecx, dword ptr [esi + 20]
    mov eax, dword ptr [ecx + eax]
    mov eax, dword ptr [eax + 20]
    mov ecx, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [ecx + 72]
    cmp ecx, -1
    je L27
    mov eax, dword ptr [esi + 24]
    mov eax, dword ptr [eax + ecx*4]
    cmp dword ptr [eax], 011100001h
    mov dword ptr [ebp - 20], eax
    jne L27
    mov eax, dword ptr [esi + 20]
    mov ecx, dword ptr [eax + edx*4]
    mov dword ptr [ebp - 24], ecx
    mov ecx, dword ptr [eax + edi*4]
    mov edx, edi
    jmp L13
L10:
    cmp dword ptr [ecx + 8], -1
    jne L14
    mov edi, dword ptr [esi + 24]
    mov eax, dword ptr [edi + eax*4]
    mov edi, dword ptr [eax]
    mov ebx, edi
    and ebx, 0FFF00000h
    cmp ebx, 010000000h
    jne L14
    and dword ptr [ebp - 4], 0
    mov dword ptr [ebp - 8], edi
    and dword ptr [ebp - 8], 0000FFFFFh
    jbe L14
    mov ebx, dword ptr [eax + 16]
L11:
    cmp dword ptr [ebx], edx
    je L12
    inc dword ptr [ebp - 4]
    mov edi, dword ptr [ebp - 8]
    add ebx, 4
    cmp dword ptr [ebp - 4], edi
    jb L11
    jmp L14
L12:
    mov eax, dword ptr [eax + 8]
    mov ecx, dword ptr [ebp - 4]
    mov edx, dword ptr [eax + ecx*4]
    mov eax, dword ptr [esi + 20]
    mov ecx, dword ptr [eax + edx*4]
L13:
    mov eax, dword ptr [ecx + 72]
    cmp eax, -1
    jne L10
L14:
    mov edi, dword ptr [ebp - 24]
    mov edx, dword ptr [edi + 4]
    mov eax, dword ptr [esi + 16]
    mov ebx, dword ptr [eax + edx*4]
    mov edx, 000000100h
    test dword ptr [ebx + 4], edx
    je L27
    mov ebx, dword ptr [ecx + 4]
    mov eax, dword ptr [eax + ebx*4]
    test dword ptr [eax + 4], edx
    je L27
    fld qword ptr [g_1019BC88]
    fld qword ptr [edi + 32]
    fucompp
    fnstsw ax
    test ah, 68
    jp L27
    fld qword ptr [g_1019BE20]
    fld qword ptr [ecx + 32]
    fucompp
    fnstsw ax
    test ah, 68
    jp L27
    mov ecx, dword ptr [ebp - 16]
    mov eax, dword ptr [esi + 20]
    mov edx, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [edx + 84]
    or ebx, 0FFFFFFFFh
    cmp ecx, dword ptr [edx + 88]
    mov dword ptr [ebp - 44], ebx
    mov dword ptr [ebp - 24], edx
    mov dword ptr [ebp - 12], ecx
    ja L27
L15:
    mov eax, dword ptr [esi + 24]
    mov eax, dword ptr [eax + ecx*4]
    cmp dword ptr [eax + 12], 0
    mov dword ptr [ebp - 36], eax
    je L24
    and dword ptr [ebp - 8], 0
    cmp dword ptr [eax + 4], 0
    jbe L24
L16:
    mov edi, dword ptr [ebp - 8]
    mov edx, dword ptr [eax + 8]
    mov edx, dword ptr [edx + edi*4]
    mov ecx, dword ptr [esi + 20]
    mov edi, dword ptr [ecx + edx*4]
    mov edx, dword ptr [edi + 8]
    or dword ptr [ebp - 28], 0FFFFFFFFh
    cmp edx, -1
    je L20
    mov ecx, dword ptr [ecx + edx*4]
    mov ecx, dword ptr [ecx + 72]
    cmp ecx, -1
    je L23
    mov eax, dword ptr [esi + 24]
    mov ecx, dword ptr [eax + ecx*4]
    mov eax, dword ptr [ecx]
    mov ebx, eax
    and ebx, 0FFF00000h
    cmp ebx, 010000000h
    jne L19
    and dword ptr [ebp - 4], 0
    mov dword ptr [ebp - 48], eax
    and dword ptr [ebp - 48], 0000FFFFFh
    jbe L20
    mov ebx, dword ptr [ecx + 16]
L17:
    cmp dword ptr [ebx], edx
    je L18
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 48]
    add ebx, 4
    cmp dword ptr [ebp - 4], eax
    jb L17
    jmp L20
L18:
    mov eax, dword ptr [ecx + 8]
    mov ecx, dword ptr [ebp - 4]
    mov eax, dword ptr [eax + ecx*4]
    mov dword ptr [ebp - 28], eax
    jmp L20
L19:
    mov dword ptr [ebp - 28], edx
L20:
    mov eax, dword ptr [ebp - 16]
    cmp dword ptr [ebp - 28], eax
    mov ebx, dword ptr [ebp - 44]
    jne L22
    cmp ebx, -1
    jne L21
    push 4
    push ebx
    push 21
    push 01011A0C0h
    mov ecx, esi
    call sub_10086471
    fldz
    push ecx
    push ecx
    fstp qword ptr [esp]
    push 0
    push 0
    push eax
    mov ecx, esi
    call sub_100864DD
    mov ebx, eax
    mov dword ptr [ebp - 44], ebx
    mov dword ptr [edi + 8], ebx
L21:
    mov dword ptr [edi + 8], ebx
    mov edi, dword ptr [edi + 56]
    cmp edi, -1
    je L22
    mov eax, dword ptr [esi + 20]
    mov eax, dword ptr [eax + edi*4]
    mov dword ptr [eax + 8], ebx
L22:
    mov eax, dword ptr [ebp - 36]
L23:
    inc dword ptr [ebp - 8]
    mov ecx, dword ptr [ebp - 8]
    cmp ecx, dword ptr [eax + 4]
    jb L16
    mov edx, dword ptr [ebp - 24]
    mov ecx, dword ptr [ebp - 12]
L24:
    inc ecx
    cmp ecx, dword ptr [edx + 88]
    mov dword ptr [ebp - 12], ecx
    jbe L15
    cmp ebx, -1
    je L27
    push 116
    call sub_10085C09
    test eax, eax
    je L25
    mov ecx, eax
    call sub_10085779
    mov edi, eax
    jmp L26
L25:
    xor edi, edi
L26:
    test edi, edi
    je L3
    push 0
    push 1
    push 3
    push 074100001h
    mov ecx, edi
    call sub_10085C7F
    mov ebx, eax
    test ebx, ebx
    mov ecx, edi
    jl L31
    push dword ptr [ebp - 20]
    call sub_100857E4
    mov ebx, eax
    test ebx, ebx
    jl L33
    mov eax, dword ptr [ebp - 20]
    fldz
    mov ecx, dword ptr [eax + 16]
    mov ecx, dword ptr [ecx]
    mov edx, dword ptr [edi + 16]
    mov dword ptr [edx], ecx
    mov ecx, dword ptr [eax + 8]
    mov ecx, dword ptr [ecx]
    mov edx, dword ptr [edi + 8]
    mov dword ptr [edx], ecx
    mov ecx, dword ptr [esi + 20]
    mov eax, dword ptr [eax + 8]
    mov eax, dword ptr [eax]
    mov ebx, dword ptr [ecx + eax*4]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push 2
    push dword ptr [ebx + 12]
    mov ecx, esi
    push dword ptr [ebx + 4]
    call sub_100865AF
    fld1
    mov ecx, dword ptr [edi + 8]
    push ecx
    push ecx
    fstp qword ptr [esp]
    mov dword ptr [ecx + 4], eax
    push 2
    push dword ptr [ebx + 12]
    mov ecx, esi
    push dword ptr [ebx + 4]
    call sub_100865CB
    mov ecx, dword ptr [edi + 8]
    mov dword ptr [ecx + 8], eax
    mov ecx, dword ptr [ebp - 20]
    push edi
    call sub_10085F5F
    push 1
    mov ecx, edi
    mov ebx, eax
    call sub_1006C8C4
    test ebx, ebx
    jl L32
L27:
    mov eax, dword ptr [ebp - 52]
    add dword ptr [ebp - 40], 4
    inc eax
    cmp eax, dword ptr [ebp - 56]
    mov dword ptr [ebp - 52], eax
    jb L6
L28:
    xor eax, eax
L29:
    pop ebx
L30:
    pop edi
    pop esi
    leave
    ret
L31:
    push 1
    call sub_1006C8EA
L32:
    mov eax, ebx
    jmp L29
L33:
    mov ecx, edi
    jmp L31
FUN_100bf52c ENDP
END
