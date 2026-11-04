.686
.MODEL FLAT, C
EXTRN sub_100863A6:PROC
EXTRN sub_1008B26F:PROC
EXTRN sub_100C3BBC:PROC
EXTRN sub_100C5CDD:PROC
EXTRN g_1011A580:DWORD
.CODE
FUN_100c6e69 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 44
    push edi
    mov edi, ecx
    mov ecx, dword ptr [edi + 000000100h]
    mov eax, dword ptr [ecx]
    mov edx, eax
    and edx, 0FFF00000h
    cmp edx, 020400000h
    je L0
    xor eax, eax
    inc eax
    jmp L23
L0:
    and eax, 0000FFFFFh
    mov edx, eax
    mov eax, dword ptr [ecx + 8]
    push ebx
    mov ecx, edx
    shl ecx, 2
    add ecx, eax
    mov ebx, dword ptr [ecx]
    push esi
    mov esi, dword ptr [edi + 20]
    mov ebx, dword ptr [esi + ebx*4]
    mov ebx, dword ptr [ebx + 4]
    mov dword ptr [ebp - 8], edx
    mov edx, dword ptr [edi + 16]
    mov ebx, dword ptr [edx + ebx*4]
    test byte ptr [ebx + 5], 1
    je L1
    and dword ptr [ebp - 16], 0
    mov dword ptr [ebp - 4], eax
    mov eax, ecx
    jmp L2
L1:
    mov ebx, dword ptr [eax]
    mov ebx, dword ptr [esi + ebx*4]
    mov ebx, dword ptr [ebx + 4]
    mov edx, dword ptr [edx + ebx*4]
    test byte ptr [edx + 5], 1
    je L21
    mov dword ptr [ebp - 16], 1
    mov dword ptr [ebp - 4], ecx
L2:
    mov ebx, dword ptr [ebp - 8]
    and dword ptr [edi + 00000015Ch], 0
    and dword ptr [ebp - 12], 0
    test ebx, ebx
    jbe L5
    mov edx, dword ptr [ebp - 4]
    mov ecx, eax
    sub ecx, edx
L3:
    mov eax, dword ptr [ecx + edx]
    fld qword ptr [g_1011A580]
    mov eax, dword ptr [esi + eax*4]
    fld qword ptr [eax + 32]
    fucompp
    fnstsw ax
    test ah, 68
    jp L21
    mov eax, dword ptr [edx]
    mov eax, dword ptr [esi + eax*4]
    test byte ptr [eax + 61], 2
    jne L4
    test byte ptr [eax], 4
    jne L4
    test byte ptr [edi + 110], 4
    je L4
    mov dword ptr [edi + 00000015Ch], 1
L4:
    inc dword ptr [ebp - 12]
    add edx, 4
    cmp dword ptr [ebp - 12], ebx
    jb L3
L5:
    mov ecx, dword ptr [edi + 000000100h]
    mov eax, dword ptr [ecx + 16]
    mov eax, dword ptr [eax]
    mov eax, dword ptr [esi + eax*4]
    mov eax, dword ptr [eax + 4]
    cmp eax, dword ptr [edi + 000000088h]
    jne L7
    xor ecx, ecx
    push ecx
    push ecx
    mov eax, 000020000h
    push eax
    push dword ptr [ebp - 4]
    push ecx
    push eax
    mov ecx, edi
    call sub_100C5CDD
    cmp dword ptr [edi + 00000015Ch], 2
    mov esi, eax
    jne L6
    mov eax, dword ptr [edi + 000000100h]
    push 01011A53Ch
    push 00000125Dh
    push dword ptr [eax + 60]
    push edi
    call sub_1008B26F
    add esp, 16
L6:
    mov eax, esi
    jmp L22
L7:
    cmp eax, dword ptr [edi + 000000084h]
    jne L21
    push 2
    lea eax, [ebp - 28]
    push eax
    mov eax, ebx
    and eax, 0000FFFFFh
    push ecx
    or eax, 020400000h
    push eax
    mov ecx, edi
    call sub_100C3BBC
    test eax, eax
    jne L22
    mov eax, dword ptr [ebp - 16]
    lea eax, [ebp + eax*4 - 28]
    mov dword ptr [ebp - 12], eax
    mov eax, dword ptr [eax]
    test eax, eax
    je L21
    and dword ptr [ebp - 4], 0
    test ebx, ebx
    jbe L11
    mov edx, dword ptr [eax + 8]
