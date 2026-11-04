.686
.MODEL FLAT, C
EXTRN sub_1006CB2D:PROC
EXTRN sub_1006CB89:PROC
EXTRN sub_1006CC2E:PROC
EXTRN sub_100853DF:PROC
EXTRN sub_1008586F:PROC
EXTRN sub_10085A59:PROC
EXTRN sub_10085AD5:PROC
EXTRN sub_10085B3E:PROC
EXTRN sub_10085EE9:PROC
EXTRN sub_10085F65:PROC
EXTRN sub_10086223:PROC
EXTRN sub_1008631B:PROC
EXTRN sub_10086325:PROC
EXTRN sub_100866EF:PROC
EXTRN sub_1008675B:PROC
EXTRN sub_100867B3:PROC
EXTRN sub_100867C6:PROC
EXTRN sub_1008B5A0:PROC
EXTRN sub_100B9AE7:PROC
EXTRN sub_100B9B1B:PROC
EXTRN sub_100B9B50:PROC
EXTRN sub_100B9B85:PROC
EXTRN sub_100B9CD8:PROC
EXTRN g_1019BC80:DWORD
EXTRN g_1019BC88:DWORD
EXTRN g_1019BE20:DWORD
.CODE
FUN_100bfa06 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 000000214h
    or eax, 0FFFFFFFFh
    push ebx
    push esi
    mov dword ptr [ebp - 64], eax
    mov dword ptr [ebp - 60], eax
    mov dword ptr [ebp - 56], eax
    mov dword ptr [ebp - 80], eax
    mov dword ptr [ebp - 76], eax
    mov dword ptr [ebp - 72], eax
    mov esi, ecx
    mov eax, dword ptr [esi + 000000100h]
    mov eax, dword ptr [eax]
    mov ebx, eax
    push edi
    xor edi, edi
    and ebx, 0000FFFFFh
    and eax, 0FFF00000h
    cmp eax, 020900000h
    mov dword ptr [ebp - 68], edi
    mov dword ptr [ebp - 84], edi
    mov dword ptr [ebp - 52], ebx
    je L0
    xor eax, eax
    inc eax
    jmp L52
L0:
    push 116
    call sub_1008586F
    cmp eax, edi
    je L1
    mov ecx, eax
    call sub_100853DF
    mov edi, eax
L1:
    test edi, edi
    mov dword ptr [ebp - 44], edi
    je L37
    push dword ptr [esi + 000000100h]
    mov ecx, edi
    call sub_10085B3E
    test eax, eax
    mov dword ptr [ebp - 8], eax
    jl L40
    and dword ptr [ebp - 32], 0
    test ebx, ebx
    mov dword ptr [edi + 12], 1
    mov dword ptr [edi + 4], 2
    mov dword ptr [edi], 020900001h
    jbe L49
    mov eax, dword ptr [ebp - 52]
    shl eax, 2
    mov dword ptr [ebp - 40], eax
L2:
    mov ecx, dword ptr [esi + 000000100h]
    mov ecx, dword ptr [ecx + 16]
    mov ebx, dword ptr [ebp - 44]
    mov eax, dword ptr [ebp - 32]
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
    push 40
    mov dword ptr [ecx + 4], eax
    pop ecx
    or eax, 0FFFFFFFFh
    lea edi, [ebp - 000000174h]
    rep stosd dword ptr es:[edi], eax
    xor eax, eax
    xor edi, edi
    mov dword ptr [ebp - 4], eax
    mov dword ptr [ebp - 20], eax
    mov dword ptr [ebp - 36], eax
    mov dword ptr [ebp - 12], eax
    inc edi
    push edi
    push edi
    lea eax, [ebp - 68]
    push eax
    lea eax, [ebp - 000000174h]
    push eax
    lea eax, [ebp - 4]
    push eax
    lea eax, [ebp - 000000094h]
    push eax
    push 0101194B8h
    push ebx
    mov ecx, esi
    call sub_100B9AE7
    test eax, eax
    mov dword ptr [ebp - 8], eax
    je L5
    and dword ptr [ebp - 4], 0
    push edi
    push edi
    lea eax, [ebp - 68]
    push eax
    lea eax, [ebp - 000000174h]
    push eax
    lea eax, [ebp - 4]
    push eax
    lea eax, [ebp - 000000094h]
    push eax
    push 010119618h
    push ebx
    mov ecx, esi
    call sub_100B9B1B
    test eax, eax
    mov dword ptr [ebp - 8], eax
    jne L3
    mov dword ptr [ebp - 20], edi
    jmp L5
