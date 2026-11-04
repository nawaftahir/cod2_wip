.686
.MODEL FLAT, C
EXTRN sub_100863A6:PROC
EXTRN sub_1008B26F:PROC
EXTRN sub_100C3BBC:PROC
EXTRN sub_100C5CDD:PROC
EXTRN sub_100C718E:PROC
EXTRN sub_100C71BD:PROC
EXTRN sub_100C71BF:PROC
EXTRN sub_100C71CD:PROC
EXTRN sub_100C71CE:PROC
EXTRN sub_100C71D6:PROC
EXTRN sub_100C71DD:PROC
EXTRN sub_100C71E7:PROC
EXTRN sub_100C71FE:PROC
EXTRN sub_100C7215:PROC
EXTRN sub_100C7265:PROC
EXTRN sub_100C726A:PROC
EXTRN sub_100C726F:PROC
EXTRN sub_100C727F:PROC
EXTRN sub_100C7284:PROC
EXTRN sub_100C728F:PROC
EXTRN sub_100C7299:PROC
EXTRN sub_100C72A0:PROC
EXTRN sub_100C72A9:PROC
EXTRN sub_100C72AC:PROC
EXTRN sub_100C72CC:PROC
EXTRN sub_100C72CF:PROC
EXTRN sub_100C72E0:PROC
EXTRN sub_100C7389:PROC
EXTRN sub_100C738A:PROC
EXTRN sub_100C738E:PROC
EXTRN sub_100C73D3:PROC
EXTRN sub_100C744F:PROC
EXTRN sub_100C7456:PROC
EXTRN EXTRN g_1011A580:DWORD:DWORD
.CODE
FUN_100c6e69 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 44
    push push edi
    mov mov edi, ecx
    mov mov ecx, dword ptr [edi + 0100h]
    mov mov eax, dword ptr [ecx]
    mov mov edx, eax
    and and edx, 0FFF00000h
    cmp cmp edx, 020400000h
    je L0
    xor xor eax, eax
    inc inc eax
    jmp sub_100C718E
    and and eax, 0FFFFFh
    mov mov edx, eax
    mov mov eax, dword ptr [ecx + 8]
    push push ebx
    mov mov ecx, edx
    shl shl ecx, 2
    add add ecx, eax
    mov mov ebx, dword ptr [ecx]
    push push esi
    mov mov esi, dword ptr [edi + 20]
    mov mov ebx, dword ptr [esi + ebx*4]
    mov mov ebx, dword ptr [ebx + 4]
    mov mov dword ptr [ebp - 8], edx
    mov mov edx, dword ptr [edi + 16]
    mov mov ebx, dword ptr [edx + ebx*4]
    test test byte ptr [ebx + 5], 1
    je L1
    and and dword ptr [ebp - 16], 0
    mov mov dword ptr [ebp - 4], eax
    mov mov eax, ecx
    jmp L2
    mov mov ebx, dword ptr [eax]
    mov mov ebx, dword ptr [esi + ebx*4]
    mov mov ebx, dword ptr [ebx + 4]
    mov mov edx, dword ptr [edx + ebx*4]
    test test byte ptr [edx + 5], 1
    je sub_100C71D6
    mov mov dword ptr [ebp - 16], 1
    mov mov dword ptr [ebp - 4], ecx
    mov mov ebx, dword ptr [ebp - 8]
    and and dword ptr [edi + 015Ch], 0
    and and dword ptr [ebp - 12], 0
    test test ebx, ebx
    jbe L3
    mov mov edx, dword ptr [ebp - 4]
    mov mov ecx, eax
    sub sub ecx, edx
    mov mov eax, dword ptr [ecx + edx]
    fld fld qword ptr [g_1011A580]
    mov mov eax, dword ptr [esi + eax*4]
    fld fld qword ptr [eax + 32]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp sub_100C7215
    mov mov eax, dword ptr [edx]
    mov mov eax, dword ptr [esi + eax*4]
    test test byte ptr [eax + 61], 2
    jne L5
    test test byte ptr [eax], 4
    jne L6
    test test byte ptr [edi + 110], 4
    je L7
    mov mov dword ptr [edi + 015Ch], 1
    inc inc dword ptr [ebp - 12]
    add add edx, 4
    cmp cmp dword ptr [ebp - 12], ebx
    jb L4
    mov mov ecx, dword ptr [edi + 0100h]
    mov mov eax, dword ptr [ecx + 16]
    mov mov eax, dword ptr [eax]
    mov mov eax, dword ptr [esi + eax*4]
    mov mov eax, dword ptr [eax + 4]
    cmp cmp eax, dword ptr [edi + 088h]
    jne L8
    xor xor ecx, ecx
    push push ecx
    push push ecx
    mov mov eax, 020000h
    push push eax
    push push dword ptr [ebp - 4]
    push push ecx
    push push eax
    mov mov ecx, edi
    call sub_100C5CDD
    cmp cmp dword ptr [edi + 015Ch], 2
    mov mov esi, eax
    jne L9
    mov mov eax, dword ptr [edi + 0100h]
    push push 01011A53Ch
    push push 0125Dh
    push push dword ptr [eax + 60]
    push push edi
    call sub_1008B26F
    add add esp, 16
    mov mov eax, esi
    jmp sub_100C72A0
    cmp cmp eax, dword ptr [edi + 084h]
    jne sub_100C72A9
    push push 2
    lea lea eax, [ebp - 28]
    push push eax
    mov mov eax, ebx
    and and eax, 0FFFFFh
    push push ecx
    or or eax, 020400000h
    push push eax
    mov mov ecx, edi
    call sub_100C3BBC
    test test eax, eax
    jne sub_100C72CF
    mov mov eax, dword ptr [ebp - 16]
    lea lea eax, [ebp + eax*4 - 28]
    mov mov dword ptr [ebp - 12], eax
    mov mov eax, dword ptr [eax]
    test test eax, eax
    je sub_100C72E0
    and and dword ptr [ebp - 4], 0
    test test ebx, ebx
    jbe sub_100C71BF
    mov mov edx, dword ptr [eax + 8]
    mov mov eax, dword ptr [edx]
    mov mov eax, dword ptr [esi + eax*4]
    test test byte ptr [eax + 62], 31
    jne sub_100C71CD
    mov mov ecx, dword ptr [edi + 16]
    mov mov ebx, dword ptr [eax + 4]
