.686
.MODEL FLAT, C
EXTRN sub_100F8C7C:PROC
EXTRN sub_100FA679:PROC
EXTRN sub_100FA692:PROC
EXTRN sub_100FA6BC:PROC
EXTRN sub_100FAB60:PROC
EXTRN sub_100FAB8E:PROC
EXTRN sub_100FAB9B:PROC
EXTRN sub_100FABFC:PROC
EXTRN sub_100FAC07:PROC
EXTRN sub_100FAC13:PROC
EXTRN sub_100FC89F:PROC
EXTRN sub_1010151F:PROC
EXTRN sub_10106ED5:PROC
EXTRN sub_10107219:PROC
EXTRN sub_101072DC:PROC
EXTRN fp_101A4FB0:DWORD
EXTRN fp_101A4FB4:DWORD
EXTRN fp_101A4FBC:DWORD
EXTRN g_101A4890:DWORD
EXTRN g_101A4894:DWORD
EXTRN g_101A5090:DWORD
EXTRN g_101A50D0:DWORD
.CODE
__output PROC
    push ebp
    lea ebp, [esp - 0000001D4h]
    sub esp, 000000254h
    mov eax, dword ptr [g_101A50D0]
    mov dword ptr [ebp + 0000001D0h], eax
    xor eax, eax
    mov dword ptr [ebp - 72], eax
    mov dword ptr [ebp - 76], eax
    mov dword ptr [ebp - 96], eax
    mov eax, dword ptr [ebp + 0000001E0h]
    push ebx
    mov bl, byte ptr [eax]
    xor ecx, ecx
    test bl, bl
    je L87
    push esi
    push edi
    mov edi, eax
    jmp L1
L0:
    mov ecx, dword ptr [ebp - 112]
L1:
    inc edi
    cmp dword ptr [ebp - 76], 0
    mov dword ptr [ebp + 0000001E0h], edi
    jl L86
    cmp bl, 32
    jl L2
    cmp bl, 120
    jg L2
    movsx eax, bl
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
    mov dword ptr [ebp - 112], eax
    ja L85
    jmp dword ptr [eax*4 + 0x100facc0]
    xor eax, eax
    or dword ptr [ebp - 64], 0FFFFFFFFh
    mov dword ptr [ebp - 108], eax
    mov dword ptr [ebp - 100], eax
    mov dword ptr [ebp - 88], eax
    mov dword ptr [ebp - 84], eax
    mov dword ptr [ebp - 60], eax
    mov dword ptr [ebp - 92], eax
    jmp L85
    movsx eax, bl
    sub eax, 32
    je L7
    sub eax, 3
    je L6
    sub eax, 8
    je L5
    dec eax
    dec eax
    je L4
    sub eax, 3
    jne L85
    or dword ptr [ebp - 60], 8
    jmp L85
L4:
    or dword ptr [ebp - 60], 4
    jmp L85
L5:
    or dword ptr [ebp - 60], 1
    jmp L85
L6:
    or byte ptr [ebp - 60], 000000080h
    jmp L85
L7:
    or dword ptr [ebp - 60], 2
    jmp L85
    cmp bl, 42
    jne L8
    add dword ptr [ebp + 0000001E4h], 4
    mov eax, dword ptr [ebp + 0000001E4h]
    mov eax, dword ptr [eax - 4]
    test eax, eax
    mov dword ptr [ebp - 88], eax
    jge L85
    or dword ptr [ebp - 60], 4
    neg dword ptr [ebp - 88]
    jmp L85
L8:
    mov eax, dword ptr [ebp - 88]
    movsx ecx, bl
    lea eax, [eax + eax*4]
    lea eax, [ecx + eax*2 - 48]
    mov dword ptr [ebp - 88], eax
    jmp L85
    and dword ptr [ebp - 64], 0
    jmp L85
    cmp bl, 42
    jne L9
    add dword ptr [ebp + 0000001E4h], 4
    mov eax, dword ptr [ebp + 0000001E4h]
    mov eax, dword ptr [eax - 4]
    test eax, eax
    mov dword ptr [ebp - 64], eax
    jge L85
    or dword ptr [ebp - 64], 0FFFFFFFFh
    jmp L85