L3:
    and dword ptr [ebp - 4], 0
    push edi
    push edi
    lea eax, [ebp - 68]
    push eax
    lea eax, [ebp - 000000174h]
    push eax
    lea eax, [ebp - 4]
    push eax
    lea eax, [ebp - 000000094h]
    push eax
    push 0101197B8h
    push ebx
    mov ecx, esi
    call sub_100B9B50
    test eax, eax
    mov dword ptr [ebp - 8], eax
    jne L4
    mov dword ptr [ebp - 36], edi
    jmp L5
L4:
    and dword ptr [ebp - 4], 0
    push edi
    push edi
    lea eax, [ebp - 68]
    push eax
    lea eax, [ebp - 000000174h]
    push eax
    lea eax, [ebp - 4]
    push eax
    lea eax, [ebp - 000000094h]
    push eax
    push 010119958h
    push ebx
    mov ecx, esi
    call sub_100B9B85
    test eax, eax
    mov dword ptr [ebp - 8], eax
    jne L5
    mov dword ptr [ebp - 12], edi
L5:
    mov eax, dword ptr [ebp - 000000164h]
    cmp eax, dword ptr [ebp - 000000154h]
    jne L21
    cmp dword ptr [ebp - 8], 0
    jne L21
    mov ecx, dword ptr [ebp - 000000094h]
    mov ecx, dword ptr [ecx + 16]
    mov ecx, dword ptr [ecx]
    mov eax, dword ptr [esi + 20]
    mov ecx, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [ecx + 20]
    cmp ecx, -1
    je L21
    mov ecx, dword ptr [eax + ecx*4]
    mov edx, dword ptr [esi + 24]
    mov ecx, dword ptr [ecx + 72]
    mov ecx, dword ptr [edx + ecx*4]
    and dword ptr [ebp - 4], 0
    cmp dword ptr [ecx], 011100001h
    jne L21
    mov ecx, dword ptr [ecx + 16]
    mov edi, dword ptr [ecx]
    mov ecx, dword ptr [eax + edi*4]
    mov ebx, dword ptr [ecx + 84]
    mov ecx, dword ptr [ecx + 88]
    cmp ebx, ecx
    mov dword ptr [ebp - 24], ecx
    ja L21
    lea edx, [edx + ebx*4]
    mov dword ptr [ebp - 48], edx
L6:
    mov edx, dword ptr [edx]
    mov ecx, dword ptr [edx + 16]
    mov ecx, dword ptr [ecx]
    mov ecx, dword ptr [eax + ecx*4]
    cmp dword ptr [ecx + 20], edi
    jne L7
    cmp dword ptr [edx], 074700001h
    jne L7
    xor ecx, ecx
    cmp dword ptr [ebp - 4], ecx
    jne L22
    mov dword ptr [ebp - 4], edx
    jmp L8
L7:
    xor ecx, ecx
L8:
    mov edx, dword ptr [ebp - 48]
    inc ebx
    add edx, 4
    cmp ebx, dword ptr [ebp - 24]
    mov dword ptr [ebp - 48], edx
    jbe L6
    mov edi, dword ptr [ebp - 4]
    cmp edi, ecx
    je L21
    cmp dword ptr [ebp - 12], ecx
    push 1
    mov dword ptr [ebp - 16], ecx
    push 1
    je L9
    lea eax, [ebp - 68]
    push eax
    lea eax, [ebp - 000000214h]
    push eax
    lea eax, [ebp - 16]
    push eax
    lea eax, [ebp - 0000000D4h]
    push eax
    push 010119A78h
    jmp L12
