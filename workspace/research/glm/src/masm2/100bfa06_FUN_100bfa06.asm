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
EXTRN sub_100C0233:PROC
EXTRN sub_100C0255:PROC
EXTRN sub_100C0256:PROC
EXTRN sub_100C0259:PROC
EXTRN sub_100C0261:PROC
EXTRN sub_100C026C:PROC
EXTRN sub_100C026F:PROC
EXTRN sub_100C0273:PROC
EXTRN sub_100C0276:PROC
EXTRN sub_100C0277:PROC
EXTRN sub_100C0289:PROC
EXTRN sub_100C028C:PROC
EXTRN sub_100C02A1:PROC
EXTRN sub_100C02BD:PROC
EXTRN sub_100C033A:PROC
EXTRN sub_100C0346:PROC
EXTRN sub_100C035B:PROC
EXTRN sub_100C036D:PROC
EXTRN sub_100C0379:PROC
EXTRN sub_100C037E:PROC
EXTRN sub_100C0384:PROC
EXTRN sub_100C03C0:PROC
EXTRN sub_100C0461:PROC
EXTRN sub_100C0576:PROC
EXTRN sub_100C058F:PROC
EXTRN sub_100C0593:PROC
EXTRN sub_100C0597:PROC
EXTRN sub_100C059A:PROC
EXTRN sub_100C05A0:PROC
EXTRN sub_100C05AA:PROC
EXTRN sub_100C05AF:PROC
EXTRN sub_100C05BD:PROC
EXTRN sub_100C05C1:PROC
EXTRN sub_100C05CF:PROC
EXTRN sub_100C05D8:PROC
EXTRN sub_100C062C:PROC
EXTRN sub_100C0638:PROC
EXTRN sub_100C0675:PROC
EXTRN sub_100C06AB:PROC
EXTRN sub_100C06EC:PROC
EXTRN sub_100C0717:PROC
EXTRN sub_100C0782:PROC
EXTRN sub_100C0787:PROC
EXTRN sub_100C07C3:PROC
EXTRN sub_100C07D0:PROC
EXTRN sub_100C07E4:PROC
EXTRN sub_100C07E8:PROC
EXTRN sub_100C0830:PROC
EXTRN sub_100C0865:PROC
EXTRN sub_100C0913:PROC
EXTRN sub_100C093B:PROC
EXTRN sub_100C0948:PROC
EXTRN sub_100C0970:PROC
EXTRN sub_100C0975:PROC
EXTRN sub_100C0981:PROC
EXTRN sub_100C0996:PROC
EXTRN sub_100C0997:PROC
EXTRN sub_100C09FA:PROC
EXTRN sub_100C0A07:PROC
EXTRN EXTRN g_1019BC80:DWORD:DWORD
EXTRN EXTRN g_1019BC88:DWORD:DWORD
EXTRN EXTRN g_1019BE20:DWORD:DWORD
.CODE
FUN_100bfa06 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 0214h
    or or eax, -1
    push push ebx
    push push esi
    mov mov dword ptr [ebp - 64], eax
    mov mov dword ptr [ebp - 60], eax
    mov mov dword ptr [ebp - 56], eax
    mov mov dword ptr [ebp - 80], eax
    mov mov dword ptr [ebp - 76], eax
    mov mov dword ptr [ebp - 72], eax
    mov mov esi, ecx
    mov mov eax, dword ptr [esi + 0100h]
    mov mov eax, dword ptr [eax]
    mov mov ebx, eax
    push push edi
    xor xor edi, edi
    and and ebx, 0FFFFFh
    and and eax, 0FFF00000h
    cmp cmp eax, 020900000h
    mov mov dword ptr [ebp - 68], edi
    mov mov dword ptr [ebp - 84], edi
    mov mov dword ptr [ebp - 52], ebx
    je L0
    xor xor eax, eax
    inc inc eax
    jmp sub_100C0273
    push push 116
    call sub_1008586F
    cmp cmp eax, edi
    je L1
    mov mov ecx, eax
    call sub_100853DF
    mov mov edi, eax
    test test edi, edi
    mov mov dword ptr [ebp - 44], edi
    je L27
    push push dword ptr [esi + 0100h]
    mov mov ecx, edi
    call sub_10085B3E
    test test eax, eax
    mov mov dword ptr [ebp - 8], eax
    jl L29
    and and dword ptr [ebp - 32], 0
    test test ebx, ebx
    mov mov dword ptr [edi + 12], 1
    mov mov dword ptr [edi + 4], 2
    mov mov dword ptr [edi], 020900001h
    jbe sub_100C02BD
    mov mov eax, dword ptr [ebp - 52]
    shl shl eax, 2
    mov mov dword ptr [ebp - 40], eax
    mov mov ecx, dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [ecx + 16]
    mov mov ebx, dword ptr [ebp - 44]
    mov mov eax, dword ptr [ebp - 32]
    mov mov edx, dword ptr [ebx + 16]
    shl shl eax, 2
    mov mov ecx, dword ptr [eax + ecx]
    mov mov dword ptr [edx], ecx
    mov mov ecx, dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [ecx + 8]
    mov mov eax, dword ptr [eax + ecx]
    mov mov edx, dword ptr [ebx + 8]
    mov mov dword ptr [edx], eax
    mov mov eax, dword ptr [esi + 0100h]
    mov mov eax, dword ptr [eax + 8]
    mov mov edx, dword ptr [ebp - 40]
    mov mov eax, dword ptr [edx + eax]
    mov mov ecx, dword ptr [ebx + 8]
    push push 40
    mov mov dword ptr [ecx + 4], eax
    pop pop ecx
    or or eax, -1
    lea lea edi, [ebp - 0174h]
    rep stosd rep stosd dword ptr es:[edi], eax
    xor xor eax, eax
    xor xor edi, edi
    mov mov dword ptr [ebp - 4], eax
    mov mov dword ptr [ebp - 20], eax
    mov mov dword ptr [ebp - 36], eax
    mov mov dword ptr [ebp - 12], eax
    inc inc edi
    push push edi
    push push edi
    lea lea eax, [ebp - 68]
    push push eax
    lea lea eax, [ebp - 0174h]
    push push eax
    lea lea eax, [ebp - 4]
    push push eax
    lea lea eax, [ebp - 094h]
    push push eax
    push push 0101194B8h
    push push ebx
    mov mov ecx, esi
    call sub_100B9AE7
    test test eax, eax
    mov mov dword ptr [ebp - 8], eax
    je L3
    and and dword ptr [ebp - 4], 0
    push push edi
    push push edi
    lea lea eax, [ebp - 68]
    push push eax
    lea lea eax, [ebp - 0174h]
    push push eax
    lea lea eax, [ebp - 4]
    push push eax
    lea lea eax, [ebp - 094h]
    push push eax
    push push 010119618h
    push push ebx
    mov mov ecx, esi
    call sub_100B9B1B
    test test eax, eax
    mov mov dword ptr [ebp - 8], eax
    jne L2
    mov mov dword ptr [ebp - 20], edi
    jmp L5
    and and dword ptr [ebp - 4], 0
    push push edi
    push push edi
    lea lea eax, [ebp - 68]
    push push eax
    lea lea eax, [ebp - 0174h]
    push push eax
    lea lea eax, [ebp - 4]
    push push eax
    lea lea eax, [ebp - 094h]
    push push eax
    push push 0101197B8h
    push push ebx
    mov mov ecx, esi
    call sub_100B9B50
    test test eax, eax
    mov mov dword ptr [ebp - 8], eax
    jne L4
    mov mov dword ptr [ebp - 36], edi
    jmp L6
    and and dword ptr [ebp - 4], 0
    push push edi
    push push edi
    lea lea eax, [ebp - 68]
    push push eax
    lea lea eax, [ebp - 0174h]
    push push eax
    lea lea eax, [ebp - 4]
    push push eax
    lea lea eax, [ebp - 094h]
    push push eax
    push push 010119958h
    push push ebx
    mov mov ecx, esi
    call sub_100B9B85
    test test eax, eax
    mov mov dword ptr [ebp - 8], eax
    jne L7
    mov mov dword ptr [ebp - 12], edi
    mov mov eax, dword ptr [ebp - 0164h]
    cmp cmp eax, dword ptr [ebp - 0154h]
    jne L20
    cmp cmp dword ptr [ebp - 8], 0
    jne L21
    mov mov ecx, dword ptr [ebp - 094h]
    mov mov ecx, dword ptr [ecx + 16]
    mov mov ecx, dword ptr [ecx]
    mov mov eax, dword ptr [esi + 20]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [ecx + 20]
    cmp cmp ecx, -1
    je L22
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov edx, dword ptr [esi + 24]
    mov mov ecx, dword ptr [ecx + 72]
    mov mov ecx, dword ptr [edx + ecx*4]
    and and dword ptr [ebp - 4], 0
    cmp cmp dword ptr [ecx], 011100001h
    jne L23
    mov mov ecx, dword ptr [ecx + 16]
    mov mov edi, dword ptr [ecx]
    mov mov ecx, dword ptr [eax + edi*4]
    mov mov ebx, dword ptr [ecx + 84]
    mov mov ecx, dword ptr [ecx + 88]
    cmp cmp ebx, ecx
    mov mov dword ptr [ebp - 24], ecx
    ja L24
    lea lea edx, [edx + ebx*4]
    mov mov dword ptr [ebp - 48], edx
    mov mov edx, dword ptr [edx]
    mov mov ecx, dword ptr [edx + 16]
    mov mov ecx, dword ptr [ecx]
    mov mov ecx, dword ptr [eax + ecx*4]
    cmp cmp dword ptr [ecx + 20], edi
    jne L8
    cmp cmp dword ptr [edx], 074700001h
    jne L10
    xor xor ecx, ecx
    cmp cmp dword ptr [ebp - 4], ecx
    jne L25
    mov mov dword ptr [ebp - 4], edx
    jmp L11
    xor xor ecx, ecx
    mov mov edx, dword ptr [ebp - 48]
    inc inc ebx
    add add edx, 4
    cmp cmp ebx, dword ptr [ebp - 24]
    mov mov dword ptr [ebp - 48], edx
    jbe L9
    mov mov edi, dword ptr [ebp - 4]
    cmp cmp edi, ecx
    je L26
    cmp cmp dword ptr [ebp - 12], ecx
    push push 1
    mov mov dword ptr [ebp - 16], ecx
    push push 1
    je L12
    lea lea eax, [ebp - 68]
    push push eax
    lea lea eax, [ebp - 0214h]
    push push eax
    lea lea eax, [ebp - 16]
    push push eax
    lea lea eax, [ebp - 0D4h]
    push push eax
    push push 010119A78h
    jmp L15
    cmp cmp dword ptr [ebp - 36], ecx
    je L14
    lea lea eax, [ebp - 68]
    push push eax
    lea lea eax, [ebp - 0214h]
    push push eax
    lea lea eax, [ebp - 16]
    push push eax
    lea lea eax, [ebp - 0D4h]
    push push eax
    push push 0101198B8h
    jmp L17
    cmp cmp dword ptr [ebp - 20], ecx
    je L16
    lea lea eax, [ebp - 68]
    push push eax