L8:
    mov eax, dword ptr [edx]
    mov eax, dword ptr [esi + eax*4]
    test byte ptr [eax + 62], 31
    jne L11
    mov ecx, dword ptr [edi + 16]
    mov ebx, dword ptr [eax + 4]
    mov ebx, dword ptr [ecx + ebx*4]
    mov ecx, 000000200h
    test dword ptr [ebx + 4], ecx
    jne L10
    test dword ptr [eax + 60], ecx
    jne L9
    test byte ptr [eax], 4
    je L10
L9:
    and dword ptr [ebp - 16], 0
    inc dword ptr [ebp - 4]
    mov ebx, dword ptr [ebp - 8]
    add edx, 4
    cmp dword ptr [ebp - 4], ebx
    jb L8
    jmp L11
L10:
    mov ebx, dword ptr [ebp - 8]
L11:
    cmp dword ptr [ebp - 4], ebx
    je L16
    and dword ptr [ebp - 4], 0
    test ebx, ebx
    jbe L15
    mov eax, dword ptr [ebp - 12]
    mov eax, dword ptr [eax]
    mov ecx, dword ptr [eax + 8]
    mov eax, ebx
    shl eax, 2
    add ecx, eax
L12:
    mov eax, dword ptr [ecx]
    mov eax, dword ptr [esi + eax*4]
    test byte ptr [eax + 62], 31
    jne L15
    mov edx, dword ptr [edi + 16]
    mov ebx, dword ptr [eax + 4]
    mov ebx, dword ptr [edx + ebx*4]
    mov edx, 000000200h
    test dword ptr [ebx + 4], edx
    jne L14
    test dword ptr [eax + 60], edx
    jne L13
    test byte ptr [eax], 4
    je L14
L13:
    inc dword ptr [ebp - 4]
    mov ebx, dword ptr [ebp - 8]
    add ecx, 4
    cmp dword ptr [ebp - 4], ebx
    jb L12
    jmp L15
L14:
    mov ebx, dword ptr [ebp - 8]
L15:
    cmp dword ptr [ebp - 4], ebx
    je L21
    mov eax, ebx
    jmp L17
L16:
    mov eax, dword ptr [ebp - 16]
L17:
    and dword ptr [ebp - 4], 0
    test ebx, ebx
    jbe L19
    mov ebx, eax
    shl ebx, 2
L18:
    mov eax, dword ptr [ebp - 12]
    mov eax, dword ptr [eax]
    mov ecx, dword ptr [edi + 20]
    mov eax, dword ptr [eax + 8]
    mov eax, dword ptr [ebx + eax]
    mov esi, dword ptr [ecx + eax*4]
    fld qword ptr [esi + 32]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push dword ptr [esi + 16]
    mov ecx, edi
    push dword ptr [esi + 12]
    push dword ptr [esi + 4]
    call sub_100863A6
    cmp eax, -1
    mov ecx, dword ptr [ebp - 4]
    mov dword ptr [ebp - 16], eax
    mov dword ptr [ebp + ecx*4 - 44], eax
    je L20
    mov ecx, dword ptr [edi + 20]
    mov ecx, dword ptr [ecx + eax*4]
    mov eax, dword ptr [ebp - 12]
    mov edx, dword ptr [eax]
    mov eax, dword ptr [edx + 8]
    mov eax, dword ptr [ebx + eax]
    mov dword ptr [ecx + 56], eax
    mov eax, dword ptr [esi + 72]
    mov dword ptr [ecx + 72], eax
    mov eax, dword ptr [esi + 80]
    mov dword ptr [ecx + 80], eax
    mov eax, dword ptr [esi + 84]
    mov dword ptr [ecx + 84], eax
    mov eax, dword ptr [esi + 84]
    mov dword ptr [ecx + 88], eax
    mov eax, dword ptr [esi + 60]
    or eax, 000020000h
    mov dword ptr [ecx + 60], eax
    mov eax, dword ptr [edx + 8]
    mov ecx, dword ptr [ebp - 16]
    mov dword ptr [ebx + eax], ecx
    mov eax, dword ptr [edi + 000000100h]
    mov ecx, dword ptr [eax + 16]
    mov eax, dword ptr [ebp - 4]
    mov ecx, dword ptr [ecx + eax*4]
    mov edx, dword ptr [edx + 16]
    mov dword ptr [edx + eax*4], ecx
    inc eax
    add ebx, 4
    cmp eax, dword ptr [ebp - 8]
    mov dword ptr [ebp - 4], eax
    jb L18
L19:
    mov eax, dword ptr [edi + 000000100h]
    and dword ptr [eax], 0
    xor eax, eax
    jmp L22
L20:
    mov eax, 08007000Eh
    jmp L22
L21:
    xor eax, eax
    inc eax
L22:
    pop esi
    pop ebx
L23:
    pop edi
    leave
    ret
FUN_100c6e69 ENDP
END
