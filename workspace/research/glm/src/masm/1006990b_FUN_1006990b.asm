.686
.MODEL FLAT, C
EXTRN sub_10067CC3:PROC
EXTRN sub_10067D18:PROC
EXTRN sub_10067D5E:PROC
EXTRN sub_10067D82:PROC
EXTRN sub_10067DCC:PROC
EXTRN sub_10067E0C:PROC
EXTRN sub_10067E31:PROC
EXTRN sub_10067E9B:PROC
EXTRN sub_10067F72:PROC
EXTRN sub_10068310:PROC
EXTRN sub_10068383:PROC
EXTRN sub_10069AD7:PROC
EXTRN sub_10069F64:PROC
.CODE
FUN_1006990b PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 12
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 92]
    shl eax, 2
    push edi
    mov edi, dword ptr [ebp + 8]
    xor edx, edx
    mov dword ptr [edi + 88], eax
    mov eax, dword ptr [edi + 48]
    inc edx
    xor ecx, ecx
    cmp eax, 31
    mov dword ptr [ebp - 4], edx
    mov dword ptr [ebp - 8], ecx
    jne L0
    mov dword ptr [ebp - 4], 2
L0:
    cmp dword ptr [esi + 120], ecx
    je L4
    cmp eax, 26
    je L3
    cmp eax, 25
    je L3
    cmp eax, 28
    je L3
    cmp eax, 30
    je L3
    cmp eax, 20
    je L1
    cmp eax, 21
    je L1
    cmp eax, 22
    je L1
    cmp eax, 23
    je L1
    cmp eax, 24
    jne L4
L1:
    mov eax, dword ptr [edi + 72]
    cmp eax, ecx
    je L4
    cmp dword ptr [eax + 16], ecx
    jne L4
    push 01010EFB0h
    push 0000007EAh
L2:
    add edi, 16
    push edi
    push dword ptr [esi]
    call sub_10067CC3
    add esp, 16
    mov eax, 080004005h
    jmp L69
L3:
    push 01010EF60h
    push 0000007E9h
    jmp L2
L4:
    push ebx
    mov ebx, dword ptr [edi + 60]
    cmp ebx, ecx
    je L10
    cmp dword ptr [ebx + 4], 19
    jne L10
    inc dword ptr [ebp - 4]
    cmp dword ptr [ebx + 16], -1
    jne L5
    mov dword ptr [ebp - 8], edx
L5:
    cmp dword ptr [ebx + 20], ecx
    je L6
    push 01010EF20h
    push 0000007DEh
    lea eax, [edi + 16]
    push eax
    push dword ptr [esi]
    call sub_10067D18
    add esp, 16
    mov dword ptr [esi + 76], 1
L6:
    mov ebx, dword ptr [ebx + 40]
    test ebx, ebx
    je L10
    mov eax, dword ptr [esi + 56]
    cmp eax, 4
    jl L9
    cmp eax, 5
    jg L9
    cmp dword ptr [ebx + 16], -1
    jne L7
    mov dword ptr [ebp - 8], 1
L7:
    cmp dword ptr [ebx + 40], 0
    je L8
    push 01010EED0h
    push 0000007D9h
    lea eax, [edi + 16]
    push eax
    push dword ptr [esi]
    call sub_10067D5E
    add esp, 16
    mov dword ptr [esi + 76], 1
L8:
    inc dword ptr [ebp - 4]
    jmp L10
L9:
    push 01010EE78h
    push 0000007D8h
    lea eax, [edi + 16]
    push eax
    push dword ptr [esi]
    call sub_10067D82
    add esp, 16
    mov dword ptr [esi + 76], 1
L10:
    mov eax, dword ptr [edi + 64]
    test eax, eax
    je L16
    cmp dword ptr [eax + 4], 19
    jne L16
    mov eax, dword ptr [esi + 56]
    test eax, eax
    jl L11
    cmp eax, 1
    jle L12