L2:
    lea lea eax, [ebp - 0214h]
    push push eax
    lea lea eax, [ebp - 16]
    push push eax
    lea lea eax, [ebp - 0D4h]
    push push eax
    push push 010119718h
    jmp L18
    lea lea eax, [ebp - 84]
    push push eax
    lea lea eax, [ebp - 0214h]
    push push eax
    lea lea eax, [ebp - 16]
    push push eax
    lea lea eax, [ebp - 0D4h]
    push push eax
    push push 010119598h
    push push dword ptr [ebp - 44]
    mov mov ecx, esi
    call sub_100B9CD8
    mov mov dword ptr [ebp - 8], eax
    mov mov eax, dword ptr [ebp - 0174h]
    cmp cmp dword ptr [ebp - 0214h], eax
    jne L19
    mov mov eax, dword ptr [ebp - 0204h]
    cmp cmp eax, -1
    je L31
    mov mov ebx, dword ptr [edi + 8]
    cmp cmp dword ptr [ebx], eax
    jne L32
    mov mov ecx, dword ptr [edi + 16]
    mov mov ecx, dword ptr [ecx]
    mov mov eax, dword ptr [esi + 20]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [eax + 20]
    cmp cmp ecx, -1
    je sub_100C0233
    mov mov eax, dword ptr [esi + 20]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [ecx + 72]
    mov mov edx, dword ptr [esi + 24]
    mov mov edx, dword ptr [edx + ecx*4]
    cmp cmp dword ptr [edx], 011100001h
    mov mov ecx, dword ptr [edx + 8]
    mov mov ecx, dword ptr [ecx]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov dword ptr [ebp - 48], edx
    jne sub_100C0259
    mov mov ecx, dword ptr [eax + 4]
    mov mov edi, dword ptr [esi + 16]
    mov mov ecx, dword ptr [edi + ecx*4]
    test test byte ptr [ecx + 5], 1
    je sub_100C026C
    mov mov ecx, dword ptr [esi + 104]
    fild fild dword ptr [esi + 104]
    test test ecx, ecx
    jge L28
    fadd fadd dword ptr [g_1019BC80]
    fld fld qword ptr [eax + 32]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp sub_100C028C
    mov mov eax, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ebx + 4]
    mov mov ebx, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [ebp - 0174h]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov edi, dword ptr [ebp - 0164h]
    mov mov dword ptr [ebp - 16], ecx
    mov mov ecx, dword ptr [eax + edi*4]
    mov mov eax, dword ptr [ecx + 72]
    cmp cmp eax, -1
    mov mov dword ptr [ebp - 24], ebx
    mov mov dword ptr [ebp - 12], edi
    je sub_100C0256
    jmp L30
    mov mov ebx, dword ptr [ebp - 24]
    cmp cmp dword ptr [ecx + 8], -1
    jne sub_100C0261
    mov mov edi, dword ptr [esi + 24]
    mov mov eax, dword ptr [edi + eax*4]
    mov mov edi, dword ptr [eax]
    and and edi, 0FFF00000h
    cmp cmp edi, 010000000h
    jne sub_100C0277
    mov mov edi, dword ptr [eax]
    and and dword ptr [ebp - 28], 0
    mov mov dword ptr [ebp - 20], edi
    and and dword ptr [ebp - 20], 0FFFFFh
    jbe sub_100C0289
    mov mov edi, dword ptr [eax + 16]
    mov mov ebx, dword ptr [edi]
    cmp cmp ebx, dword ptr [ebp - 12]
    je sub_100C0276
    inc inc dword ptr [ebp - 28]
    add add edi, 4
    mov mov dword ptr [ebp - 36], edi
    mov mov edi, dword ptr [ebp - 28]
    cmp cmp edi, dword ptr [ebp - 20]
    jae sub_100C02A1
    mov mov edi, dword ptr [ebp - 36]
    jmp sub_100C026F
    mov mov eax, dword ptr [eax + 8]
    mov mov ecx, dword ptr [ebp - 28]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [esi + 20]
    mov mov dword ptr [ebp - 12], ecx
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [ecx + 72]
    cmp cmp eax, -1
    jne sub_100C0255
    mov mov ebx, dword ptr [ebp - 24]
    mov mov eax, dword ptr [ebp - 16]
    mov mov edi, dword ptr [esi + 16]
    mov mov eax, dword ptr [eax + 4]
    mov mov eax, dword ptr [edi + eax*4]
    test test byte ptr [eax + 5], 1
    je sub_100C033A
    mov mov eax, dword ptr [ecx + 4]
    mov mov eax, dword ptr [edi + eax*4]
    test test byte ptr [eax + 5], 1
    je sub_100C0346
    mov mov eax, dword ptr [ebp - 16]
    fld fld qword ptr [g_1019BC88]
    fld fld qword ptr [eax + 32]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp sub_100C035B
    fld fld qword ptr [g_1019BE20]
    fld fld qword ptr [ecx + 32]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp sub_100C036D
    mov mov eax, dword ptr [ebx + 4]
    mov mov eax, dword ptr [edi + eax*4]
    test test byte ptr [eax + 5], 2
    je sub_100C0379
    test test byte ptr [ebx], 2
    je sub_100C037E
    cmp cmp dword ptr [ebx + 16], 0
    jne sub_100C0384
    cmp cmp dword ptr [ebx + 8], -1
    je sub_100C03C0
    inc inc dword ptr [ebp - 32]
    mov mov eax, dword ptr [ebp - 32]
    add add dword ptr [ebp - 40], 4
    cmp cmp eax, dword ptr [ebp - 52]
    jb L13
    jmp sub_100C06EC
    push push 01011A0C4h
    push push 012E3h
    push push ecx
    push push esi