L9:
    mov eax, dword ptr [ebp - 64]
    movsx ecx, bl
    lea eax, [eax + eax*4]
    lea eax, [ecx + eax*2 - 48]
    mov dword ptr [ebp - 64], eax
    jmp L85
    cmp bl, 73
    je L12
    cmp bl, 104
    je L11
    cmp bl, 108
    je L10
    cmp bl, 119
    jne L85
    or byte ptr [ebp - 59], 8
    jmp L85
L10:
    or dword ptr [ebp - 60], 16
    jmp L85
L11:
    or dword ptr [ebp - 60], 32
    jmp L85
L12:
    mov al, byte ptr [edi]
    cmp al, 54
    jne L13
    cmp byte ptr [edi + 1], 52
    jne L13
    inc edi
    inc edi
    or byte ptr [ebp - 59], 000000080h
    mov dword ptr [ebp + 0000001E0h], edi
    jmp L85
L13:
    cmp al, 51
    jne L14
    cmp byte ptr [edi + 1], 50
    jne L14
    inc edi
    inc edi
    and byte ptr [ebp - 59], 127
    mov dword ptr [ebp + 0000001E0h], edi
    jmp L85
L14:
    cmp al, 100
    je L85
    cmp al, 105
    je L85
    cmp al, 111
    je L85
    cmp al, 117
    je L85
    cmp al, 120
    je L85
    cmp al, 88
    je L85
    and dword ptr [ebp - 112], 0
    mov ecx, dword ptr [g_101A5090]
    and dword ptr [ebp - 92], 0
    movzx eax, bl
    test byte ptr [ecx + eax*2 + 1], 000000080h
    je L15
    mov ecx, dword ptr [ebp + 0000001DCh]
    lea esi, [ebp - 76]
    mov al, bl
    call sub_100FA679
    mov bl, byte ptr [edi]
    inc edi
    mov dword ptr [ebp + 0000001E0h], edi
L15:
    mov ecx, dword ptr [ebp + 0000001DCh]
    lea esi, [ebp - 76]
    mov al, bl
    call sub_100FA692
    jmp L85
    movsx eax, bl
    cmp eax, 103
    jg L41
    cmp eax, 101
    jge L20
    cmp eax, 88
    jg L23
    je L51
    sub eax, 67
    je L21
    dec eax
    dec eax
    je L19
    dec eax
    dec eax
    je L19
    sub eax, 12
    jne L74
    test word ptr [ebp - 60], 000000830h
    jne L16
    or byte ptr [ebp - 59], 8
L16:
    mov ecx, dword ptr [ebp - 64]
    cmp ecx, -1
    jne L17
    mov ecx, 07FFFFFFFh
L17:
    add dword ptr [ebp + 0000001E4h], 4
    test word ptr [ebp - 60], 000000810h
    mov eax, dword ptr [ebp + 0000001E4h]
    mov eax, dword ptr [eax - 4]
    mov dword ptr [ebp - 68], eax
    je L45
    test eax, eax
    jne L18
    mov eax, dword ptr [g_101A4894]
    mov dword ptr [ebp - 68], eax
L18:
    mov eax, dword ptr [ebp - 68]
    mov dword ptr [ebp - 92], 1
    jmp L43
L19:
    mov dword ptr [ebp - 108], 1
    add bl, 32
L20:
    or dword ptr [ebp - 60], 64
    cmp dword ptr [ebp - 64], 0
    lea esi, [ebp - 56]
    mov dword ptr [ebp - 68], esi
    jge L32
    mov dword ptr [ebp - 64], 6
    jmp L36
L21:
    test word ptr [ebp - 60], 000000830h
    jne L22
    or byte ptr [ebp - 59], 8
