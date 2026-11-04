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
EXTRN sub_1006A089:PROC
EXTRN sub_1006A0A4:PROC
EXTRN sub_1006A0B3:PROC
EXTRN sub_1006A0C1:PROC
EXTRN sub_1006A0C6:PROC
EXTRN sub_1006A0E9:PROC
EXTRN sub_1006A0EE:PROC
EXTRN sub_1006A0FE:PROC
EXTRN sub_1006A113:PROC
EXTRN sub_1006A148:PROC
EXTRN sub_1006A1C4:PROC
EXTRN sub_1006A1C9:PROC
EXTRN sub_1006A1CA:PROC
EXTRN sub_1006A1CF:PROC
EXTRN sub_1006A1DB:PROC
EXTRN sub_1006A1E4:PROC
EXTRN sub_1006A240:PROC
EXTRN sub_1006A24A:PROC
EXTRN sub_1006A25C:PROC
EXTRN sub_1006A2CD:PROC
EXTRN sub_1006A30E:PROC
EXTRN sub_1006A361:PROC
EXTRN sub_1006A367:PROC
EXTRN sub_1006A3FD:PROC
EXTRN sub_1006A401:PROC
EXTRN sub_1006A406:PROC
EXTRN sub_1006A485:PROC
EXTRN sub_1006A48B:PROC
EXTRN sub_1006A48F:PROC
EXTRN sub_1006A492:PROC
EXTRN sub_1006A4EC:PROC
EXTRN sub_1006A570:PROC
EXTRN sub_1006A579:PROC
EXTRN sub_1006A57A:PROC
EXTRN sub_1006A57F:PROC
EXTRN sub_1006A584:PROC
EXTRN sub_1006A589:PROC
EXTRN sub_1006A58E:PROC
EXTRN sub_1006A59A:PROC
EXTRN sub_1006A59F:PROC
EXTRN sub_1006A5D2:PROC
EXTRN sub_1006A5EA:PROC
EXTRN sub_1006A615:PROC
EXTRN sub_1006A61B:PROC
EXTRN sub_1006A633:PROC
EXTRN sub_1006A63D:PROC
EXTRN sub_1006A64A:PROC
EXTRN sub_1006A676:PROC
EXTRN sub_1006A67B:PROC
EXTRN sub_1006A680:PROC
EXTRN sub_1006A691:PROC
EXTRN sub_1006A6C8:PROC
EXTRN sub_1006A6E2:PROC
EXTRN sub_1006A703:PROC
EXTRN sub_1006A78D:PROC
EXTRN sub_1006A7BD:PROC
EXTRN sub_1006A7DB:PROC
EXTRN sub_1006A7EA:PROC
.CODE
FUN_1006990b PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 12
    push push esi
    mov mov esi, ecx
    mov mov eax, dword ptr [esi + 92]
    shl shl eax, 2
    push push edi
    mov mov edi, dword ptr [ebp + 8]
    xor xor edx, edx
    mov mov dword ptr [edi + 88], eax
    mov mov eax, dword ptr [edi + 48]
    inc inc edx
    xor xor ecx, ecx
    cmp cmp eax, 31
    mov mov dword ptr [ebp - 4], edx
    mov mov dword ptr [ebp - 8], ecx
    jne L0
    mov mov dword ptr [ebp - 4], 2
    cmp cmp dword ptr [esi + 120], ecx
    je L7
    cmp cmp eax, 26
    je L5
    cmp cmp eax, 25
    je L6
    cmp cmp eax, 28
    je L8
    cmp cmp eax, 30
    je L9
    cmp cmp eax, 20
    je L1
    cmp cmp eax, 21
    je L2
    cmp cmp eax, 22
    je L3
    cmp cmp eax, 23