L9:
    cmp dword ptr [ebp - 36], ecx
    je L10
    lea eax, [ebp - 68]
    push eax
    lea eax, [ebp - 000000214h]
    push eax
    lea eax, [ebp - 16]
    push eax
    lea eax, [ebp - 0000000D4h]
    push eax
    push 0101198B8h
    jmp L12
L10:
    cmp dword ptr [ebp - 20], ecx
    je L11
    lea eax, [ebp - 68]
    push eax
    lea eax, [ebp - 000000214h]
    push eax
    lea eax, [ebp - 16]
    push eax
    lea eax, [ebp - 0000000D4h]
    push eax
    push 010119718h
    jmp L12
L11:
    lea eax, [ebp - 84]
    push eax
    lea eax, [ebp - 000000214h]
    push eax
    lea eax, [ebp - 16]
    push eax
    lea eax, [ebp - 0000000D4h]
    push eax
    push 010119598h
L12:
    push dword ptr [ebp - 44]
    mov ecx, esi
    call sub_100B9CD8
    mov dword ptr [ebp - 8], eax
    mov eax, dword ptr [ebp - 000000174h]
    cmp dword ptr [ebp - 000000214h], eax
    jne L13
    mov eax, dword ptr [ebp - 000000204h]
L13:
    cmp eax, -1
    je L21
    mov ebx, dword ptr [edi + 8]
    cmp dword ptr [ebx], eax
    jne L21
    mov ecx, dword ptr [edi + 16]
    mov ecx, dword ptr [ecx]
    mov eax, dword ptr [esi + 20]
    mov eax, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [eax + 20]
    cmp ecx, -1
    je L21
    mov eax, dword ptr [esi + 20]
    mov ecx, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [ecx + 72]
    mov edx, dword ptr [esi + 24]
    mov edx, dword ptr [edx + ecx*4]
    cmp dword ptr [edx], 011100001h
    mov ecx, dword ptr [edx + 8]
    mov ecx, dword ptr [ecx]
    mov eax, dword ptr [eax + ecx*4]
    mov dword ptr [ebp - 48], edx
    jne L21
    mov ecx, dword ptr [eax + 4]
    mov edi, dword ptr [esi + 16]
    mov ecx, dword ptr [edi + ecx*4]
    test byte ptr [ecx + 5], 1
    je L21
    mov ecx, dword ptr [esi + 104]
    fild dword ptr [esi + 104]
    test ecx, ecx
    jge L14
    fadd dword ptr [g_1019BC80]
L14:
    fld qword ptr [eax + 32]
    fucompp
    fnstsw ax
    test ah, 68
    jp L21
    mov eax, dword ptr [esi + 20]
    mov ecx, dword ptr [ebx + 4]
    mov ebx, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [ebp - 000000174h]
    mov ecx, dword ptr [eax + ecx*4]
    mov edi, dword ptr [ebp - 000000164h]
    mov dword ptr [ebp - 16], ecx
    mov ecx, dword ptr [eax + edi*4]
    mov eax, dword ptr [ecx + 72]
    cmp eax, -1
    mov dword ptr [ebp - 24], ebx
    mov dword ptr [ebp - 12], edi
    je L20
    jmp L16
L15:
    mov ebx, dword ptr [ebp - 24]
L16:
    cmp dword ptr [ecx + 8], -1
    jne L20
    mov edi, dword ptr [esi + 24]
    mov eax, dword ptr [edi + eax*4]
    mov edi, dword ptr [eax]
    and edi, 0FFF00000h
    cmp edi, 010000000h
    jne L20
    mov edi, dword ptr [eax]
    and dword ptr [ebp - 28], 0
    mov dword ptr [ebp - 20], edi
    and dword ptr [ebp - 20], 0000FFFFFh
    jbe L20
    mov edi, dword ptr [eax + 16]