L11:
    cmp eax, 6
    jl L13
    cmp eax, 10
    jg L13
L12:
    push 01010EE44h
    push 0000007E5h
    lea eax, [edi + 16]
    push eax
    push dword ptr [esi]
    call sub_10067DCC
    add esp, 16
    mov dword ptr [esi + 76], 1
L13:
    mov ebx, dword ptr [edi + 64]
    inc dword ptr [ebp - 4]
    cmp dword ptr [ebx + 16], -1
    jne L14
    mov dword ptr [ebp - 8], 1
L14:
    mov eax, dword ptr [ebx + 20]
    test eax, eax
    je L15
    cmp eax, 00D000000h
    je L15
    push 01010EE14h
    push 0000007E3h
    lea eax, [edi + 16]
    push eax
    push dword ptr [esi]
    call sub_10067E0C
    add esp, 16
    mov dword ptr [esi + 76], 1
L15:
    cmp dword ptr [ebx + 40], 0
    je L16
    push 01010EDC8h
    push 0000007E4h
    lea eax, [edi + 16]
    push eax
    push dword ptr [esi]
    call sub_10067E31
    add esp, 16
    mov dword ptr [esi + 76], 1
L16:
    and dword ptr [ebp + 8], 0
    lea eax, [edi + 68]
    mov ebx, eax
L17:
    mov ecx, dword ptr [ebx]
    test ecx, ecx
    je L22
    mov eax, dword ptr [edi + 48]
    inc dword ptr [ebp - 4]
    cmp eax, 81
    je L21
    cmp eax, 48
    je L21
    cmp eax, 47
    je L21
    cmp dword ptr [ecx + 16], -1
    jne L18
    mov dword ptr [ebp - 8], 1
L18:
    mov eax, dword ptr [ecx + 40]
    test eax, eax
    je L21
    cmp dword ptr [eax + 16], -1
    jne L19
    mov dword ptr [ebp - 8], 1
L19:
    cmp dword ptr [eax + 40], 0
    je L20
    push 01010EED0h
    push 0000007D9h
    lea eax, [edi + 16]
    push eax
    push dword ptr [esi]
    call sub_10067E9B
    add esp, 16
    mov dword ptr [esi + 76], 1
L20:
    cmp dword ptr [esi + 56], 0
    je L21
    inc dword ptr [ebp - 4]
L21:
    inc dword ptr [ebp + 8]
    add ebx, 4
    cmp dword ptr [ebp + 8], 4
    jb L17
L22:
    push dword ptr [ebp - 4]
    mov ecx, esi
    call sub_10069AD7
    test eax, eax
    jl L68
    mov eax, dword ptr [esi + 92]
    add eax, dword ptr [ebp - 4]
    mov ebx, dword ptr [edi + 48]
    cmp ebx, 3
    mov dword ptr [ebp - 12], eax
    jne L35
    mov eax, dword ptr [esi + 56]
    test eax, eax
    jl L23
    cmp eax, 5
    jle L24
L23:
    cmp eax, 10
    jl L35
    cmp eax, 14
    jg L35
L24:
    mov eax, dword ptr [edi + 72]
    mov ecx, dword ptr [eax + 20]
    mov edx, 007000000h
    cmp ecx, edx
    push 2
    pop ebx
    ja L32
    je L31
    test ecx, ecx
    je L30
    cmp ecx, 001000000h
    je L29
    mov edx, 002000000h
    cmp ecx, edx
    je L28
    cmp ecx, 003000000h
    je L34
    mov edx, 004000000h
    cmp ecx, edx
    je L27
    cmp ecx, 005000000h
    je L34
    cmp ecx, 006000000h
L25:
    jne L35
L26:
    push 01010ED94h
    push 0000007DDh
    lea eax, [edi + 16]
    push eax
    push dword ptr [esi]
    call sub_10067F72
    add esp, 16
    mov dword ptr [esi + 76], 1
    jmp L35