L0:
    je L4
    cmp cmp eax, 24
    jne L10
    mov mov eax, dword ptr [edi + 72]
    cmp cmp eax, ecx
    je L11
    cmp cmp dword ptr [eax + 16], ecx
    jne L12
    push push 01010EFB0h
    push push 07EAh
    add add edi, 16
    push push edi
    push push dword ptr [esi]
    call sub_10067CC3
    add add esp, 16
    mov mov eax, 080004005h
    jmp sub_1006A113
    push push 01010EF60h
    push push 07E9h
    jmp L13
    push push ebx
    mov mov ebx, dword ptr [edi + 60]
    cmp cmp ebx, ecx
    je L17
    cmp cmp dword ptr [ebx + 4], 19
    jne L18
L1:
    inc inc dword ptr [ebp - 4]
    cmp cmp dword ptr [ebx + 16], -1
    jne L14
    mov mov dword ptr [ebp - 8], edx
    cmp cmp dword ptr [ebx + 20], ecx
L4:
    je L15
    push push 01010EF20h
    push push 07DEh
    lea lea eax, [edi + 16]
    push push eax
L6:
    push push dword ptr [esi]
L7:
    call sub_10067D18
    add add esp, 16
L9:
    mov mov dword ptr [esi + 76], 1
    mov mov ebx, dword ptr [ebx + 40]
    test test ebx, ebx
    je L23
    mov mov eax, dword ptr [esi + 56]
    cmp cmp eax, 4
    jl L20
    cmp cmp eax, 5
    jg L21
    cmp cmp dword ptr [ebx + 16], -1
    jne L19
    mov mov dword ptr [ebp - 8], 1
    cmp cmp dword ptr [ebx + 40], 0
L11:
    je L22
    push push 01010EED0h
    push push 07D9h
    lea lea eax, [edi + 16]
L13:
    push push eax
    push push dword ptr [esi]
    call sub_10067D5E
    add add esp, 16
    mov mov dword ptr [esi + 76], 1
    inc inc dword ptr [ebp - 4]
    jmp L24
    push push 01010EE78h
    push push 07D8h
    lea lea eax, [edi + 16]
    push push eax
    push push dword ptr [esi]
    call sub_10067D82
    add add esp, 16
    mov mov dword ptr [esi + 76], 1
    mov mov eax, dword ptr [edi + 64]
    test test eax, eax
    je L30
    cmp cmp dword ptr [eax + 4], 19
    jne L31
    mov mov eax, dword ptr [esi + 56]
    test test eax, eax
    jl L25
    cmp cmp eax, 1
    jle L26
    cmp cmp eax, 6
    jl L27
    cmp cmp eax, 10
    jg L28
    push push 01010EE44h
    push push 07E5h
    lea lea eax, [edi + 16]
    push push eax
    push push dword ptr [esi]
    call sub_10067DCC
    add add esp, 16
    mov mov dword ptr [esi + 76], 1
    mov mov ebx, dword ptr [edi + 64]
    inc inc dword ptr [ebp - 4]
    cmp cmp dword ptr [ebx + 16], -1
    jne L29
    mov mov dword ptr [ebp - 8], 1
    mov mov eax, dword ptr [ebx + 20]
    test test eax, eax
    je L32
    cmp cmp eax, 0D000000h
    je L33
    push push 01010EE14h
    push push 07E3h
    lea lea eax, [edi + 16]
    push push eax
    push push dword ptr [esi]
    call sub_10067E0C
    add add esp, 16
    mov mov dword ptr [esi + 76], 1
    cmp cmp dword ptr [ebx + 40], 0
    je L34
    push push 01010EDC8h
    push push 07E4h
    lea lea eax, [edi + 16]
    push push eax
    push push dword ptr [esi]
    call sub_10067E31
    add add esp, 16
    mov mov dword ptr [esi + 76], 1
    and and dword ptr [ebp + 8], 0
    lea lea eax, [edi + 68]
    mov mov ebx, eax
    mov mov ecx, dword ptr [ebx]
    test test ecx, ecx
    je L39
    mov mov eax, dword ptr [edi + 48]
    inc inc dword ptr [ebp - 4]
    cmp cmp eax, 81
    je L38
    cmp cmp eax, 48
    je L40
    cmp cmp eax, 47
    je L41
    cmp cmp dword ptr [ecx + 16], -1
    jne L35
