.686
.MODEL FLAT, C
EXTRN sub_10037D1D:PROC
EXTRN sub_1003CC79:PROC
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
EXTRN g_101CE67C:DWORD
EXTRN g_101CE7EC:DWORD
EXTRN g_101D1BF8:DWORD
EXTRN g_101D496E:DWORD
EXTRN g_10764584:DWORD
EXTRN g_10766680:DWORD
EXTRN g_10766688:DWORD
EXTRN g_107667C8:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_1003c430 PROC
    push ebp
    mov ebp, dword ptr [esp + 8]
    push edi
    mov edi, dword ptr [g_10766688]
    xor edi, ebp
    mov dword ptr [esp + 12], edi
    jne L0
    mov eax, dword ptr [g_10766680]
    xor eax, ebp
    test eax, 007000700h
    je sub_1003CC79
L0:
    mov ecx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [ecx + 8]
    test eax, eax
    push ebx
    push esi
    je L1
    push edi
    mov ebx, ebp
    call sub_10037D1D
    mov edi, dword ptr [esp + 24]
    add esp, 4
L1:
    test edi, 000000800h
    je L4
    mov esi, ebp
    shr esi, 11
    not esi
    and esi, 1
    jmp L2
    lea esp, [esp]
    nop
L2:
    mov edx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L3
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L3
    push 01019A310h
    push 010193358h
    push eax
    call sub_100F6D90
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100F6CD3
    add esp, 16
L3:
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push esi
    push 15
    push eax
    call dword ptr [ecx + 0xe4]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L2
L4:
    test ebp, 000000800h
    je L5
    mov edx, dword ptr [g_10766688]
    and edx, 000003000h
    or ebp, edx
    and edi, 0FFFFCFFFh
    mov dword ptr [esp + 20], edi
L5:
    test edi, 000003000h
    je L11
    mov eax, ebp
    and eax, 000003000h
    cmp eax, 000001000h
    jne L6
    mov esi, 5
    xor bl, bl
    jmp L7
L6:
    cmp eax, 000002000h
    mov bl, 000000080h
    mov esi, 2
    je L7
    mov esi, 7
    lea esp, [esp]
L7:
    mov eax, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L8
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L8
    push 01019A2D8h
    push 010193358h
    push eax
    call sub_100F6E3F
    mov ecx, dword ptr [g_10764584]
    push ecx
    call sub_100F6D83
    add esp, 16
L8:
    mov eax, dword ptr [g_101D1BF8]
    mov edx, dword ptr [eax]
    push esi
    push 25
    push eax
    call dword ptr [edx + 0xe4]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L7
    cmp byte ptr [g_107667C8], bl
    je L11
    movzx esi, bl
    mov edi, edi
L9:
    mov eax, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L10
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L10
    push 01019A2A4h
    push 010193358h
    push eax
    call sub_100F6E9F
    mov ecx, dword ptr [g_10764584]
    push ecx
    call sub_100F6DE3
    add esp, 16
L10:
    mov eax, dword ptr [g_101D1BF8]
    mov edx, dword ptr [eax]
    push esi
    push 24
    push eax
    call dword ptr [edx + 0xe4]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L9
    mov byte ptr [g_107667C8], bl
L11:
    test edi, 018000000h
    je L14
    mov esi, ebp
    and esi, 008000000h
    neg esi
    sbb esi, esi
    mov eax, ebp
    shr eax, 25
    and esi, 7
    and eax, 8
    or esi, eax
    lea ebx, [ebx]
L12:
    mov ecx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [ecx + 8]
    test eax, eax
    je L13
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L13
    push 01019A268h
    push 010193358h
    push eax
    call sub_100F6F20
    mov edx, dword ptr [g_10764584]
    push edx
    call sub_100F6E64
    add esp, 16
L13:
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push esi
    push 0000000A8h
    push eax
    call dword ptr [ecx + 0xe4]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L12
L14:
    test edi, 020000000h
    je L17
    mov esi, ebp
    shr esi, 29
    and esi, 1
    jmp L15
    lea esp, [esp]
