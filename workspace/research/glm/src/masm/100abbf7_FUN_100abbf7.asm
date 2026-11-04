.686
.MODEL FLAT, C
EXTRN sub_10085F33:PROC
EXTRN sub_10085FE1:PROC
EXTRN sub_100863AE:PROC
EXTRN sub_10086452:PROC
EXTRN sub_100A7047:PROC
EXTRN sub_100A7056:PROC
EXTRN sub_100A70F8:PROC
EXTRN sub_100ABB34:PROC
EXTRN sub_100ABB55:PROC
EXTRN sub_100ABB77:PROC
EXTRN sub_100ABB99:PROC
EXTRN sub_100ABBBB:PROC
EXTRN sub_100ABBDD:PROC
.CODE
FUN_100abbf7 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 88
    mov eax, dword ptr [ebp + 8]
    push ebx
    push esi
    mov esi, ecx
    xor ebx, ebx
    push edi
    xor ecx, ecx
L0:
    cmp eax, ebx
    je L1
    lea edx, [eax - 1]
    inc ecx
    and eax, edx
    cmp ecx, 7
    jb L0
L1:
    cmp ecx, 6
    ja L24
    mov eax, dword ptr [esi + 000000480h]
    mov edx, eax
    sub edx, ecx
    cmp edx, 6
    ja L24
    cmp eax, ebx
    mov dword ptr [ebp - 4], ebx
    mov dword ptr [ebp - 8], ebx
    mov dword ptr [ebp - 12], ebx
    jbe L6
    lea eax, [esi + 000000450h]
    mov dword ptr [ebp - 16], eax
L2:
    mov eax, dword ptr [ebp - 16]
    mov ecx, dword ptr [eax]
    mov eax, dword ptr [esi + 24]
    mov eax, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [ebp - 12]
    mov edx, dword ptr [eax]
    xor ebx, ebx
    inc ebx
    shl ebx, cl
    mov ecx, dword ptr [ebp + 8]
    mov edi, edx
    and edi, 0FFF00000h
    test ecx, ebx
    je L3
    cmp dword ptr [eax + 36], 1
    je L24
    mov ecx, dword ptr [ebp - 8]
    inc dword ptr [ebp - 8]
    mov dword ptr [ebp + ecx*4 - 88], eax
    jmp L5
L3:
    cmp edi, 011000000h
    je L24
    cmp edi, 072100000h
    je L4
    mov ecx, dword ptr [eax + 8]
    and edx, 0000FFFFFh
    mov ecx, dword ptr [ecx + edx*4]
    mov edx, dword ptr [esi + 20]
    mov ecx, dword ptr [edx + ecx*4]
    cmp byte ptr [ecx + 108], 3
    jne L24
    cmp dword ptr [ecx + 60], 0
    jne L24
L4:
    mov ecx, dword ptr [ebp - 4]
    inc dword ptr [ebp - 4]
    mov dword ptr [ebp + ecx*4 - 64], eax
L5:
    inc dword ptr [ebp - 12]
    mov eax, dword ptr [ebp - 12]
    add dword ptr [ebp - 16], 4
    cmp eax, dword ptr [esi + 000000480h]
    jb L2
    xor ebx, ebx
L6:
    push 6
    pop ecx
    push ebx
    push dword ptr [ebp - 4]
    or eax, 0FFFFFFFFh
    lea edi, [ebp - 40]
    rep stosd dword ptr es:[edi], eax
    lea eax, [ebp - 64]
    push eax
    lea eax, [ebp - 40]
    push eax
    push dword ptr [esi + 00000022Ch]
    mov ecx, esi
    call sub_100ABB34
    test eax, eax
    je L24
    push ebx
    push dword ptr [ebp - 8]
    lea eax, [ebp - 88]
    push eax
    lea eax, [ebp - 40]
    push eax
    push dword ptr [esi + 000000230h]
    mov ecx, esi
    call sub_100ABB55
    test eax, eax
    je L24
    push 1
    push dword ptr [ebp - 4]
    lea eax, [ebp - 64]
    push eax
    lea eax, [ebp - 40]
    push eax
    push dword ptr [esi + 00000022Ch]
    mov ecx, esi
    call sub_100ABB77
    test eax, eax
    je L24
    push 1
    push dword ptr [ebp - 8]
    lea eax, [ebp - 88]
    push eax
    lea eax, [ebp - 40]
    push eax
    push dword ptr [esi + 000000230h]
    mov ecx, esi
    call sub_100ABB99
    test eax, eax
    je L24
    push 2
    push dword ptr [ebp - 4]
    lea eax, [ebp - 64]
    push eax
    lea eax, [ebp - 40]
    push eax
    push dword ptr [esi + 00000022Ch]
    mov ecx, esi
    call sub_100ABBBB
    test eax, eax
    je L24
    push 2
    push dword ptr [ebp - 8]
    lea eax, [ebp - 88]
    push eax
    lea eax, [ebp - 40]
    push eax
    push dword ptr [esi + 000000230h]
    mov ecx, esi
    call sub_100ABBDD
    test eax, eax
    je L24
    cmp dword ptr [ebp + 12], ebx
    jne L23
    push 6
    pop ecx
    xor eax, eax
    lea edi, [ebp - 88]
    rep stosd dword ptr es:[edi], eax
    push 6
    pop ecx
    lea edi, [ebp - 64]
    rep stosd dword ptr es:[edi], eax
    mov dword ptr [ebp + 12], ebx
    xor edi, edi
L7:
    mov eax, dword ptr [esi + 00000022Ch]
    mov edx, dword ptr [edi + eax]
    cmp edx, ebx
    jne L8
    mov eax, dword ptr [esi + 000000230h]
    cmp dword ptr [edi + eax], ebx
    je L19