L21:
    mov mov dword ptr [ebp - 8], 1
    mov mov eax, dword ptr [ecx + 40]
    test test eax, eax
    je L42
L22:
    cmp cmp dword ptr [eax + 16], -1
L23:
    jne L36
    mov mov dword ptr [ebp - 8], 1
    cmp cmp dword ptr [eax + 40], 0
    je L43
    push push 01010EED0h
    push push 07D9h
    lea lea eax, [edi + 16]
    push push eax
    push push dword ptr [esi]
    call sub_10067E9B
    add add esp, 16
    mov mov dword ptr [esi + 76], 1
    cmp cmp dword ptr [esi + 56], 0
    je L44
    inc inc dword ptr [ebp - 4]
    inc inc dword ptr [ebp + 8]
    add add ebx, 4
    cmp cmp dword ptr [ebp + 8], 4
    jb L37
    push push dword ptr [ebp - 4]
    mov mov ecx, esi
    call L16
    test test eax, eax
    jl sub_1006A30E
    mov mov eax, dword ptr [esi + 92]
    add add eax, dword ptr [ebp - 4]
    mov mov ebx, dword ptr [edi + 48]
    cmp cmp ebx, 3
    mov mov dword ptr [ebp - 12], eax
    jne L52
    mov mov eax, dword ptr [esi + 56]
    test test eax, eax
    jl L45
    cmp cmp eax, 5
    jle L46
    cmp cmp eax, 10
    jl L54
    cmp cmp eax, 14
    jg L55
    mov mov eax, dword ptr [edi + 72]
    mov mov ecx, dword ptr [eax + 20]
    mov mov edx, 07000000h
    cmp cmp ecx, edx
    push push 2
    pop pop ebx
    ja L50
    je L49
    test test ecx, ecx
    je L47
    cmp cmp ecx, 01000000h
    je L48
    mov mov edx, 02000000h
    cmp cmp ecx, edx
    je L48
    cmp cmp ecx, 03000000h
    je L58
    mov mov edx, 04000000h
    cmp cmp ecx, edx
    je L51
    cmp cmp ecx, 05000000h
    je L60
    cmp cmp ecx, 06000000h
    jne L61
    push push 01010ED94h
    push push 07DDh
    lea lea eax, [edi + 16]
    push push eax
    push push dword ptr [esi]
    call sub_10067F72
    add add esp, 16
    mov mov dword ptr [esi + 76], 1
    jmp L62
    mov mov dword ptr [eax + 20], 05000000h
    jmp L63
    mov mov dword ptr [eax + 20], 03000000h
    jmp L64
    and and dword ptr [eax + 20], 0
L30:
    jmp L65
    mov mov dword ptr [eax + 20], 01000000h
    jmp L66
    mov mov dword ptr [eax + 20], 08000000h
    jmp L67
    cmp cmp ecx, 08000000h
    je L68
    cmp cmp ecx, 09000000h
    je L56
    cmp cmp ecx, 0A000000h
    je L57
    mov mov edx, 0B000000h
    cmp cmp ecx, edx
    je L69
    cmp cmp ecx, 0C000000h