L27:
    mov dword ptr [eax + 20], 005000000h
    jmp L35
L28:
    mov dword ptr [eax + 20], 003000000h
    jmp L35
L29:
    and dword ptr [eax + 20], 0
    jmp L35
L30:
    mov dword ptr [eax + 20], 001000000h
    jmp L35
L31:
    mov dword ptr [eax + 20], 008000000h
    jmp L35
L32:
    cmp ecx, 008000000h
    je L34
    cmp ecx, 009000000h
    je L26
    cmp ecx, 00A000000h
    je L26
    mov edx, 00B000000h
    cmp ecx, edx
    je L33
    cmp ecx, 00C000000h
    je L34
    cmp ecx, 00D000000h
    jmp L25
L33:
    mov dword ptr [eax + 20], 00C000000h
    jmp L35
L34:
    mov dword ptr [eax + 20], edx
L35:
    cmp dword ptr [edi + 84], 0
    je L36
    or ebx, 040000000h
L36:
    cmp dword ptr [edi + 64], 0
    je L37
    or ebx, 010000000h
L37:
    mov eax, dword ptr [esi + 56]
    cmp eax, 1
    jl L38
    cmp eax, 5
    jle L39
L38:
    cmp eax, 10
    jl L40
    cmp eax, 14
    jg L40
L39:
    mov eax, dword ptr [ebp - 4]
    dec eax
    shl eax, 24
    or ebx, eax
L40:
    mov eax, dword ptr [edi + 48]
    cmp eax, 41
    je L41
    cmp eax, 45
    je L41
    cmp eax, 94
    jne L42
L41:
    mov eax, dword ptr [edi + 56]
    and eax, 7
    shl eax, 16
    or ebx, eax
L42:
    mov eax, dword ptr [esi + 92]
    mov ecx, dword ptr [esi + 88]
    mov dword ptr [ecx + eax*4], ebx
    inc dword ptr [esi + 92]
    cmp dword ptr [edi + 48], 31
    mov eax, dword ptr [esi + 92]
    jne L43
    mov ecx, dword ptr [edi + 56]
    mov edx, dword ptr [esi + 88]
    or ecx, 080000000h
    mov dword ptr [edx + eax*4], ecx
    inc dword ptr [esi + 92]
    mov eax, dword ptr [esi + 92]
L43:
    mov ecx, dword ptr [edi + 60]
    test ecx, ecx
    je L47
    cmp dword ptr [ecx + 4], 19
    jne L47
    cmp dword ptr [esi + 56], 0
    mov ebx, 0000F0000h
    jne L45
    cmp dword ptr [ecx + 32], ebx
    jne L45
    mov eax, dword ptr [edi + 48]
    cmp eax, 21
    je L44
    cmp eax, 23
    je L44
    cmp eax, 24
    jne L45
    mov dword ptr [ecx + 32], 000030000h
    jmp L45
L44:
    mov dword ptr [ecx + 32], 000070000h
L45:
    mov edx, dword ptr [ecx + 16]
    mov eax, edx
    or eax, 0FFFFFFF8h
    and edx, 24
    shl eax, 20
    or eax, edx
    mov edx, dword ptr [edi + 52]
    and edx, 00FF00000h
    shl eax, 8
    or eax, edx
    mov edx, dword ptr [ecx + 24]
    and edx, 0000007FFh
    or eax, edx
    mov edx, dword ptr [ecx + 32]
    and edx, ebx
    or eax, edx
    cmp dword ptr [ecx + 40], 0
    je L46
    or eax, 000002000h