L22:
    add dword ptr [ebp + 0000001E4h], 4
    test word ptr [ebp - 60], 000000810h
    mov eax, dword ptr [ebp + 0000001E4h]
    je L27
    movsx eax, word ptr [eax - 4]
    push eax
    lea eax, [ebp - 56]
    push eax
    call sub_10106ED5
    test eax, eax
    pop ecx
    pop ecx
    mov dword ptr [ebp - 72], eax
    jge L28
    mov dword ptr [ebp - 100], 1
    jmp L28
L23:
    sub eax, 90
    je L29
    sub eax, 9
    je L22
    dec eax
    jne L74
L24:
    or dword ptr [ebp - 60], 64
L25:
    mov dword ptr [ebp - 72], 10
L26:
    mov ebx, dword ptr [ebp - 60]
    mov esi, 000008000h
    test esi, ebx
    je L57
    mov ecx, dword ptr [ebp + 0000001E4h]
    mov eax, dword ptr [ecx]
    mov edx, dword ptr [ecx + 4]
    add ecx, 8
    mov dword ptr [ebp + 0000001E4h], ecx
    jmp L61
L27:
    mov al, byte ptr [eax - 4]
    mov byte ptr [ebp - 56], al
    mov dword ptr [ebp - 72], 1
L28:
    lea eax, [ebp - 56]
    mov dword ptr [ebp - 68], eax
    jmp L74
L29:
    add dword ptr [ebp + 0000001E4h], 4
    mov eax, dword ptr [ebp + 0000001E4h]
    mov eax, dword ptr [eax - 4]
    test eax, eax
    je L31
    mov ecx, dword ptr [eax + 4]
    test ecx, ecx
    je L31
    test byte ptr [ebp - 59], 8
    movsx eax, word ptr [eax]
    mov dword ptr [ebp - 68], ecx
    je L30
    cdq
    sub eax, edx
    sar eax, 1
    mov dword ptr [ebp - 92], 1
    jmp L73
L30:
    and dword ptr [ebp - 92], 0
    jmp L73
L31:
    mov eax, dword ptr [g_101A4890]
    mov dword ptr [ebp - 68], eax
    push eax
    jmp L40
L32:
    jne L33
    cmp bl, 103
    jne L36
    mov dword ptr [ebp - 64], 1
    jmp L36
L33:
    mov eax, 000000200h
    cmp dword ptr [ebp - 64], eax
    jle L34
    mov dword ptr [ebp - 64], eax
L34:
    mov edi, 0000000A3h
    cmp dword ptr [ebp - 64], edi
    jle L36
    mov eax, dword ptr [ebp - 64]
    add eax, 00000015Dh
    push eax
    call sub_100FC89F
    test eax, eax
    pop ecx
    mov dword ptr [ebp - 96], eax
    je L35
    mov dword ptr [ebp - 68], eax
    mov esi, eax
    jmp L36
L35:
    mov dword ptr [ebp - 64], edi
L36:
    mov eax, dword ptr [ebp + 0000001E4h]
    mov ecx, dword ptr [eax]
    push dword ptr [ebp - 108]
    add eax, 8
    push dword ptr [ebp - 64]
    mov dword ptr [ebp + 0000001E4h], eax
    mov eax, dword ptr [eax - 4]
    mov dword ptr [ebp - 124], eax
    movsx eax, bl
    push eax
    lea eax, [ebp - 000000080h]
    push esi
    push eax
    mov dword ptr [ebp - 000000080h], ecx
    call dword ptr [fp_101A4FB0]
    mov edi, dword ptr [ebp - 60]
    add esp, 20
    and edi, 000000080h
    je L37
    cmp dword ptr [ebp - 64], 0
    jne L37
    push esi
    call dword ptr [fp_101A4FBC]
    pop ecx
L37:
    cmp bl, 103
    jne L38
    test edi, edi
    jne L38
    push esi
    call dword ptr [fp_101A4FB4]
    pop ecx
L38:
    cmp byte ptr [esi], 45
    jne L39
    or byte ptr [ebp - 59], 1
    inc esi
    mov dword ptr [ebp - 68], esi
L39:
    push esi
L40:
    call sub_100FA6BC
    pop ecx
    jmp L73