L17:
    mov ebx, dword ptr [edi]
    cmp ebx, dword ptr [ebp - 12]
    je L18
    inc dword ptr [ebp - 28]
    add edi, 4
    mov dword ptr [ebp - 36], edi
    mov edi, dword ptr [ebp - 28]
    cmp edi, dword ptr [ebp - 20]
    jae L19
    mov edi, dword ptr [ebp - 36]
    jmp L17
L18:
    mov eax, dword ptr [eax + 8]
    mov ecx, dword ptr [ebp - 28]
    mov ecx, dword ptr [eax + ecx*4]
    mov eax, dword ptr [esi + 20]
    mov dword ptr [ebp - 12], ecx
    mov ecx, dword ptr [eax + ecx*4]
    mov eax, dword ptr [ecx + 72]
    cmp eax, -1
    jne L15
L19:
    mov ebx, dword ptr [ebp - 24]
L20:
    mov eax, dword ptr [ebp - 16]
    mov edi, dword ptr [esi + 16]
    mov eax, dword ptr [eax + 4]
    mov eax, dword ptr [edi + eax*4]
    test byte ptr [eax + 5], 1
    je L21
    mov eax, dword ptr [ecx + 4]
    mov eax, dword ptr [edi + eax*4]
    test byte ptr [eax + 5], 1
    je L21
    mov eax, dword ptr [ebp - 16]
    fld qword ptr [g_1019BC88]
    fld qword ptr [eax + 32]
    fucompp
    fnstsw ax
    test ah, 68
    jp L21
    fld qword ptr [g_1019BE20]
    fld qword ptr [ecx + 32]
    fucompp
    fnstsw ax
    test ah, 68
    jp L21
    mov eax, dword ptr [ebx + 4]
    mov eax, dword ptr [edi + eax*4]
    test byte ptr [eax + 5], 2
    je L21
    test byte ptr [ebx], 2
    je L21
    cmp dword ptr [ebx + 16], 0
    jne L21
    cmp dword ptr [ebx + 8], -1
    je L23
L21:
    inc dword ptr [ebp - 32]
    mov eax, dword ptr [ebp - 32]
    add dword ptr [ebp - 40], 4
    cmp eax, dword ptr [ebp - 52]
    jb L2
    jmp L49
L22:
    push 01011A0C4h
    push 0000012E3h
    push ecx
    push esi
    call sub_1008B5A0
    add esp, 16
    mov eax, 080004005h
    jmp L52
L23:
    mov eax, dword ptr [ebp - 4]
    mov ecx, dword ptr [eax + 8]
    mov ecx, dword ptr [ecx + 4]
    mov edi, dword ptr [edx + 8]
    or dword ptr [ebp - 20], 0FFFFFFFFh
    mov dword ptr [edi], ecx
    and dword ptr [eax], 0
    mov eax, dword ptr [edx + 16]
    mov eax, dword ptr [eax]
    mov ecx, dword ptr [esi + 20]
    mov ecx, dword ptr [ecx + eax*4]
    mov eax, dword ptr [ecx + 84]
    cmp eax, dword ptr [ecx + 88]
    mov dword ptr [ebp - 16], ecx
    mov dword ptr [ebp - 24], eax
    ja L42
    jmp L25
L24:
    mov eax, dword ptr [ebp - 24]
L25:
    mov ecx, dword ptr [esi + 24]
    mov ebx, dword ptr [ecx + eax*4]
    cmp dword ptr [ebx + 12], 0
    mov dword ptr [ebp - 28], ebx
    je L34
    mov eax, dword ptr [ebx + 16]
    mov eax, dword ptr [eax]
    mov ecx, dword ptr [esi + 20]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [ebp - 4]
    mov ecx, dword ptr [ecx + 16]
    mov eax, dword ptr [eax + 20]
    cmp eax, dword ptr [ecx]
    jne L34
    and dword ptr [ebp - 40], 0
    cmp dword ptr [ebx + 4], 0
    jbe L34
