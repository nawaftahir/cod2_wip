.686
.MODEL FLAT, C
EXTRN sub_100F8CB0:PROC
EXTRN sub_100FA6F9:PROC
EXTRN sub_100FC8DB:PROC
EXTRN sub_10101555:PROC
EXTRN sub_101056ED:PROC
EXTRN sub_10105BDE:PROC
EXTRN sub_10105C0E:PROC
EXTRN sub_10105C1A:PROC
EXTRN sub_10105C2D:PROC
EXTRN sub_10105C84:PROC
EXTRN sub_10105C91:PROC
EXTRN sub_1010633D:PROC
EXTRN sub_10106730:PROC
EXTRN sub_1010724A:PROC
EXTRN fp_101A4FB0:DWORD
EXTRN fp_101A4FB4:DWORD
EXTRN fp_101A4FBC:DWORD
EXTRN g_101A4890:DWORD
EXTRN g_101A4894:DWORD
EXTRN g_101A5090:DWORD
EXTRN g_101A50D0:DWORD
EXTRN g_101A50E0:DWORD
.CODE
__woutput PROC
    push ebp
    lea ebp, [esp - 0000003D8h]
    sub esp, 000000458h
    mov eax, dword ptr [g_101A50D0]
    mov edx, dword ptr [ebp + 0000003E4h]
    mov dword ptr [ebp + 0000003D4h], eax
    xor eax, eax
    push ebx
    mov bx, word ptr [edx]
    xor ecx, ecx
    cmp bx, ax
    mov dword ptr [ebp - 56], eax
    mov dword ptr [ebp - 64], eax
    mov dword ptr [ebp - 88], eax
    je L86
    push esi
    push edi
    jmp L1
L0:
    mov ecx, dword ptr [ebp - 104]
L1:
    push 2
    pop edi
    add dword ptr [ebp + 0000003E4h], edi
    cmp dword ptr [ebp - 64], 0
    jl L85
    push 32
    pop esi
    cmp bx, si
    jb L2
    cmp bx, 120
    ja L2
    movzx eax, bx
    movsx eax, byte ptr [eax + 01017C6E8h]
    and eax, 15
    jmp L3
L2:
    xor eax, eax
L3:
    movsx eax, byte ptr [ecx + eax*8 + 01017C708h]
    push 7
    sar eax, 4
    pop ecx
    cmp eax, ecx
    mov dword ptr [ebp - 104], eax
    ja L84
    jmp dword ptr [eax*4 + 0x10105d3c]
    xor eax, eax
    or dword ptr [ebp - 52], 0FFFFFFFFh
    mov dword ptr [ebp - 108], eax
    mov dword ptr [ebp - 92], eax
    mov dword ptr [ebp - 72], eax
    mov dword ptr [ebp - 68], eax
    mov dword ptr [ebp - 48], eax
    mov dword ptr [ebp - 76], eax
    jmp L84
    movzx eax, bx
    sub eax, esi
    je L7
    sub eax, 3
    je L6
    sub eax, 8
    je L5
    sub eax, edi
    je L4
    sub eax, 3
    jne L84
    or dword ptr [ebp - 48], 8
    jmp L84
L4:
    or dword ptr [ebp - 48], 4
    jmp L84
L5:
    or dword ptr [ebp - 48], 1
    jmp L84
L6:
    or byte ptr [ebp - 48], 000000080h
    jmp L84
L7:
    or dword ptr [ebp - 48], edi
    jmp L84
    cmp bx, 42
    jne L8
    add dword ptr [ebp + 0000003E8h], 4
    mov eax, dword ptr [ebp + 0000003E8h]
    mov eax, dword ptr [eax - 4]
    test eax, eax
    mov dword ptr [ebp - 72], eax
    jge L84
    or dword ptr [ebp - 48], 4
    neg dword ptr [ebp - 72]
    jmp L84