L46:
    mov edx, dword ptr [esi + 92]
    mov ebx, dword ptr [esi + 88]
    mov dword ptr [ebx + edx*4], eax
    inc dword ptr [esi + 92]
    mov ecx, dword ptr [ecx + 40]
    test ecx, ecx
    mov eax, dword ptr [esi + 92]
    je L47
    mov edx, dword ptr [ecx + 16]
    mov ebx, edx
    or ebx, 0FFFFFFF8h
    shl ebx, 20
    and edx, 24
    or ebx, edx
    mov edx, dword ptr [ecx + 20]
    shl ebx, 8
    and edx, 00F000000h
    or ebx, edx
    mov edx, dword ptr [ecx + 24]
    mov ecx, dword ptr [ecx + 36]
    and edx, 0000007FFh
    and ecx, 000FF0000h
    or ebx, edx
    or ebx, ecx
    mov ecx, dword ptr [esi + 88]
    mov dword ptr [ecx + eax*4], ebx
    inc dword ptr [esi + 92]
    mov eax, dword ptr [esi + 92]
L47:
    mov ecx, dword ptr [edi + 64]
    test ecx, ecx
    je L48
    cmp dword ptr [ecx + 4], 19
    jne L48
    mov edx, dword ptr [ecx + 16]
    mov ebx, edx
    or ebx, 0FFFFFFF8h
    shl ebx, 20
    and edx, 24
    or ebx, edx
    mov edx, dword ptr [ecx + 20]
    shl ebx, 8
    and edx, 00F000000h
    or ebx, edx
    mov edx, dword ptr [ecx + 24]
    mov ecx, dword ptr [ecx + 36]
    and edx, 0000007FFh
    and ecx, 000FF0000h
    or ebx, edx
    or ebx, ecx
    mov ecx, dword ptr [esi + 88]
    mov dword ptr [ecx + eax*4], ebx
    inc dword ptr [esi + 92]
    mov eax, dword ptr [esi + 92]
L48:
    mov ecx, dword ptr [edi + 48]
    cmp ecx, 81
    jne L51
    and dword ptr [ebp + 8], 0
    lea ecx, [edi + 68]
    mov ebx, ecx
L49:
    mov ecx, dword ptr [ebx]
    test ecx, ecx
    je L64
    mov edx, dword ptr [ecx + 16]
    cmp edx, 5
    jl L50
    cmp edx, 8
    jg L50
    fld qword ptr [ecx + 24]
    mov ecx, dword ptr [esi + 88]
    fstp dword ptr [ebp - 4]
    mov edx, dword ptr [ebp - 4]
    mov dword ptr [ecx + eax*4], edx
L50:
    inc dword ptr [esi + 92]
    inc dword ptr [ebp + 8]
    mov eax, dword ptr [esi + 92]
    add ebx, 4
    cmp dword ptr [ebp + 8], 4
    jb L49
    jmp L64
L51:
    cmp ecx, 48
    jne L55
    and dword ptr [ebp + 8], 0
    lea ecx, [edi + 68]
    mov ebx, ecx
L52:
    mov ecx, dword ptr [ebx]
    test ecx, ecx
    je L64
    mov edx, dword ptr [ecx + 16]
    dec edx
    dec edx
    je L53
    dec edx
    dec edx
    jne L54
L53:
    mov edx, dword ptr [esi + 88]
    mov ecx, dword ptr [ecx + 24]
    mov dword ptr [edx + eax*4], ecx
L54:
    inc dword ptr [esi + 92]
    inc dword ptr [ebp + 8]
    mov eax, dword ptr [esi + 92]
    add ebx, 4
    cmp dword ptr [ebp + 8], 4
    jb L52
    jmp L64
L55:
    cmp ecx, 47
    jne L56
    mov ecx, dword ptr [edi + 68]
    xor edx, edx
    cmp dword ptr [ecx + 24], edx
    mov ecx, dword ptr [esi + 88]
    setne dl
    mov dword ptr [ecx + eax*4], edx
    inc dword ptr [esi + 92]
    jmp L64
L56:
    and dword ptr [ebp + 8], 0
    lea eax, [edi + 68]
    mov dword ptr [ebp - 4], eax