L26:
    mov edx, dword ptr [ebp - 40]
    mov eax, dword ptr [ebx + 8]
    mov eax, dword ptr [eax + edx*4]
    mov ecx, dword ptr [esi + 20]
    mov edi, dword ptr [ecx + eax*4]
    mov edx, dword ptr [edi + 8]
    or dword ptr [ebp - 12], 0FFFFFFFFh
    cmp edx, -1
    je L31
    mov ecx, dword ptr [ecx + edx*4]
    mov ecx, dword ptr [ecx + 72]
    cmp ecx, -1
    je L33
    mov eax, dword ptr [esi + 24]
    mov ecx, dword ptr [eax + ecx*4]
    mov eax, dword ptr [ecx]
    mov ebx, eax
    and ebx, 0FFF00000h
    cmp ebx, 010000000h
    jne L29
    and dword ptr [ebp - 32], 0
    mov dword ptr [ebp - 36], eax
    and dword ptr [ebp - 36], 0000FFFFFh
    jbe L30
    mov ebx, dword ptr [ecx + 16]
L27:
    cmp dword ptr [ebx], edx
    je L28
    inc dword ptr [ebp - 32]
    mov eax, dword ptr [ebp - 36]
    add ebx, 4
    cmp dword ptr [ebp - 32], eax
    jb L27
    jmp L30
L28:
    mov eax, dword ptr [ecx + 8]
    mov ecx, dword ptr [ebp - 32]
    mov eax, dword ptr [eax + ecx*4]
    mov dword ptr [ebp - 12], eax
    jmp L30
L29:
    mov dword ptr [ebp - 12], edx
L30:
    mov ebx, dword ptr [ebp - 28]
L31:
    mov eax, dword ptr [ebp - 4]
    mov eax, dword ptr [eax + 8]
    mov ecx, dword ptr [ebp - 12]
    cmp ecx, dword ptr [eax]
    jne L33
    mov eax, dword ptr [ebp - 20]
    cmp eax, -1
    jne L32
    push 4
    push eax
    push 21
    push 01011A0C0h
    mov ecx, esi
    call sub_100866EF
    fldz
    push ecx
    push ecx
    fstp qword ptr [esp]
    push 0
    push 0
    push eax
    mov ecx, esi
    call sub_1008675B
    mov dword ptr [ebp - 20], eax
    mov dword ptr [edi + 8], eax
L32:
    mov dword ptr [edi + 8], eax
    mov edi, dword ptr [edi + 56]
    cmp edi, -1
    je L33
    mov ecx, dword ptr [esi + 20]
    mov ecx, dword ptr [ecx + edi*4]
    mov dword ptr [ecx + 8], eax
L33:
    inc dword ptr [ebp - 40]
    mov eax, dword ptr [ebp - 40]
    cmp eax, dword ptr [ebx + 4]
    jb L26
L34:
    inc dword ptr [ebp - 24]
    mov eax, dword ptr [ebp - 16]
    mov ecx, dword ptr [ebp - 24]
    cmp ecx, dword ptr [eax + 88]
    jbe L24
    cmp dword ptr [ebp - 20], -1
    je L42
    push ecx
    fldz
    push ecx
    fstp qword ptr [esp]
    xor ebx, ebx
    push ebx
    push ebx
    push ebx
    mov ecx, esi
    call sub_100867B3
    fldz
    push ecx
    push ecx
    fstp qword ptr [esp]
    push ebx
    push ebx
    push ebx
    mov ecx, esi
    mov edi, eax
    call sub_100867C6
    cmp edi, -1
    je L37
    cmp eax, -1
    je L37
    mov ecx, dword ptr [esi + 20]
    mov edx, dword ptr [ebp - 48]
    mov edx, dword ptr [edx + 8]
    mov edx, dword ptr [edx]
    mov edx, dword ptr [ecx + edx*4]
    mov edi, dword ptr [ecx + edi*4]
    mov ebx, dword ptr [ecx + eax*4]
    push edx
    mov ecx, edi
    mov dword ptr [ebp - 52], edx
    call sub_1008631B
    push dword ptr [ebp - 52]
    mov ecx, ebx
    call sub_10086325
    mov dword ptr [edi + 16], 1
    push 116
    mov dword ptr [ebx + 16], 2
    call sub_10085EE9
    test eax, eax
    je L35
    mov ecx, eax
    call sub_10085A59
    mov edi, eax
    jmp L36