L33:
    je L70
    cmp cmp ecx, 0D000000h
    jmp L59
    mov mov dword ptr [eax + 20], 0C000000h
    jmp L71
    mov mov dword ptr [eax + 20], edx
    cmp cmp dword ptr [edi + 84], 0
    je L72
    or or ebx, 040000000h
    cmp cmp dword ptr [edi + 64], 0
    je sub_1006A089
    or or ebx, 010000000h
    mov mov eax, dword ptr [esi + 56]
    cmp cmp eax, 1
    jl sub_1006A0A4
    cmp cmp eax, 5
    jle sub_1006A0B3
    cmp cmp eax, 10
    jl sub_1006A0C1
    cmp cmp eax, 14
    jg sub_1006A0C6
    mov mov eax, dword ptr [ebp - 4]
    dec dec eax
    shl shl eax, 24
    or or ebx, eax
    mov mov eax, dword ptr [edi + 48]
    cmp cmp eax, 41
    je sub_1006A0E9
    cmp cmp eax, 45
    je sub_1006A0EE
    cmp cmp eax, 94
    jne sub_1006A0FE
    mov mov eax, dword ptr [edi + 56]
    and and eax, 7
    shl shl eax, 16
    or or ebx, eax
    mov mov eax, dword ptr [esi + 92]
    mov mov ecx, dword ptr [esi + 88]
    mov mov dword ptr [ecx + eax*4], ebx
    inc inc dword ptr [esi + 92]
    cmp cmp dword ptr [edi + 48], 31
    mov mov eax, dword ptr [esi + 92]
    jne sub_1006A148
    mov mov ecx, dword ptr [edi + 56]
    mov mov edx, dword ptr [esi + 88]
    or or ecx, 080000000h
    mov mov dword ptr [edx + eax*4], ecx
    inc inc dword ptr [esi + 92]
    mov mov eax, dword ptr [esi + 92]
    mov mov ecx, dword ptr [edi + 60]
    test test ecx, ecx
    je sub_1006A240
    cmp cmp dword ptr [ecx + 4], 19
    jne sub_1006A24A
    cmp cmp dword ptr [esi + 56], 0
    mov mov ebx, 0F0000h
    jne sub_1006A1C4
    cmp cmp dword ptr [ecx + 32], ebx
    jne sub_1006A1C9
    mov mov eax, dword ptr [edi + 48]
    cmp cmp eax, 21
    je sub_1006A1CA
    cmp cmp eax, 23
    je sub_1006A1CF
    cmp cmp eax, 24
    jne sub_1006A1DB
    mov mov dword ptr [ecx + 32], 030000h
    jmp sub_1006A1E4
    mov mov dword ptr [ecx + 32], 070000h
    mov mov edx, dword ptr [ecx + 16]
    mov mov eax, edx
    or or eax, -8
    and and edx, 24
    shl shl eax, 20
    or or eax, edx
    mov mov edx, dword ptr [edi + 52]
    and and edx, 0FF00000h
    shl shl eax, 8
L40:
    or or eax, edx
    mov mov edx, dword ptr [ecx + 24]
L41:
    and and edx, 07FFh
    or or eax, edx
    mov mov edx, dword ptr [ecx + 32]
    and and edx, ebx
    or or eax, edx
    cmp cmp dword ptr [ecx + 40], 0
    je sub_1006A25C
    or or eax, 02000h
    mov mov edx, dword ptr [esi + 92]
    mov mov ebx, dword ptr [esi + 88]
    mov mov dword ptr [ebx + edx*4], eax
    inc inc dword ptr [esi + 92]
    mov mov ecx, dword ptr [ecx + 40]
    test test ecx, ecx
    mov mov eax, dword ptr [esi + 92]
    je sub_1006A2CD
    mov mov edx, dword ptr [ecx + 16]
    mov mov ebx, edx
    or or ebx, -8
    shl shl ebx, 20
    and and edx, 24
    or or ebx, edx
    mov mov edx, dword ptr [ecx + 20]
    shl shl ebx, 8
    and and edx, 0F000000h