L15:
    mov edx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L16
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L16
    push 01019A218h
    push 010193358h
    push eax
    call sub_100F6F90
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100F6ED3
    add esp, 16
L16:
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push esi
    push 28
    push eax
    call dword ptr [ecx + 0xe4]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L15
L17:
    test edi, 00000C000h
    je L20
    mov edx, ebp
    sar edx, 14
    and edx, 3
    lea esi, [edx*4 + 010190704h]
    lea ebx, [ebx]
L18:
    mov eax, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L19
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L19
    push 01019A1A8h
    push 010193358h
    push eax
    call sub_100F6FFF
    mov ecx, dword ptr [g_10764584]
    push ecx
    call sub_100F6F43
    add esp, 16
L19:
    mov ecx, dword ptr [esi]
    mov eax, dword ptr [g_101D1BF8]
    mov edx, dword ptr [eax]
    push ecx
    push 22
    push eax
    call dword ptr [edx + 0xe4]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L18
L20:
    test edi, edi
    jns L23
    mov esi, ebp
    and esi, 080000000h
    neg esi
    sbb esi, esi
    add esi, 3
    jmp L21
    lea ebx, [ebx]
L21:
    mov edx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L22
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L22
    push 01019A130h
    push 010193358h
    push eax
    call sub_100F7070
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100F6FB3
    add esp, 16
L22:
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push esi
    push 8
    push eax
    call dword ptr [ecx + 0xe4]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L21
L23:
    mov edx, dword ptr [g_10766680]
    mov ebx, ebp
    and ebx, 000000700h
    neg ebx
    sbb bl, bl
    and edx, 000000700h
    inc bl
    neg edx
    sbb dl, dl
    inc dl
    cmp dl, bl
    je L26
    xor eax, eax
    test bl, bl
    sete al
    mov esi, eax
L24:
    mov ecx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [ecx + 8]
    test eax, eax
    je L25
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L25
    push 01019A0E0h
    push 010193358h
    push eax
    call sub_100F70F0
    mov edx, dword ptr [g_10764584]
    push edx
    call sub_100F7034
    add esp, 16
L25:
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push esi
    push 27
    push eax
    call dword ptr [ecx + 0xe4]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L24
L26:
    test bl, bl
    mov eax, dword ptr [esp + 20]
    je L27
    mov edx, dword ptr [g_10766688]
    xor edx, ebp
    and edx, 0000007FFh
    xor ebp, edx
    and eax, 0FFFFF800h
    mov dword ptr [esp + 20], eax
    jmp L30
L27:
    test ah, 7
    je L30
    mov eax, ebp
    sar eax, 8
    and eax, 7
    lea esi, [eax*4 + 0101906ECh]
    jmp L28
    lea ecx, [ecx]
L28:
    mov ecx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [ecx + 8]
    test eax, eax
    je L29
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L29
    push 01019A068h
    push 010193358h
    push eax
    call sub_100F7180
    mov edx, dword ptr [g_10764584]
    push edx
    call sub_100F70C4
    add esp, 16
L29:
    mov edx, dword ptr [esi]
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push edx
    push 0000000ABh
    push eax
    call dword ptr [ecx + 0xe4]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L28
L30:
    mov bl, byte ptr [esp + 20]
    test bl, bl
    je L36
    test bl, 15
    je L33
    mov esi, ebp
    and esi, 15
    nop
L31:
    mov eax, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L32
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L32
    push 01019A020h
    push 010193358h
    push eax
    call sub_100F71EF
    mov ecx, dword ptr [g_10764584]
    push ecx
    call sub_100F7133
    add esp, 16
L32:
    mov ecx, dword ptr [esi*4 + 0101906B8h]
    mov eax, dword ptr [g_101D1BF8]
    mov edx, dword ptr [eax]
    push ecx
    push 19
    push eax
    call dword ptr [edx + 0xe4]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L31