L41:
    sub eax, 105
    je L24
    sub eax, 5
    je L54
    dec eax
    je L53
    dec eax
    je L50
    sub eax, 3
    je L16
    dec eax
    dec eax
    je L25
    sub eax, 3
    jne L74
    mov dword ptr [ebp - 104], 39
    jmp L52
L42:
    dec ecx
    cmp word ptr [eax], 0
    je L44
    inc eax
    inc eax
L43:
    test ecx, ecx
    jne L42
L44:
    sub eax, dword ptr [ebp - 68]
    sar eax, 1
    jmp L73
L45:
    test eax, eax
    jne L46
    mov eax, dword ptr [g_101A4890]
    mov dword ptr [ebp - 68], eax
L46:
    mov eax, dword ptr [ebp - 68]
    jmp L48
L47:
    dec ecx
    cmp byte ptr [eax], 0
    je L49
    inc eax
L48:
    test ecx, ecx
    jne L47
L49:
    sub eax, dword ptr [ebp - 68]
    jmp L73
L50:
    mov dword ptr [ebp - 64], 8
L51:
    mov dword ptr [ebp - 104], ecx
L52:
    test byte ptr [ebp - 60], 000000080h
    mov dword ptr [ebp - 72], 16
    je L26
    mov al, byte ptr [ebp - 104]
    add al, 81
    mov byte ptr [ebp - 80], 48
    mov byte ptr [ebp - 79], al
    mov dword ptr [ebp - 84], 2
    jmp L26
L53:
    test byte ptr [ebp - 60], 000000080h
    mov dword ptr [ebp - 72], 8
    je L26
    or byte ptr [ebp - 59], 2
    jmp L26
L54:
    add dword ptr [ebp + 0000001E4h], 4
    test byte ptr [ebp - 60], 32
    mov eax, dword ptr [ebp + 0000001E4h]
    mov eax, dword ptr [eax - 4]
    je L55
    mov cx, word ptr [ebp - 76]
    mov word ptr [eax], cx
    jmp L56
L55:
    mov ecx, dword ptr [ebp - 76]
    mov dword ptr [eax], ecx
L56:
    mov dword ptr [ebp - 100], 1
    jmp L84
L57:
    add dword ptr [ebp + 0000001E4h], 4
    test bl, 32
    mov eax, dword ptr [ebp + 0000001E4h]
    je L60
    test bl, 64
    je L59
    movsx eax, word ptr [eax - 4]
L58:
    cdq
    jmp L61
L59:
    movzx eax, word ptr [eax - 4]
    jmp L58
L60:
    test bl, 64
    mov eax, dword ptr [eax - 4]
    jne L58
    xor edx, edx
L61:
    test bl, 64
    je L63
    test edx, edx
    jg L63
    jl L62
    test eax, eax
    jae L63
L62:
    neg eax
    adc edx, 0
    neg edx
    or byte ptr [ebp - 59], 1
L63:
    test dword ptr [ebp - 60], esi
    mov ebx, eax
    mov edi, edx
    jne L64
    xor edi, edi
L64:
    cmp dword ptr [ebp - 64], 0
    jge L65
    mov dword ptr [ebp - 64], 1
    jmp L66
L65:
    and dword ptr [ebp - 60], 0FFFFFFF7h
    mov eax, 000000200h
    cmp dword ptr [ebp - 64], eax
    jle L66
    mov dword ptr [ebp - 64], eax
L66:
    mov eax, ebx
    or eax, edi
    jne L67
    and dword ptr [ebp - 84], 0
L67:
    lea esi, [ebp + 0000001C7h]
L68:
    mov eax, dword ptr [ebp - 64]
    dec dword ptr [ebp - 64]
    test eax, eax
    jg L69
    mov eax, ebx
    or eax, edi
    je L71
L69:
    mov eax, dword ptr [ebp - 72]
    cdq
    push edx
    push eax
    push edi
    push ebx
    call sub_10107219
    add ecx, 48
    cmp ecx, 57
    mov dword ptr [ebp - 116], ebx
    mov ebx, eax
    mov edi, edx
    jle L70
    add ecx, dword ptr [ebp - 104]