L44:
    or or ebx, edx
    mov mov edx, dword ptr [ecx + 24]
    mov mov ecx, dword ptr [ecx + 36]
    and and edx, 07FFh
    and and ecx, 0FF0000h
    or or ebx, edx
    or or ebx, ecx
    mov mov ecx, dword ptr [esi + 88]
    mov mov dword ptr [ecx + eax*4], ebx
    inc inc dword ptr [esi + 92]
    mov mov eax, dword ptr [esi + 92]
    mov mov ecx, dword ptr [edi + 64]
    test test ecx, ecx
    je sub_1006A361
    cmp cmp dword ptr [ecx + 4], 19
    jne sub_1006A367
    mov mov edx, dword ptr [ecx + 16]
    mov mov ebx, edx
    or or ebx, -8
    shl shl ebx, 20
    and and edx, 24
    or or ebx, edx
    mov mov edx, dword ptr [ecx + 20]
    shl shl ebx, 8
    and and edx, 0F000000h
    or or ebx, edx
    mov mov edx, dword ptr [ecx + 24]
    mov mov ecx, dword ptr [ecx + 36]
    and and edx, 07FFh
    and and ecx, 0FF0000h
    or or ebx, edx
    or or ebx, ecx
    mov mov ecx, dword ptr [esi + 88]
    mov mov dword ptr [ecx + eax*4], ebx
    inc inc dword ptr [esi + 92]
    mov mov eax, dword ptr [esi + 92]
    mov mov ecx, dword ptr [edi + 48]
    cmp cmp ecx, 81
    jne sub_1006A3FD
    and and dword ptr [ebp + 8], 0
    lea lea ecx, [edi + 68]
    mov mov ebx, ecx
    mov mov ecx, dword ptr [ebx]
    test test ecx, ecx
    je sub_1006A59F
    mov mov edx, dword ptr [ecx + 16]
    cmp cmp edx, 5
    jl sub_1006A401
    cmp cmp edx, 8
    jg sub_1006A406
    fld fld qword ptr [ecx + 24]
    mov mov ecx, dword ptr [esi + 88]
    fstp fstp dword ptr [ebp - 4]
    mov mov edx, dword ptr [ebp - 4]
    mov mov dword ptr [ecx + eax*4], edx
    inc inc dword ptr [esi + 92]
    inc inc dword ptr [ebp + 8]
    mov mov eax, dword ptr [esi + 92]
    add add ebx, 4
    cmp cmp dword ptr [ebp + 8], 4
    jb sub_1006A401
    jmp sub_1006A5D2
    cmp cmp ecx, 48
    jne sub_1006A48B
    and and dword ptr [ebp + 8], 0
    lea lea ecx, [edi + 68]
    mov mov ebx, ecx
    mov mov ecx, dword ptr [ebx]
    test test ecx, ecx
    je sub_1006A5EA
    mov mov edx, dword ptr [ecx + 16]
    dec dec edx
    dec dec edx
    je sub_1006A485
    dec dec edx
    dec dec edx
    jne sub_1006A492
    mov mov edx, dword ptr [esi + 88]
    mov mov ecx, dword ptr [ecx + 24]
    mov mov dword ptr [edx + eax*4], ecx
    inc inc dword ptr [esi + 92]
    inc inc dword ptr [ebp + 8]
    mov mov eax, dword ptr [esi + 92]
    add add ebx, 4
    cmp cmp dword ptr [ebp + 8], 4
    jb sub_1006A48F
    jmp sub_1006A615
    cmp cmp ecx, 47
    jne sub_1006A4EC
    mov mov ecx, dword ptr [edi + 68]
    xor xor edx, edx
    cmp cmp dword ptr [ecx + 24], edx
    mov mov ecx, dword ptr [esi + 88]
    setne setne dl
    mov mov dword ptr [ecx + eax*4], edx
    inc inc dword ptr [esi + 92]
    jmp sub_1006A633
    and and dword ptr [ebp + 8], 0
    lea lea eax, [edi + 68]
    mov mov dword ptr [ebp - 4], eax
    mov mov eax, dword ptr [ebp - 4]
    mov mov eax, dword ptr [eax]
    test test eax, eax
    je sub_1006A64A
    cmp cmp dword ptr [esi + 56], 0
    jne sub_1006A570
    cmp cmp dword ptr [eax + 36], 0E40000h
    jne sub_1006A579
    mov mov ecx, dword ptr [edi + 48]
    cmp cmp ecx, 6
    je sub_1006A57A
    cmp cmp ecx, 7
    je sub_1006A57F
    cmp cmp ecx, 14
    je sub_1006A584
    cmp cmp ecx, 78
    je sub_1006A589
    cmp cmp ecx, 15
    je sub_1006A58E
    cmp cmp ecx, 79
    jne sub_1006A59A
    mov mov dword ptr [eax + 36], 0FF0000h
    mov mov edx, dword ptr [eax + 16]
    mov mov ecx, edx
    or or ecx, -8
    and and edx, 24
    shl shl ecx, 20