L8:
    xor ecx, ecx
    cmp edx, ebx
    mov dword ptr [ebp - 16], ebx
    je L9
    mov ecx, dword ptr [edx]
    and ecx, 0FFF00000h
L9:
    mov eax, dword ptr [esi + 000000230h]
    mov eax, dword ptr [edi + eax]
    cmp eax, ebx
    je L10
    mov eax, dword ptr [eax]
    and eax, 0FFF00000h
    mov dword ptr [ebp - 16], eax
L10:
    push ecx
    call sub_100A7047
    cmp eax, ebx
    mov dword ptr [ebp - 12], eax
    jne L11
    push dword ptr [ebp - 16]
    call sub_100A7056
    test eax, eax
    je L19
L11:
    or dword ptr [ebp + 8], 0FFFFFFFFh
    cmp dword ptr [ebp - 12], ebx
    je L14
    mov ecx, dword ptr [esi + 20]
    mov eax, dword ptr [edx + 8]
    mov eax, dword ptr [eax]
    mov ebx, dword ptr [ecx + eax*4]
    fld qword ptr [ebx + 32]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push dword ptr [ebx + 16]
    mov ecx, esi
    push dword ptr [ebx + 12]
    push dword ptr [ebx + 4]
    call sub_100863AE
    cmp eax, -1
    mov dword ptr [ebp + 8], eax
    je L24
    mov edx, dword ptr [esi + 00000022Ch]
    mov edx, dword ptr [edi + edx]
    xor ecx, ecx
    test dword ptr [edx], 0000FFFFFh
    jbe L13
L12:
    mov edx, dword ptr [esi + 00000022Ch]
    mov edx, dword ptr [edi + edx]
    mov edx, dword ptr [edx + 8]
    mov dword ptr [edx + ecx*4], eax
    mov edx, dword ptr [esi + 00000022Ch]
    mov edx, dword ptr [edi + edx]
    mov edx, dword ptr [edx]
    inc ecx
    and edx, 0000FFFFFh
    cmp ecx, edx
    jb L12
L13:
    mov ecx, dword ptr [esi + 20]
    mov eax, dword ptr [ecx + eax*4]
    push ebx
    mov ecx, eax
    mov dword ptr [ebp + edi - 88], ebx
    mov dword ptr [ebp - 8], eax
    call sub_10085F33
    mov eax, dword ptr [ebp + 12]
    mov ecx, dword ptr [ebp - 8]
    mov dword ptr [ecx + 12], eax
L14:
    push dword ptr [ebp - 16]
    call sub_100A70F8
    test eax, eax
    je L18
    cmp dword ptr [ebp + 8], -1
    mov eax, dword ptr [esi + 000000230h]
    mov eax, dword ptr [edi + eax]
    mov eax, dword ptr [eax + 8]
    mov eax, dword ptr [eax]
    mov ecx, dword ptr [esi + 20]
    mov ebx, dword ptr [ecx + eax*4]
    jne L15
    fld qword ptr [ebx + 32]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push dword ptr [ebx + 16]
    mov ecx, esi
    push dword ptr [ebx + 12]
    push dword ptr [ebx + 4]
    call sub_10086452
    cmp eax, -1
    mov dword ptr [ebp + 8], eax
    je L24
L15:
    mov ecx, dword ptr [esi + 000000230h]
    mov ecx, dword ptr [edi + ecx]
    xor eax, eax
    test dword ptr [ecx], 0000FFFFFh
    jbe L17
L16:
    mov ecx, dword ptr [esi + 000000230h]
    mov ecx, dword ptr [edi + ecx]
    mov ecx, dword ptr [ecx + 8]
    mov edx, dword ptr [ebp + 8]
    mov dword ptr [ecx + eax*4], edx
    mov ecx, dword ptr [esi + 000000230h]
    mov ecx, dword ptr [edi + ecx]
    mov ecx, dword ptr [ecx]
    inc eax
    and ecx, 0000FFFFFh
    cmp eax, ecx
    jb L16
L17:
    cmp dword ptr [ebp - 12], 0
    mov dword ptr [ebp + edi - 64], ebx
    jne L18
    mov eax, dword ptr [esi + 20]
    mov ecx, dword ptr [ebp + 8]
    mov ecx, dword ptr [eax + ecx*4]
    push ebx
    mov dword ptr [ebp - 16], ecx
    call sub_10085FE1
    mov eax, dword ptr [ebp + 12]
    mov ecx, dword ptr [ebp - 16]
    mov dword ptr [ecx + 12], eax
L18:
    cmp dword ptr [ebp + 8], -1
    je L24
    xor ebx, ebx
L19:
    inc dword ptr [ebp + 12]
    add edi, 4
    cmp edi, 24
    jb L7
    xor eax, eax
L20:
    mov ecx, dword ptr [ebp + eax - 88]
    cmp ecx, ebx
    je L21
    mov edx, dword ptr [esi + 116]
    mov dword ptr [ecx + 4], edx
L21:
    mov ecx, dword ptr [ebp + eax - 64]
    cmp ecx, ebx
    je L22
    mov edx, dword ptr [esi + 116]
    mov dword ptr [ecx + 4], edx
L22:
    add eax, 4
    cmp eax, 24
    jb L20
L23:
    push 6
    pop eax
    mov dword ptr [esi + 000000220h], eax
    mov dword ptr [esi + 000000224h], eax
    xor eax, eax
    inc eax
    jmp L25
L24:
    xor eax, eax
L25:
    pop edi
    pop esi
    pop ebx
    leave
    ret 8
FUN_100abbf7 ENDP
END