L8:
    mov eax, dword ptr [ebp - 72]
    movzx ecx, bx
    lea eax, [eax + eax*4]
    lea eax, [ecx + eax*2 - 48]
    mov dword ptr [ebp - 72], eax
    jmp L84
    and dword ptr [ebp - 52], 0
    jmp L84
    cmp bx, 42
    jne L9
    add dword ptr [ebp + 0000003E8h], 4
    mov eax, dword ptr [ebp + 0000003E8h]
    mov eax, dword ptr [eax - 4]
    test eax, eax
    mov dword ptr [ebp - 52], eax
    jge L84
    or dword ptr [ebp - 52], 0FFFFFFFFh
    jmp L84
L9:
    mov eax, dword ptr [ebp - 52]
    movzx ecx, bx
    lea eax, [eax + eax*4]
    lea eax, [ecx + eax*2 - 48]
    mov dword ptr [ebp - 52], eax
    jmp L84
    movzx eax, bx
    cmp eax, 73
    je L12
    cmp eax, 104
    je L11
    cmp eax, 108
    je L10
    cmp eax, 119
    jne L84
    or byte ptr [ebp - 47], 8
    jmp L84
L10:
    or dword ptr [ebp - 48], 16
    jmp L84
L11:
    or dword ptr [ebp - 48], esi
    jmp L84
L12:
    mov eax, dword ptr [ebp + 0000003E4h]
    mov ax, word ptr [eax]
    cmp ax, 54
    jne L13
    mov ecx, dword ptr [ebp + 0000003E4h]
    cmp word ptr [ecx + 2], 52
    jne L13
    add dword ptr [ebp + 0000003E4h], 4
    or byte ptr [ebp - 47], 000000080h
    jmp L84
L13:
    cmp ax, 51
    jne L14
    mov ecx, dword ptr [ebp + 0000003E4h]
    cmp word ptr [ecx + 2], 50
    jne L14
    add dword ptr [ebp + 0000003E4h], 4
    and byte ptr [ebp - 47], 127
    jmp L84
L14:
    cmp ax, 100
    je L84
    cmp ax, 105
    je L84
    cmp ax, 111
    je L84
    cmp ax, 117
    je L84
    cmp ax, 120
    je L84
    cmp ax, 88
    je L84
    and dword ptr [ebp - 104], 0
    mov eax, dword ptr [ebp + 0000003E0h]
    push ebx
    lea esi, [ebp - 64]
    mov dword ptr [ebp - 76], 1
    call sub_101056ED
    jmp L83
    movzx eax, bx
    cmp eax, 103
    jg L42
    cmp eax, 101
    jge L21
    cmp eax, 88
    jg L24
    je L49
    sub eax, 67
    je L22
    sub eax, edi
    je L20
    sub eax, edi
    je L20
    sub eax, 12
    jne L72
    test word ptr [ebp - 48], 000000830h
    jne L15
    or dword ptr [ebp - 48], esi
L15:
    mov edx, dword ptr [ebp - 52]
    cmp edx, -1
    jne L16
    mov edx, 07FFFFFFFh
L16:
    add dword ptr [ebp + 0000003E8h], 4
    test byte ptr [ebp - 48], 32
    mov eax, dword ptr [ebp + 0000003E8h]
    mov eax, dword ptr [eax - 4]
    mov dword ptr [ebp - 60], eax
    je L43
    test eax, eax
    jne L17
    mov eax, dword ptr [g_101A4890]
    mov dword ptr [ebp - 60], eax
L17:
    and dword ptr [ebp - 56], 0
    test edx, edx
    mov eax, dword ptr [ebp - 60]
    jle L72
L18:
    mov cl, byte ptr [eax]
    test cl, cl
    je L72
    mov esi, dword ptr [g_101A5090]
    movzx ecx, cl
    test byte ptr [esi + ecx*2 + 1], 000000080h
    je L19
    inc eax
L19:
    inc eax
    inc dword ptr [ebp - 56]
    cmp dword ptr [ebp - 56], edx
    jl L18
    jmp L72
L20:
    mov dword ptr [ebp - 108], 1
    add ebx, esi
L21:
    or dword ptr [ebp - 48], 64
    cmp dword ptr [ebp - 52], 0
    lea esi, [ebp - 44]
    mov dword ptr [ebp - 60], esi
    jge L33
    mov dword ptr [ebp - 52], 6
    jmp L37
