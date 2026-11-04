.686
.MODEL FLAT, C
EXTRN sub_10037D1D:PROC
EXTRN sub_1003CC79:PROC
EXTRN sub_1003CC83:PROC
EXTRN sub_1003CCCD:PROC
EXTRN sub_1003CD10:PROC
EXTRN sub_1003CD15:PROC
EXTRN sub_1003CD17:PROC
EXTRN sub_1003CD25:PROC
EXTRN sub_1003CD29:PROC
EXTRN sub_1003CDF5:PROC
EXTRN sub_1003CE03:PROC
EXTRN sub_1003CE04:PROC
EXTRN sub_1003CE0A:PROC
EXTRN sub_1003CE6F:PROC
EXTRN sub_1003CE89:PROC
EXTRN sub_1003CED6:PROC
EXTRN sub_1003CED9:PROC
EXTRN sub_1003CEE4:PROC
EXTRN sub_1003CEEA:PROC
EXTRN sub_1003CFE0:PROC
EXTRN sub_1003CFE7:PROC
EXTRN sub_1003CFEE:PROC
EXTRN sub_1003CFF0:PROC
EXTRN sub_1003D068:PROC
EXTRN sub_1003D0F7:PROC
EXTRN sub_1003D0F9:PROC
EXTRN sub_1003D0FD:PROC
EXTRN sub_1003D107:PROC
EXTRN sub_1003D10C:PROC
EXTRN sub_1003D1F6:PROC
EXTRN sub_1003D1FF:PROC
EXTRN sub_1003D204:PROC
EXTRN sub_1003D20D:PROC
EXTRN sub_1003D267:PROC
EXTRN sub_1003D2D5:PROC
EXTRN sub_1003D2E2:PROC
EXTRN sub_1003D2E3:PROC
EXTRN sub_1003D2ED:PROC
EXTRN sub_1003D3B6:PROC
EXTRN sub_1003D3BB:PROC
EXTRN sub_1003D3C4:PROC
EXTRN sub_1003D3C6:PROC
EXTRN sub_1003D44E:PROC
EXTRN sub_100F6CD3:PROC
EXTRN sub_100F6D83:PROC
EXTRN sub_100F6D90:PROC
EXTRN sub_100F6DE3:PROC
EXTRN sub_100F6E3F:PROC
EXTRN sub_100F6E64:PROC
EXTRN sub_100F6E9F:PROC
EXTRN sub_100F6ED3:PROC
EXTRN sub_100F6F20:PROC
EXTRN sub_100F6F43:PROC
EXTRN sub_100F6F90:PROC
EXTRN sub_100F6FB3:PROC
EXTRN sub_100F6FFF:PROC
EXTRN sub_100F7034:PROC
EXTRN sub_100F7070:PROC
EXTRN sub_100F70C4:PROC
EXTRN sub_100F70F0:PROC
EXTRN sub_100F7133:PROC
EXTRN sub_100F7180:PROC
EXTRN sub_100F71A3:PROC
EXTRN sub_100F71EF:PROC
EXTRN sub_100F7228:PROC
EXTRN sub_100F7260:PROC
EXTRN sub_100F72B5:PROC
EXTRN sub_100F72E5:PROC
EXTRN sub_100F7333:PROC
EXTRN sub_100F7371:PROC
EXTRN sub_100F73A3:PROC
EXTRN sub_100F73F0:PROC
EXTRN sub_100F7413:PROC
EXTRN sub_100F745F:PROC
EXTRN sub_100F74D0:PROC
EXTRN EXTRN g_101CE67C:DWORD:DWORD
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_101D496E:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
EXTRN EXTRN g_10766680:DWORD:DWORD
EXTRN EXTRN g_10766688:DWORD:DWORD
EXTRN EXTRN g_107667C8:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_1003c430 PROC
    push push ebp
    mov mov ebp, dword ptr [esp + 8]
    push push edi
    mov mov edi, dword ptr [g_10766688]
    xor xor edi, ebp
    mov mov dword ptr [esp + 12], edi
    jne L0
    mov mov eax, dword ptr [g_10766680]
    xor xor eax, ebp
    test test eax, 07000700h
    je sub_1003CC79
    mov mov ecx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [ecx + 8]
    test test eax, eax
    push push ebx
    push push esi
    je L1
    push push edi
    mov mov ebx, ebp
    call sub_10037D1D
    mov mov edi, dword ptr [esp + 24]
    add add esp, 4
    test test edi, 0800h
    je L3
    mov mov esi, ebp
    shr shr esi, 11
    not not esi
    and and esi, 1
    jmp L2
    lea lea esp, [esp]
    nop nop
    mov mov edx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [edx + 8]
    test test eax, eax
    je L4
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
L1:
    je L6
    push push 01019A310h
    push push 010193358h
    push push eax
    call sub_100F6D90
    mov mov eax, dword ptr [g_10764584]
    push push eax
    call sub_100F6CD3
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push esi
    push push 15
    push push eax
    call call dword ptr [ecx + 0E4h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne L5
    test test ebp, 0800h
    je L7
    mov mov edx, dword ptr [g_10766688]
    and and edx, 03000h
    or or ebp, edx
    and and edi, 0FFFFCFFFh
    mov mov dword ptr [esp + 20], edi
    test test edi, 03000h
    je L13
    mov mov eax, ebp
    and and eax, 03000h
    cmp cmp eax, 01000h
    jne L8
    mov mov esi, 5
    xor xor bl, bl
    jmp L9
    cmp cmp eax, 02000h
    mov mov bl, 080h
    mov mov esi, 2
    je L10
    mov mov esi, 7
    lea lea esp, [esp]
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je L11
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je L12
    push push 01019A2D8h
    push push 010193358h
    push push eax
    call sub_100F6E3F
    mov mov ecx, dword ptr [g_10764584]
    push push ecx
    call sub_100F6D83
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov edx, dword ptr [eax]
    push push esi
    push push 25
    push push eax
    call call dword ptr [edx + 0E4h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne L12
    cmp cmp byte ptr [g_107667C8], bl
    je L16
    movzx movzx esi, bl
    mov mov edi, edi
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je L14
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je L15
    push push 01019A2A4h
    push push 010193358h
    push push eax
    call sub_100F6E9F
    mov mov ecx, dword ptr [g_10764584]
    push push ecx
    call sub_100F6DE3
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov edx, dword ptr [eax]
    push push esi
    push push 24
    push push eax
    call call dword ptr [edx + 0E4h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne L15
    mov mov byte ptr [g_107667C8], bl
    test test edi, 018000000h
    je L17
    mov mov esi, ebp
    and and esi, 08000000h
    neg neg esi
    sbb sbb esi, esi
    mov mov eax, ebp
    shr shr eax, 25
    and and esi, 7
    and and eax, 8
    or or esi, eax
    lea lea ebx, [ebx]
    mov mov ecx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [ecx + 8]
    test test eax, eax
    je L18
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je L19
    push push 01019A268h
    push push 010193358h
    push push eax
    call sub_100F6F20
    mov mov edx, dword ptr [g_10764584]
    push push edx
    call sub_100F6E64
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push esi
    push push 0A8h
    push push eax
    call call dword ptr [ecx + 0E4h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne L20
    test test edi, 020000000h
    je L22
    mov mov esi, ebp
    shr shr esi, 29
    and and esi, 1
    jmp L21
    lea lea esp, [esp]
    mov mov edx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [edx + 8]
    test test eax, eax
    je L23
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je L25
    push push 01019A218h
    push push 010193358h
    push push eax
    call sub_100F6F90
    mov mov eax, dword ptr [g_10764584]
    push push eax
    call sub_100F6ED3
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push esi
    push push 28
    push push eax
    call call dword ptr [ecx + 0E4h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne L24
    test test edi, 0C000h
    je L26
    mov mov edx, ebp
    sar sar edx, 14
    and and edx, 3
    lea lea esi, [edx*4 + 010190704h]
    lea lea ebx, [ebx]
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je L27
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je L28
    push push 01019A1A8h
    push push 010193358h
    push push eax
    call sub_100F6FFF
    mov mov ecx, dword ptr [g_10764584]
    push push ecx
    call sub_100F6F43
    add add esp, 16
    mov mov ecx, dword ptr [esi]
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov edx, dword ptr [eax]
    push push ecx
    push push 22
    push push eax
    call call dword ptr [edx + 0E4h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne L29
L14:
    test test edi, edi
    jns L31
    mov mov esi, ebp
    and and esi, 080000000h
    neg neg esi
L15:
    sbb sbb esi, esi
    add add esi, 3
    jmp L30
    lea lea ebx, [ebx]
    mov mov edx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [edx + 8]
    test test eax, eax
    je L32
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je L34
    push push 01019A130h
    push push 010193358h
    push push eax
    call sub_100F7070
    mov mov eax, dword ptr [g_10764584]
    push push eax
    call sub_100F6FB3
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push esi
    push push 8
    push push eax
    call call dword ptr [ecx + 0E4h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne L33
    mov mov edx, dword ptr [g_10766680]
    mov mov ebx, ebp
    and and ebx, 0700h
    neg neg ebx
    sbb sbb bl, bl
    and and edx, 0700h
    inc inc bl
    neg neg edx
    sbb sbb dl, dl
    inc inc dl
    cmp cmp dl, bl
    je L36
    xor xor eax, eax
    test test bl, bl
    sete sete al
    mov mov esi, eax
    mov mov ecx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [ecx + 8]
    test test eax, eax
    je L35
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je L38
    push push 01019A0E0h
    push push 010193358h
    push push eax
    call sub_100F70F0
    mov mov edx, dword ptr [g_10764584]
    push push edx
    call sub_100F7034
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push esi
    push push 27
    push push eax
    call call dword ptr [ecx + 0E4h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne L37
    test test bl, bl
    mov mov eax, dword ptr [esp + 20]
    je sub_1003CC83
    mov mov edx, dword ptr [g_10766688]
    xor xor edx, ebp
    and and edx, 07FFh
    xor xor ebp, edx
    and and eax, 0FFFFF800h
    mov mov dword ptr [esp + 20], eax
L19:
    jmp sub_1003CD10
L20:
    test test ah, 7
    je sub_1003CD15
    mov mov eax, ebp
    sar sar eax, 8
    and and eax, 7
    lea lea esi, [eax*4 + 0101906ECh]
    jmp sub_1003CCCD
    lea lea ecx, [ecx]
    mov mov ecx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [ecx + 8]
    test test eax, eax
    je sub_1003CD17
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je sub_1003CD25
    push push 01019A068h
    push push 010193358h
    push push eax
    call sub_100F7180
    mov mov edx, dword ptr [g_10764584]
    push push edx
    call sub_100F70C4
    add add esp, 16
    mov mov edx, dword ptr [esi]
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push edx
    push push 0ABh
    push push eax
    call call dword ptr [ecx + 0E4h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_1003CD29
    mov mov bl, byte ptr [esp + 20]
    test test bl, bl
    je sub_1003CE6F
    test test bl, 15
    je sub_1003CE04
    mov mov esi, ebp
    and and esi, 15
    nop nop
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je sub_1003CDF5
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je sub_1003CE03
    push push 01019A020h
    push push 010193358h
    push push eax
    call sub_100F71EF
    mov mov ecx, dword ptr [g_10764584]
    push push ecx
    call sub_100F7133
    add add esp, 16
    mov mov ecx, dword ptr [esi*4 + 0101906B8h]
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov edx, dword ptr [eax]
    push push ecx
    push push 19
    push push eax
    call call dword ptr [edx + 0E4h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_1003CE0A
    test test bl, 0F0h
    je sub_1003CED9
    mov mov esi, ebp
    sar sar esi, 4
    and and esi, 15
    jmp sub_1003CE89
    lea lea esp, [esp]
    mov mov edx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [edx + 8]
    test test eax, eax
    je sub_1003CED6
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je sub_1003CEE4
    push push 010199FD8h
    push push 010193358h
    push push eax
    call sub_100F7260
    mov mov eax, dword ptr [g_10764584]
    push push eax
    call sub_100F71A3
    add add esp, 16
    mov mov edx, dword ptr [esi*4 + 0101906B8h]
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push edx
    push push 20
    push push eax
    call call dword ptr [ecx + 0E4h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_1003CEEA
    mov mov eax, dword ptr [g_10766680]
    mov mov ebx, ebp
    and and ebx, 07000000h
    neg neg ebx
    sbb sbb bl, bl
    and and eax, 07000000h
    inc inc bl
    neg neg eax
    sbb sbb al, al
    inc inc al
    cmp cmp al, bl
    je sub_1003CFE7
    xor xor ecx, ecx
    test test bl, bl
    sete sete cl
    mov mov esi, ecx
    mov mov edx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [edx + 8]
    test test eax, eax
    je sub_1003CFE0
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je sub_1003CFEE
    push push 010199F78h
    push push 010193358h
    push push eax
    call sub_100F72E5
L26:
    mov mov eax, dword ptr [g_10764584]
L27:
    push push eax
    call sub_100F7228
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
L28:
    mov mov ecx, dword ptr [eax]
L29:
    push push esi
    push push 0CEh
    push push eax
    call call dword ptr [ecx + 0E4h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_1003CFF0
    test test bl, bl
    je sub_1003D068
    mov mov eax, dword ptr [g_10766688]
    mov mov edi, dword ptr [esp + 20]
    xor xor eax, ebp
    and and eax, 07FF0000h
    xor xor ebp, eax
    and and edi, 0F800FFFFh
    jmp sub_1003D0F7
    test test dword ptr [esp + 20], 07000000h
    je sub_1003D0FD
    mov mov edx, ebp
    sar sar edx, 24
    and and edx, 7
    lea lea esi, [edx*4 + 0101906ECh]
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je sub_1003D0F9
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je sub_1003D107
    push push 010199EF8h
    push push 010193358h
    push push eax
    call sub_100F7371
    mov mov ecx, dword ptr [g_10764584]
    push push ecx
    call sub_100F72B5
    add add esp, 16
    mov mov ecx, dword ptr [esi]
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov edx, dword ptr [eax]
    push push ecx
    push push 0D1h
    push push eax
    call call dword ptr [edx + 0E4h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_1003D10C
    mov mov edi, dword ptr [esp + 20]
    test test edi, 0FF0000h
    je sub_1003D267
    test test edi, 0F0000h
    je sub_1003D1FF
    mov mov esi, ebp
    sar sar esi, 16
    and and esi, 15
    lea lea ebx, [ebx]
    mov mov edx, dword ptr [g_101CE7EC]
L32:
    mov mov eax, dword ptr [edx + 8]
    test test eax, eax
    je sub_1003D1F6
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
L34:
    setne setne cl
    test test cl, cl
    je sub_1003D204
    push push 010199EB0h
    push push 010193358h
    push push eax
    call sub_100F73F0
    mov mov eax, dword ptr [g_10764584]
    push push eax
    call sub_100F7333
    add add esp, 16
    mov mov edx, dword ptr [esi*4 + 0101906B8h]
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push edx
    push push 0CFh
    push push eax
    call call dword ptr [ecx + 0E4h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_1003D20D
    test test edi, 0F00000h
    je sub_1003D2E2
    mov mov esi, ebp
    sar sar esi, 20
    and and esi, 15
    lea lea ecx, [ecx]
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je sub_1003D2D5
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je sub_1003D2E3
    push push 010199E68h
    push push 010193358h
    push push eax
    call sub_100F745F
    mov mov ecx, dword ptr [g_10764584]
    push push ecx
    call sub_100F73A3
    add add esp, 16
    mov mov ecx, dword ptr [esi*4 + 0101906B8h]
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov edx, dword ptr [eax]
    push push ecx
    push push 0D0h
    push push eax
    call call dword ptr [edx + 0E4h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_1003D2ED
    test test edi, 040000000h
    je sub_1003D3BB
    mov mov esi, ebp
    shr shr esi, 30
    and and esi, 1
    lea lea ecx, [ecx]
    mov mov edx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [edx + 8]
    test test eax, eax
    je sub_1003D3B6
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je sub_1003D3C4
    push push 010199E08h
    push push 010193358h
    push push eax
    call sub_100F74D0
L36:
    mov mov eax, dword ptr [g_10764584]
    push push eax
    call sub_100F7413
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push esi
    push push 08Fh
    push push eax
    call call dword ptr [ecx + 0E4h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_1003D3C6
    mov mov al, byte ptr [g_101D496E]
    test test al, al
    pop pop esi
    pop pop ebx
    je sub_1003D44E
    mov mov edx, dword ptr [g_101CE67C]
FUN_1003c430 ENDP
END