L57:
    mov eax, dword ptr [ebp - 4]
    mov eax, dword ptr [eax]
    test eax, eax
    je L64
    cmp dword ptr [esi + 56], 0
    jne L59
    cmp dword ptr [eax + 36], 000E40000h
    jne L59
    mov ecx, dword ptr [edi + 48]
    cmp ecx, 6
    je L58
    cmp ecx, 7
    je L58
    cmp ecx, 14
    je L58
    cmp ecx, 78
    je L58
    cmp ecx, 15
    je L58
    cmp ecx, 79
    jne L59
L58:
    mov dword ptr [eax + 36], 000FF0000h
L59:
    mov edx, dword ptr [eax + 16]
    mov ecx, edx
    or ecx, 0FFFFFFF8h
    and edx, 24
    shl ecx, 20
    or ecx, edx
    mov edx, dword ptr [eax + 20]
    and edx, 00F000000h
    shl ecx, 8
    or ecx, edx
    mov edx, dword ptr [eax + 24]
    and edx, 0000007FFh
    or ecx, edx
    mov edx, dword ptr [eax + 36]
    and edx, 000FF0000h
    or ecx, edx
    cmp dword ptr [eax + 40], 0
    je L60
    or ecx, 000002000h
L60:
    mov edx, dword ptr [esi + 92]
    mov ebx, dword ptr [esi + 88]
    mov dword ptr [ebx + edx*4], ecx
    inc dword ptr [esi + 92]
    mov eax, dword ptr [eax + 40]
    mov edx, dword ptr [esi + 92]
    xor ecx, ecx
    cmp eax, ecx
    je L63
    cmp dword ptr [esi + 56], ecx
    jne L62
    cmp dword ptr [eax + 16], 3
    jne L61
    cmp dword ptr [eax + 20], ecx
    jne L61
    cmp dword ptr [eax + 24], ecx
    jne L61
    cmp dword ptr [eax + 36], ecx
    je L63
L61:
    push 01010ED54h
    push 0000007D7h
    lea eax, [edi + 16]
    push eax
    push dword ptr [esi]
    call sub_10068310
    add esp, 16
    mov dword ptr [esi + 76], 1
    jmp L63
L62:
    mov ecx, dword ptr [eax + 16]
    mov ebx, ecx
    or ebx, 0FFFFFFF8h
    shl ebx, 20
    and ecx, 24
    or ebx, ecx
    mov ecx, dword ptr [eax + 20]
    shl ebx, 8
    and ecx, 00F000000h
    or ebx, ecx
    mov ecx, dword ptr [eax + 24]
    mov eax, dword ptr [eax + 36]
    and ecx, 0000007FFh
    and eax, 000FF0000h
    or ebx, ecx
    or ebx, eax
    mov eax, dword ptr [esi + 88]
    mov dword ptr [eax + edx*4], ebx
    inc dword ptr [esi + 92]
L63:
    inc dword ptr [ebp + 8]
    add dword ptr [ebp - 4], 4
    cmp dword ptr [ebp + 8], 4
    jb L57
L64:
    mov eax, dword ptr [esi + 92]
    cmp eax, dword ptr [ebp - 12]
    je L65
    push 01010ED28h
    push 0
    lea eax, [edi + 16]
    push eax
    push dword ptr [esi]
    call sub_10068383
    add esp, 16
    mov dword ptr [esi + 76], 1
L65:
    cmp dword ptr [ebp - 8], 0
    je L66
    mov eax, dword ptr [esi + 92]
    mov dword ptr [esi + 100], eax
    jmp L67
L66:
    add edi, 16
    push edi
    mov ecx, esi
    call sub_10069F64
    test eax, eax
    jge L67
    mov dword ptr [esi + 80], 1
L67:
    xor eax, eax
L68:
    pop ebx
L69:
    pop edi
    pop esi
    leave
    ret 4
FUN_1006990b ENDP
END