L70:
    mov byte ptr [esi], cl
    dec esi
    jmp L68
L71:
    lea eax, [ebp + 0000001C7h]
    sub eax, esi
    inc esi
    test byte ptr [ebp - 59], 2
    mov dword ptr [ebp - 72], eax
    mov dword ptr [ebp - 68], esi
    je L74
    mov ecx, esi
    cmp byte ptr [ecx], 48
    jne L72
    test eax, eax
    jne L74
L72:
    dec dword ptr [ebp - 68]
    mov ecx, dword ptr [ebp - 68]
    mov byte ptr [ecx], 48
    inc eax
L73:
    mov dword ptr [ebp - 72], eax
L74:
    cmp dword ptr [ebp - 100], 0
    jne L84
    mov ebx, dword ptr [ebp - 60]
    test bl, 64
    je L78
    test bh, 1
    je L75
    mov byte ptr [ebp - 80], 45
    jmp L77
L75:
    test bl, 1
    je L76
    mov byte ptr [ebp - 80], 43
    jmp L77
L76:
    test bl, 2
    je L78
    mov byte ptr [ebp - 80], 32
L77:
    mov dword ptr [ebp - 84], 1
L78:
    mov esi, dword ptr [ebp - 88]
    sub esi, dword ptr [ebp - 84]
    sub esi, dword ptr [ebp - 72]
    test bl, 12
    jne L79
    push dword ptr [ebp + 0000001DCh]
    lea eax, [ebp - 76]
    push esi
    push 32
    call sub_100FAB60
    add esp, 12
L79:
    push dword ptr [ebp - 84]
    mov edi, dword ptr [ebp + 0000001DCh]
    lea eax, [ebp - 76]
    lea ecx, [ebp - 80]
    call sub_100FAB9B
    test bl, 8
    pop ecx
    je L80
    test bl, 4
    jne L80
    push edi
    push esi
    push 48
    lea eax, [ebp - 76]
    call sub_100FAB8E
    add esp, 12
L80:
    cmp dword ptr [ebp - 92], 0
    je L82
    cmp dword ptr [ebp - 72], 0
    jle L82
    mov eax, dword ptr [ebp - 72]
    mov ebx, dword ptr [ebp - 68]
    mov dword ptr [ebp - 116], eax
L81:
    dec dword ptr [ebp - 116]
    xor eax, eax
    mov ax, word ptr [ebx]
    push eax
    lea eax, [ebp + 0000001C8h]
    push eax
    call sub_101072DC
    inc ebx
    pop ecx
    inc ebx
    test eax, eax
    pop ecx
    jle L83
    mov edi, dword ptr [ebp + 0000001DCh]
    push eax
    lea eax, [ebp - 76]
    lea ecx, [ebp + 0000001C8h]
    call sub_100FABFC
    cmp dword ptr [ebp - 116], 0
    pop ecx
    jne L81
    jmp L83
L82:
    push dword ptr [ebp - 72]
    mov ecx, dword ptr [ebp - 68]
    lea eax, [ebp - 76]
    call sub_100FAC13
    pop ecx
L83:
    test byte ptr [ebp - 60], 4
    je L84
    push dword ptr [ebp + 0000001DCh]
    lea eax, [ebp - 76]
    push esi
    push 32
    call sub_100FAC07
    add esp, 12
L84:
    cmp dword ptr [ebp - 96], 0
    je L85
    push dword ptr [ebp - 96]
    call sub_100F8C7C
    and dword ptr [ebp - 96], 0
    pop ecx
L85:
    mov edi, dword ptr [ebp + 0000001E0h]
    mov bl, byte ptr [edi]
    test bl, bl
    jne L0
L86:
    pop edi
    pop esi
L87:
    mov ecx, dword ptr [ebp + 0000001D0h]
    mov eax, dword ptr [ebp - 76]
    pop ebx
    call sub_1010151F
    add ebp, 0000001D4h
    leave
    ret
__output ENDP
END