L22:
    test word ptr [ebp - 48], 000000830h
    jne L23
    or dword ptr [ebp - 48], esi
L23:
    add dword ptr [ebp + 0000003E8h], 4
    mov eax, dword ptr [ebp + 0000003E8h]
    movzx eax, word ptr [eax - 4]
    xor esi, esi
    inc esi
    test byte ptr [ebp - 48], 32
    mov dword ptr [ebp - 76], esi
    mov dword ptr [ebp - 112], eax
    je L28
    push dword ptr [g_101A50E0]
    mov byte ptr [ebp - 84], al
    lea eax, [ebp - 84]
    push eax
    lea eax, [ebp - 44]
    push eax
    mov byte ptr [ebp - 83], 0
    call sub_1010633D
    add esp, 12
    test eax, eax
    jge L29
    mov dword ptr [ebp - 92], esi
    jmp L29
L24:
    sub eax, 90
    je L30
    sub eax, 9
    je L23
    dec eax
    jne L72
L25:
    or dword ptr [ebp - 48], 64
L26:
    mov dword ptr [ebp - 56], 10
L27:
    mov ebx, dword ptr [ebp - 48]
    mov esi, 000008000h
    test esi, ebx
    je L55
    mov ecx, dword ptr [ebp + 0000003E8h]
    mov eax, dword ptr [ecx]
    mov edx, dword ptr [ecx + 4]
    add ecx, 8
    mov dword ptr [ebp + 0000003E8h], ecx
    jmp L59
L28:
    mov word ptr [ebp - 44], ax
L29:
    lea eax, [ebp - 44]
    mov dword ptr [ebp - 60], eax
    mov dword ptr [ebp - 56], esi
    jmp L72
L30:
    add dword ptr [ebp + 0000003E8h], 4
    mov eax, dword ptr [ebp + 0000003E8h]
    mov eax, dword ptr [eax - 4]
    test eax, eax
    je L32
    mov ecx, dword ptr [eax + 4]
    test ecx, ecx
    je L32
    test byte ptr [ebp - 47], 8
    movsx eax, word ptr [eax]
    mov dword ptr [ebp - 60], ecx
    je L31
    cdq
    sub eax, edx
    sar eax, 1
    mov dword ptr [ebp - 76], 1
    jmp L71
L31:
    and dword ptr [ebp - 76], 0
    jmp L71
L32:
    mov eax, dword ptr [g_101A4890]
    mov dword ptr [ebp - 60], eax
    push eax
    jmp L41
L33:
    jne L34
    cmp bx, 103
    jne L37
    mov dword ptr [ebp - 52], 1
    jmp L37
L34:
    mov eax, 000000200h
    cmp dword ptr [ebp - 52], eax
    jle L35
    mov dword ptr [ebp - 52], eax
L35:
    mov edi, 0000000A3h
    cmp dword ptr [ebp - 52], edi
    jle L37
    mov eax, dword ptr [ebp - 52]
    add eax, 00000015Dh
    push eax
    call sub_100FC8DB
    test eax, eax
    pop ecx
    mov dword ptr [ebp - 88], eax
    je L36
    mov dword ptr [ebp - 60], eax
    mov esi, eax
    jmp L37
L36:
    mov dword ptr [ebp - 52], edi
L37:
    mov eax, dword ptr [ebp + 0000003E8h]
    mov ecx, dword ptr [eax]
    push dword ptr [ebp - 108]
    add eax, 8
    push dword ptr [ebp - 52]
    mov dword ptr [ebp + 0000003E8h], eax
    mov eax, dword ptr [eax - 4]
    mov dword ptr [ebp - 124], eax
    movsx eax, bl
    push eax
    lea eax, [ebp - 000000080h]
    push esi
    push eax
    mov dword ptr [ebp - 000000080h], ecx
    call dword ptr [fp_101A4FB0]
    mov edi, dword ptr [ebp - 48]
    add esp, 20
    and edi, 000000080h
    je L38
    cmp dword ptr [ebp - 52], 0
    jne L38
    push esi
    call dword ptr [fp_101A4FBC]
    pop ecx