L10:
    call sub_1008B5A0
    add add esp, 16
    mov mov eax, 080004005h
    jmp sub_100C0717
L11:
    mov mov eax, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [eax + 8]
    mov mov ecx, dword ptr [ecx + 4]
    mov mov edi, dword ptr [edx + 8]
    or or dword ptr [ebp - 20], -1
    mov mov dword ptr [edi], ecx
    and and dword ptr [eax], 0
    mov mov eax, dword ptr [edx + 16]
    mov mov eax, dword ptr [eax]
    mov mov ecx, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov eax, dword ptr [ecx + 84]
    cmp cmp eax, dword ptr [ecx + 88]
    mov mov dword ptr [ebp - 16], ecx
    mov mov dword ptr [ebp - 24], eax
    ja sub_100C06AB
    jmp sub_100C0461
    mov mov eax, dword ptr [ebp - 24]
    mov mov ecx, dword ptr [esi + 24]
    mov mov ebx, dword ptr [ecx + eax*4]
    cmp cmp dword ptr [ebx + 12], 0
    mov mov dword ptr [ebp - 28], ebx
    je sub_100C0593
    mov mov eax, dword ptr [ebx + 16]
    mov mov eax, dword ptr [eax]
    mov mov ecx, dword ptr [esi + 20]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [ecx + 16]
    mov mov eax, dword ptr [eax + 20]
    cmp cmp eax, dword ptr [ecx]
    jne sub_100C05AF
    and and dword ptr [ebp - 40], 0
    cmp cmp dword ptr [ebx + 4], 0
    jbe sub_100C05BD
    mov mov edx, dword ptr [ebp - 40]
    mov mov eax, dword ptr [ebx + 8]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov ecx, dword ptr [esi + 20]
    mov mov edi, dword ptr [ecx + eax*4]
    mov mov edx, dword ptr [edi + 8]
    or or dword ptr [ebp - 12], -1
    cmp cmp edx, -1
    je sub_100C0576
    mov mov ecx, dword ptr [ecx + edx*4]
    mov mov ecx, dword ptr [ecx + 72]
    cmp cmp ecx, -1
    je sub_100C05D8
    mov mov eax, dword ptr [esi + 24]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [ecx]
    mov mov ebx, eax
    and and ebx, 0FFF00000h
    cmp cmp ebx, 010000000h
    jne sub_100C0597
    and and dword ptr [ebp - 32], 0
    mov mov dword ptr [ebp - 36], eax
    and and dword ptr [ebp - 36], 0FFFFFh
    jbe sub_100C05AA
    mov mov ebx, dword ptr [ecx + 16]
    cmp cmp dword ptr [ebx], edx
    je sub_100C05A0
    inc inc dword ptr [ebp - 32]
    mov mov eax, dword ptr [ebp - 36]
    add add ebx, 4
    cmp cmp dword ptr [ebp - 32], eax
    jb sub_100C059A
    jmp sub_100C05C1
    mov mov eax, dword ptr [ecx + 8]
    mov mov ecx, dword ptr [ebp - 32]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov dword ptr [ebp - 12], eax
    jmp sub_100C05CF
    mov mov dword ptr [ebp - 12], edx
    mov mov ebx, dword ptr [ebp - 28]
    mov mov eax, dword ptr [ebp - 4]
    mov mov eax, dword ptr [eax + 8]
    mov mov ecx, dword ptr [ebp - 12]
    cmp cmp ecx, dword ptr [eax]
    jne sub_100C0638
    mov mov eax, dword ptr [ebp - 20]
    cmp cmp eax, -1
    jne sub_100C062C
    push push 4
    push push eax