L33:
    test bl, 0000000F0h
    je L36
    mov esi, ebp
    sar esi, 4
    and esi, 15
    jmp L34
    lea esp, [esp]
L34:
    mov edx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L35
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L35
    push 010199FD8h
    push 010193358h
    push eax
    call sub_100F7260
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100F71A3
    add esp, 16
L35:
    mov edx, dword ptr [esi*4 + 0101906B8h]
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push edx
    push 20
    push eax
    call dword ptr [ecx + 0xe4]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L34
L36:
    mov eax, dword ptr [g_10766680]
    mov ebx, ebp
    and ebx, 007000000h
    neg ebx
    sbb bl, bl
    and eax, 007000000h
    inc bl
    neg eax
    sbb al, al
    inc al
    cmp al, bl
    je L39
    xor ecx, ecx
    test bl, bl
    sete cl
    mov esi, ecx
L37:
    mov edx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L38
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L38
    push 010199F78h
    push 010193358h
    push eax
    call sub_100F72E5
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100F7228
    add esp, 16
L38:
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push esi
    push 0000000CEh
    push eax
    call dword ptr [ecx + 0xe4]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L37
L39:
    test bl, bl
    je L40
    mov eax, dword ptr [g_10766688]
    mov edi, dword ptr [esp + 20]
    xor eax, ebp
    and eax, 007FF0000h
    xor ebp, eax
    and edi, 0F800FFFFh
    jmp L44
L40:
    test dword ptr [esp + 20], 007000000h
    je L43
    mov edx, ebp
    sar edx, 24
    and edx, 7
    lea esi, [edx*4 + 0101906ECh]
L41:
    mov eax, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L42
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L42
    push 010199EF8h
    push 010193358h
    push eax
    call sub_100F7371
    mov ecx, dword ptr [g_10764584]
    push ecx
    call sub_100F72B5
    add esp, 16
L42:
    mov ecx, dword ptr [esi]
    mov eax, dword ptr [g_101D1BF8]
    mov edx, dword ptr [eax]
    push ecx
    push 0000000D1h
    push eax
    call dword ptr [edx + 0xe4]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L41
L43:
    mov edi, dword ptr [esp + 20]
L44:
    test edi, 000FF0000h
    je L50
    test edi, 0000F0000h
    je L47
    mov esi, ebp
    sar esi, 16
    and esi, 15
    lea ebx, [ebx]
L45:
    mov edx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L46
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L46
    push 010199EB0h
    push 010193358h
    push eax
    call sub_100F73F0
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100F7333
    add esp, 16
L46:
    mov edx, dword ptr [esi*4 + 0101906B8h]
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push edx
    push 0000000CFh
    push eax
    call dword ptr [ecx + 0xe4]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L45
L47:
    test edi, 000F00000h
    je L50
    mov esi, ebp
    sar esi, 20
    and esi, 15
    lea ecx, [ecx]
L48:
    mov eax, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L49
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L49
    push 010199E68h
    push 010193358h
    push eax
    call sub_100F745F
    mov ecx, dword ptr [g_10764584]
    push ecx
    call sub_100F73A3
    add esp, 16
L49:
    mov ecx, dword ptr [esi*4 + 0101906B8h]
    mov eax, dword ptr [g_101D1BF8]
    mov edx, dword ptr [eax]
    push ecx
    push 0000000D0h
    push eax
    call dword ptr [edx + 0xe4]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L48
L50:
    test edi, 040000000h
    je L53
    mov esi, ebp
    shr esi, 30
    and esi, 1
    lea ecx, [ecx]
L51:
    mov edx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L52
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L52
    push 010199E08h
    push 010193358h
    push eax
    call sub_100F74D0
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100F7413
    add esp, 16
L52:
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push esi
    push 00000008Fh
    push eax
    call dword ptr [ecx + 0xe4]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L51
L53:
    mov al, byte ptr [g_101D496E]
    test al, al
    pop esi
    pop ebx
    je sub_1003D44E
    mov edx, dword ptr [g_101CE67C]
FUN_1003c430 ENDP
END