L38:
    cmp bx, 103
    jne L39
    test edi, edi
    jne L39
    push esi
    call dword ptr [fp_101A4FB4]
    pop ecx
L39:
    cmp byte ptr [esi], 45
    jne L40
    or byte ptr [ebp - 47], 1
    inc esi
    mov dword ptr [ebp - 60], esi
L40:
    push esi
L41:
    call sub_100FA6F9
    pop ecx
    jmp L71
L42:
    sub eax, 105
    je L25
    sub eax, 5
    je L52
    dec eax
    je L51
    dec eax
    je L48
    sub eax, 3
    je L15
    sub eax, edi
    je L26
    sub eax, 3
    jne L72
    mov dword ptr [ebp - 100], 39
    jmp L50
L43:
    test eax, eax
    jne L44
    mov eax, dword ptr [g_101A4894]
    mov dword ptr [ebp - 60], eax
L44:
    mov eax, dword ptr [ebp - 60]
    mov dword ptr [ebp - 76], 1
    jmp L46
L45:
    dec edx
    cmp word ptr [eax], 0
    je L47
    add eax, edi
L46:
    test edx, edx
    jne L45
L47:
    sub eax, dword ptr [ebp - 60]
    sar eax, 1
    jmp L71
L48:
    mov dword ptr [ebp - 52], 8
L49:
    mov dword ptr [ebp - 100], ecx
L50:
    test byte ptr [ebp - 48], 000000080h
    mov dword ptr [ebp - 56], 16
    je L27
    mov eax, dword ptr [ebp - 100]
    add eax, 81
    mov word ptr [ebp - 80], 48
    mov word ptr [ebp - 78], ax
    mov dword ptr [ebp - 68], edi
    jmp L27
L51:
    test byte ptr [ebp - 48], 000000080h
    mov dword ptr [ebp - 56], 8
    je L27
    or byte ptr [ebp - 47], 2
    jmp L27
L52:
    add dword ptr [ebp + 0000003E8h], 4
    test byte ptr [ebp - 48], 32
    mov eax, dword ptr [ebp + 0000003E8h]
    mov eax, dword ptr [eax - 4]
    je L53
    mov cx, word ptr [ebp - 64]
    mov word ptr [eax], cx
    jmp L54
L53:
    mov ecx, dword ptr [ebp - 64]
    mov dword ptr [eax], ecx
L54:
    mov dword ptr [ebp - 92], 1
    jmp L82
L55:
    add dword ptr [ebp + 0000003E8h], 4
    test bl, 32
    mov eax, dword ptr [ebp + 0000003E8h]
    je L58
    test bl, 64
    je L57
    movsx eax, word ptr [eax - 4]
L56:
    cdq
    jmp L59
L57:
    movzx eax, word ptr [eax - 4]
    jmp L56
L58:
    test bl, 64
    mov eax, dword ptr [eax - 4]
    jne L56
    xor edx, edx
L59:
    test bl, 64
    je L61
    test edx, edx
    jg L61
    jl L60
    test eax, eax
    jae L61
L60:
    neg eax
    adc edx, 0
    neg edx
    or byte ptr [ebp - 47], 1
L61:
    test dword ptr [ebp - 48], esi
    mov ebx, eax
    mov edi, edx
    jne L62
    xor edi, edi
L62:
    cmp dword ptr [ebp - 52], 0
    jge L63
    mov dword ptr [ebp - 52], 1
    jmp L64
L63:
    and dword ptr [ebp - 48], 0FFFFFFF7h
    mov eax, 000000200h
    cmp dword ptr [ebp - 52], eax
    jle L64
    mov dword ptr [ebp - 52], eax
L64:
    mov eax, ebx
    or eax, edi
    jne L65
    and dword ptr [ebp - 68], 0
L65:
    lea esi, [ebp + 0000001D3h]
L66:
    mov eax, dword ptr [ebp - 52]
    dec dword ptr [ebp - 52]
    test eax, eax
    jg L67
    mov eax, ebx
    or eax, edi
    je L69
L67:
    mov eax, dword ptr [ebp - 56]
    cdq
    push edx
    push eax
    push edi
    push ebx
    call sub_1010724A
    add ecx, 48
    cmp ecx, 57
    mov dword ptr [ebp - 116], ebx
    mov ebx, eax
    mov edi, edx
    jle L68
    add ecx, dword ptr [ebp - 100]