L17:
    push push 21
    push push 01011A0C0h
    mov mov ecx, esi
    call sub_100866EF
    fldz fldz
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push 0
    push push 0
    push push eax
    mov mov ecx, esi
    call sub_1008675B
    mov mov dword ptr [ebp - 20], eax
    mov mov dword ptr [edi + 8], eax
    mov mov dword ptr [edi + 8], eax
    mov mov edi, dword ptr [edi + 56]
    cmp cmp edi, -1
    je sub_100C0675
    mov mov ecx, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ecx + edi*4]
    mov mov dword ptr [ecx + 8], eax
    inc inc dword ptr [ebp - 40]
    mov mov eax, dword ptr [ebp - 40]
    cmp cmp eax, dword ptr [ebx + 4]
    jb sub_100C05BD
    inc inc dword ptr [ebp - 24]
    mov mov eax, dword ptr [ebp - 16]
    mov mov ecx, dword ptr [ebp - 24]
    cmp cmp ecx, dword ptr [eax + 88]
    jbe sub_100C058F
    cmp cmp dword ptr [ebp - 20], -1
    je sub_100C07E8
    push push ecx
    fldz fldz
    push push ecx
    fstp fstp qword ptr [esp]
    xor xor ebx, ebx
    push push ebx
    push push ebx
    push push ebx
    mov mov ecx, esi
    call sub_100867B3