L53:
    or or ecx, edx
    mov mov edx, dword ptr [eax + 20]
    and and edx, 0F000000h
    shl shl ecx, 8
    or or ecx, edx
    mov mov edx, dword ptr [eax + 24]
    and and edx, 07FFh
    or or ecx, edx
    mov mov edx, dword ptr [eax + 36]
    and and edx, 0FF0000h
    or or ecx, edx
    cmp cmp dword ptr [eax + 40], 0
    je sub_1006A61B
    or or ecx, 02000h
    mov mov edx, dword ptr [esi + 92]
    mov mov ebx, dword ptr [esi + 88]
    mov mov dword ptr [ebx + edx*4], ecx
    inc inc dword ptr [esi + 92]
    mov mov eax, dword ptr [eax + 40]
    mov mov edx, dword ptr [esi + 92]
    xor xor ecx, ecx
    cmp cmp eax, ecx
L57:
    je sub_1006A6C8
    cmp cmp dword ptr [esi + 56], ecx
    jne sub_1006A691
    cmp cmp dword ptr [eax + 16], 3
    jne sub_1006A676
    cmp cmp dword ptr [eax + 20], ecx
    jne sub_1006A67B
    cmp cmp dword ptr [eax + 24], ecx
    jne sub_1006A680
    cmp cmp dword ptr [eax + 36], ecx
    je sub_1006A6E2
    push push 01010ED54h
    push push 07D7h
    lea lea eax, [edi + 16]
    push push eax
    push push dword ptr [esi]
    call sub_10068310
    add add esp, 16
    mov mov dword ptr [esi + 76], 1
    jmp sub_1006A703
    mov mov ecx, dword ptr [eax + 16]
    mov mov ebx, ecx
    or or ebx, -8
    shl shl ebx, 20
    and and ecx, 24
    or or ebx, ecx
    mov mov ecx, dword ptr [eax + 20]
    shl shl ebx, 8
    and and ecx, 0F000000h
    or or ebx, ecx
L64:
    mov mov ecx, dword ptr [eax + 24]
    mov mov eax, dword ptr [eax + 36]
L65:
    and and ecx, 07FFh
    and and eax, 0FF0000h
    or or ebx, ecx
    or or ebx, eax
    mov mov eax, dword ptr [esi + 88]
L67:
    mov mov dword ptr [eax + edx*4], ebx
    inc inc dword ptr [esi + 92]
    inc inc dword ptr [ebp + 8]
    add add dword ptr [ebp - 4], 4
    cmp cmp dword ptr [ebp + 8], 4
    jb sub_1006A63D
    mov mov eax, dword ptr [esi + 92]
    cmp cmp eax, dword ptr [ebp - 12]
    je sub_1006A78D
    push push 01010ED28h
    push push 0
L70:
    lea lea eax, [edi + 16]
    push push eax
    push push dword ptr [esi]
    call sub_10068383
    add add esp, 16
    mov mov dword ptr [esi + 76], 1
    cmp cmp dword ptr [ebp - 8], 0
    je sub_1006A7BD
    mov mov eax, dword ptr [esi + 92]
    mov mov dword ptr [esi + 100], eax
    jmp sub_1006A7DB
    add add edi, 16
    push push edi
    mov mov ecx, esi
    call L53
    test test eax, eax
    jge sub_1006A7EA
    mov mov dword ptr [esi + 80], 1
    xor xor eax, eax
    pop pop ebx
    pop pop edi
    pop pop esi
    leave leave
    ret ret 4
FUN_1006990b ENDP
END