L68:
    mov byte ptr [esi], cl
    dec esi
    jmp L66
L69:
    lea eax, [ebp + 0000001D3h]
    sub eax, esi
    inc esi
    test byte ptr [ebp - 47], 2
    mov dword ptr [ebp - 56], eax
    mov dword ptr [ebp - 60], esi
    je L72
    mov ecx, esi
    cmp byte ptr [ecx], 48
    jne L70
    test eax, eax
    jne L72
L70:
    dec dword ptr [ebp - 60]
    mov ecx, dword ptr [ebp - 60]
    mov byte ptr [ecx], 48
    inc eax
L71:
    mov dword ptr [ebp - 56], eax
L72:
    cmp dword ptr [ebp - 92], 0
    jne L82
    mov eax, dword ptr [ebp - 48]
    test al, 64
    je L76
    test ah, 1
    je L73
    mov word ptr [ebp - 80], 45
    jmp L75
L73:
    test al, 1
    je L74
    mov word ptr [ebp - 80], 43
    jmp L75
L74:
    test al, 2
    je L76
    mov word ptr [ebp - 80], 32
L75:
    mov dword ptr [ebp - 68], 1
L76:
    mov ebx, dword ptr [ebp - 72]
    sub ebx, dword ptr [ebp - 68]
    sub ebx, dword ptr [ebp - 56]
    test byte ptr [ebp - 48], 12
    jne L77
    push dword ptr [ebp + 0000003E0h]
    lea eax, [ebp - 64]
    push ebx
    push 32
    call sub_10105BDE
    add esp, 12
L77:
    push dword ptr [ebp - 68]
    mov edi, dword ptr [ebp + 0000003E0h]
    lea eax, [ebp - 64]
    lea ecx, [ebp - 80]
    call sub_10105C1A
    test byte ptr [ebp - 48], 8
    pop ecx
    je L78
    test byte ptr [ebp - 48], 4
    jne L78
    push edi
    push ebx
    push 48
    lea eax, [ebp - 64]
    call sub_10105C0E
    add esp, 12
L78:
    cmp dword ptr [ebp - 76], 0
    jne L80
    mov eax, dword ptr [ebp - 56]
    test eax, eax
    jle L80
    mov edi, dword ptr [ebp - 60]
    mov dword ptr [ebp - 96], eax
L79:
    push dword ptr [g_101A50E0]
    dec dword ptr [ebp - 96]
    lea eax, [ebp - 112]
    push edi
    push eax
    call sub_10106730
    add esp, 12
    test eax, eax
    mov dword ptr [ebp - 116], eax
    jle L81
    push dword ptr [ebp - 112]
    mov eax, dword ptr [ebp + 0000003E0h]
    lea esi, [ebp - 64]
    call sub_10105C2D
    add edi, dword ptr [ebp - 116]
    cmp dword ptr [ebp - 96], 0
    pop ecx
    jg L79
    jmp L81
L80:
    push dword ptr [ebp - 56]
    mov ecx, dword ptr [ebp - 60]
    lea eax, [ebp - 64]
    call sub_10105C91
    pop ecx
L81:
    test byte ptr [ebp - 48], 4
    je L82
    push dword ptr [ebp + 0000003E0h]
    lea eax, [ebp - 64]
    push ebx
    push 32
    call sub_10105C84
    add esp, 12
L82:
    cmp dword ptr [ebp - 88], 0
    je L84
    push dword ptr [ebp - 88]
    call sub_100F8CB0
    and dword ptr [ebp - 88], 0
L83:
    pop ecx
L84:
    mov eax, dword ptr [ebp + 0000003E4h]
    mov bx, word ptr [eax]
    test bx, bx
    jne L0
L85:
    pop edi
    pop esi
L86:
    mov ecx, dword ptr [ebp + 0000003D4h]
    mov eax, dword ptr [ebp - 64]
    pop ebx
    call sub_10101555
    add ebp, 0000003D8h
    leave
    ret
__woutput ENDP
END