L19:
    fldz fldz
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push ebx
    push push ebx
    push push ebx
    mov mov ecx, esi
    mov mov edi, eax
    call sub_100867C6
    cmp cmp edi, -1
    je sub_100C0782
    cmp cmp eax, -1
    je sub_100C0787
    mov mov ecx, dword ptr [esi + 20]
    mov mov edx, dword ptr [ebp - 48]
    mov mov edx, dword ptr [edx + 8]
    mov mov edx, dword ptr [edx]
    mov mov edx, dword ptr [ecx + edx*4]
    mov mov edi, dword ptr [ecx + edi*4]
    mov mov ebx, dword ptr [ecx + eax*4]
    push push edx
    mov mov ecx, edi
    mov mov dword ptr [ebp - 52], edx
    call sub_1008631B
    push push dword ptr [ebp - 52]
    mov mov ecx, ebx
    call sub_10086325
    mov mov dword ptr [edi + 16], 1
    push push 116
    mov mov dword ptr [ebx + 16], 2
    call sub_10085EE9
    test test eax, eax
    je sub_100C07C3
    mov mov ecx, eax
L22:
    call sub_10085A59
    mov mov edi, eax
    jmp sub_100C07D0
    xor xor edi, edi
    test test edi, edi
    jne sub_100C07E4
    mov mov eax, 08007000Eh
    jmp sub_100C0913
    push push 0
    push push 1
    push push 3
    push push 074100001h
    mov mov ecx, edi
    call sub_10085F65
    mov mov ebx, eax
    test test ebx, ebx
    mov mov ecx, edi
    jge sub_100C0830
    push push 1