L6:
    mov mov ebx, dword ptr [ecx + ebx*4]
    mov mov ecx, 0200h
    test test dword ptr [ebx + 4], ecx
    jne sub_100C71DD
    test test dword ptr [eax + 60], ecx
    jne sub_100C71CE
    test test byte ptr [eax], 4
    je sub_100C71E7
    and and dword ptr [ebp - 16], 0
    inc inc dword ptr [ebp - 4]
    mov mov ebx, dword ptr [ebp - 8]
    add add edx, 4
    cmp cmp dword ptr [ebp - 4], ebx
    jb sub_100C71BD
    jmp sub_100C71FE
    mov mov ebx, dword ptr [ebp - 8]
    cmp cmp dword ptr [ebp - 4], ebx
    je sub_100C726A
    and and dword ptr [ebp - 4], 0
    test test ebx, ebx
    jbe sub_100C7265
    mov mov eax, dword ptr [ebp - 12]
    mov mov eax, dword ptr [eax]
    mov mov ecx, dword ptr [eax + 8]
    mov mov eax, ebx
    shl shl eax, 2
    add add ecx, eax
    mov mov eax, dword ptr [ecx]
    mov mov eax, dword ptr [esi + eax*4]
    test test byte ptr [eax + 62], 31
    jne sub_100C727F
    mov mov edx, dword ptr [edi + 16]
    mov mov ebx, dword ptr [eax + 4]
    mov mov ebx, dword ptr [edx + ebx*4]
    mov mov edx, 0200h
    test test dword ptr [ebx + 4], edx
    jne sub_100C728F
    test test dword ptr [eax + 60], edx
    jne sub_100C7284
    test test byte ptr [eax], 4
    je sub_100C7299
    inc inc dword ptr [ebp - 4]
    mov mov ebx, dword ptr [ebp - 8]
    add add ecx, 4
    cmp cmp dword ptr [ebp - 4], ebx
    jb sub_100C726F
    jmp sub_100C72AC
    mov mov ebx, dword ptr [ebp - 8]
    cmp cmp dword ptr [ebp - 4], ebx
    je sub_100C738A
    mov mov eax, ebx
    jmp sub_100C72CC
    mov mov eax, dword ptr [ebp - 16]
    and and dword ptr [ebp - 4], 0
    test test ebx, ebx
    jbe sub_100C7389
    mov mov ebx, eax
    shl shl ebx, 2
    mov mov eax, dword ptr [ebp - 12]
    mov mov eax, dword ptr [eax]
    mov mov ecx, dword ptr [edi + 20]
    mov mov eax, dword ptr [eax + 8]
    mov mov eax, dword ptr [ebx + eax]
    mov mov esi, dword ptr [ecx + eax*4]
    fld fld qword ptr [esi + 32]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push dword ptr [esi + 16]
    mov mov ecx, edi
    push push dword ptr [esi + 12]
    push push dword ptr [esi + 4]
    call sub_100863A6
    cmp cmp eax, -1
    mov mov ecx, dword ptr [ebp - 4]
    mov mov dword ptr [ebp - 16], eax
    mov mov dword ptr [ebp + ecx*4 - 44], eax
    je sub_100C73D3
    mov mov ecx, dword ptr [edi + 20]
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov eax, dword ptr [ebp - 12]
    mov mov edx, dword ptr [eax]
    mov mov eax, dword ptr [edx + 8]
    mov mov eax, dword ptr [ebx + eax]
    mov mov dword ptr [ecx + 56], eax
    mov mov eax, dword ptr [esi + 72]
    mov mov dword ptr [ecx + 72], eax
    mov mov eax, dword ptr [esi + 80]
    mov mov dword ptr [ecx + 80], eax
    mov mov eax, dword ptr [esi + 84]
    mov mov dword ptr [ecx + 84], eax
    mov mov eax, dword ptr [esi + 84]
    mov mov dword ptr [ecx + 88], eax
    mov mov eax, dword ptr [esi + 60]
    or or eax, 020000h
    mov mov dword ptr [ecx + 60], eax
    mov mov eax, dword ptr [edx + 8]
    mov mov ecx, dword ptr [ebp - 16]
    mov mov dword ptr [ebx + eax], ecx
    mov mov eax, dword ptr [edi + 0100h]
    mov mov ecx, dword ptr [eax + 16]
    mov mov eax, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov edx, dword ptr [edx + 16]
    mov mov dword ptr [edx + eax*4], ecx
    inc inc eax
    add add ebx, 4
    cmp cmp eax, dword ptr [ebp - 8]
    mov mov dword ptr [ebp - 4], eax
    jb sub_100C738E
    mov mov eax, dword ptr [edi + 0100h]
    and and dword ptr [eax], 0
    xor xor eax, eax
    jmp sub_100C744F
    mov mov eax, 08007000Eh
    jmp sub_100C7456
    xor xor eax, eax
    inc inc eax
    pop pop esi
    pop pop ebx
    pop pop edi
    leave leave
    ret ret
FUN_100c6e69 ENDP
END