L35:
    xor edi, edi
L36:
    test edi, edi
    jne L38
L37:
    mov eax, 08007000Eh
    jmp L52
L38:
    push 0
    push 1
    push 3
    push 074100001h
    mov ecx, edi
    call sub_10085F65
    mov ebx, eax
    test ebx, ebx
    mov ecx, edi
    jge L39
    push 1
    call sub_1006CB2D
    mov eax, ebx
    jmp L52
L39:
    mov ebx, dword ptr [ebp - 48]
    push ebx
    call sub_10085AD5
    test eax, eax
    mov dword ptr [ebp - 8], eax
    jge L41
L40:
    mov ecx, edi
    jmp L50
L41:
    mov eax, dword ptr [ebx + 16]
    mov eax, dword ptr [eax]
    mov ecx, dword ptr [edi + 16]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [ebx + 8]
    mov eax, dword ptr [eax]
    mov ecx, dword ptr [edi + 8]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [ebx + 8]
    mov eax, dword ptr [eax]
    mov ecx, dword ptr [edi + 8]
    mov dword ptr [ecx + 4], eax
    mov eax, dword ptr [ebx + 8]
    mov ecx, dword ptr [edi + 8]
    mov eax, dword ptr [eax]
    mov dword ptr [ecx + 8], eax
    push edi
    mov ecx, ebx
    call sub_10086223
    push 1
    mov ecx, edi
    mov dword ptr [ebp - 8], eax
    call sub_1006CB89
    cmp dword ptr [ebp - 8], 0
    jl L51
L42:
    mov eax, dword ptr [ebp - 16]
    mov edi, dword ptr [eax + 84]
    cmp edi, dword ptr [eax + 88]
    mov dword ptr [ebp - 12], edi
    ja L46
    mov edx, 0000FFFFFh
L43:
    mov eax, dword ptr [esi + 24]
    mov eax, dword ptr [eax + edi*4]
    mov ecx, dword ptr [eax]
    mov ebx, ecx
    and ebx, 0FFF00000h
    cmp ebx, 020800000h
    jne L45
    mov edi, dword ptr [eax + 8]
    mov edi, dword ptr [edi]
    mov ebx, dword ptr [esi + 20]
    mov edi, dword ptr [ebx + edi*4]
    mov ebx, dword ptr [ebp - 4]
    mov ebx, dword ptr [ebx + 16]
    mov edi, dword ptr [edi + 20]
    cmp edi, dword ptr [ebx]
    jne L44
    and ecx, edx
    mov edi, ecx
    and edi, edx
    or edi, 010000000h
    mov dword ptr [eax], edi
    mov dword ptr [eax + 12], ecx
    mov dword ptr [eax + 4], ecx
L44:
    mov edi, dword ptr [ebp - 12]
L45:
    mov eax, dword ptr [ebp - 16]
    inc edi
    cmp edi, dword ptr [eax + 88]
    mov dword ptr [ebp - 12], edi
    jbe L43
L46:
    xor ecx, ecx
    cmp dword ptr [esi + 8], ecx
    jbe L49
L47:
    mov eax, dword ptr [esi + 20]
    mov eax, dword ptr [eax + ecx*4]
    mov edx, dword ptr [ebp - 4]
    mov edx, dword ptr [edx + 16]
    mov edi, dword ptr [eax + 20]
    cmp edi, dword ptr [edx]
    jne L48
    mov edx, dword ptr [ebp - 48]
    mov edx, dword ptr [edx + 16]
    mov edx, dword ptr [edx]
    mov dword ptr [eax + 20], edx
L48:
    inc ecx
    cmp ecx, dword ptr [esi + 8]
    jb L47
L49:
    mov ecx, dword ptr [ebp - 44]
L50:
    push 1
    call sub_1006CC2E
L51:
    mov eax, dword ptr [ebp - 8]
L52:
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_100bfa06 ENDP
END