L24:
    call sub_1006CB2D
    mov mov eax, ebx
    jmp sub_100C093B
    mov mov ebx, dword ptr [ebp - 48]
    push push ebx
    call sub_10085AD5
    test test eax, eax
    mov mov dword ptr [ebp - 8], eax
    jge sub_100C0865
    mov mov ecx, edi
    jmp sub_100C0948
    mov mov eax, dword ptr [ebx + 16]
    mov mov eax, dword ptr [eax]
    mov mov ecx, dword ptr [edi + 16]
    mov mov dword ptr [ecx], eax
    mov mov eax, dword ptr [ebx + 8]
    mov mov eax, dword ptr [eax]
    mov mov ecx, dword ptr [edi + 8]
    mov mov dword ptr [ecx], eax
    mov mov eax, dword ptr [ebx + 8]
    mov mov eax, dword ptr [eax]
    mov mov ecx, dword ptr [edi + 8]
    mov mov dword ptr [ecx + 4], eax
    mov mov eax, dword ptr [ebx + 8]
    mov mov ecx, dword ptr [edi + 8]
    mov mov eax, dword ptr [eax]
    mov mov dword ptr [ecx + 8], eax
L27:
    push push edi
    mov mov ecx, ebx
    call sub_10086223
    push push 1
    mov mov ecx, edi
    mov mov dword ptr [ebp - 8], eax
    call sub_1006CB89
    cmp cmp dword ptr [ebp - 8], 0
    jl sub_100C0997
    mov mov eax, dword ptr [ebp - 16]
    mov mov edi, dword ptr [eax + 84]
    cmp cmp edi, dword ptr [eax + 88]
    mov mov dword ptr [ebp - 12], edi
    ja sub_100C0970
    mov mov edx, 0FFFFFh
    mov mov eax, dword ptr [esi + 24]
    mov mov eax, dword ptr [eax + edi*4]
    mov mov ecx, dword ptr [eax]
    mov mov ebx, ecx
    and and ebx, 0FFF00000h
    cmp cmp ebx, 020800000h
    jne sub_100C0981
    mov mov edi, dword ptr [eax + 8]
    mov mov edi, dword ptr [edi]
    mov mov ebx, dword ptr [esi + 20]
    mov mov edi, dword ptr [ebx + edi*4]
    mov mov ebx, dword ptr [ebp - 4]
    mov mov ebx, dword ptr [ebx + 16]
L29:
    mov mov edi, dword ptr [edi + 20]
    cmp cmp edi, dword ptr [ebx]
    jne sub_100C0996
    and and ecx, edx
    mov mov edi, ecx
    and and edi, edx
    or or edi, 010000000h
    mov mov dword ptr [eax], edi
    mov mov dword ptr [eax + 12], ecx
    mov mov dword ptr [eax + 4], ecx
    mov mov edi, dword ptr [ebp - 12]
    mov mov eax, dword ptr [ebp - 16]
    inc inc edi
    cmp cmp edi, dword ptr [eax + 88]
    mov mov dword ptr [ebp - 12], edi
    jbe sub_100C0975
    xor xor ecx, ecx
    cmp cmp dword ptr [esi + 8], ecx
    jbe sub_100C09FA
    mov mov eax, dword ptr [esi + 20]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov edx, dword ptr [ebp - 4]
    mov mov edx, dword ptr [edx + 16]
    mov mov edi, dword ptr [eax + 20]
    cmp cmp edi, dword ptr [edx]
    jne sub_100C0A07
    mov mov edx, dword ptr [ebp - 48]
    mov mov edx, dword ptr [edx + 16]
    mov mov edx, dword ptr [edx]
    mov mov dword ptr [eax + 20], edx
    inc inc ecx
    cmp cmp ecx, dword ptr [esi + 8]
    jb sub_100C09FA
    mov mov ecx, dword ptr [ebp - 44]
    push push 1
    call sub_1006CC2E
L32:
    mov mov eax, dword ptr [ebp - 8]
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_100bfa06 ENDP
END
