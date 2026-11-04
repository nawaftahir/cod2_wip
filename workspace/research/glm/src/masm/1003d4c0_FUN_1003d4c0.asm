.686
.MODEL FLAT, C
EXTRN sub_1003D85B:PROC
EXTRN sub_1005AE77:PROC
EXTRN sub_100F6CB8:PROC
EXTRN sub_100F6D13:PROC
EXTRN sub_100F6D73:PROC
EXTRN sub_100F6D74:PROC
EXTRN sub_100F6DCF:PROC
EXTRN sub_100F6E03:PROC
EXTRN sub_100F6E2F:PROC
EXTRN sub_100F6E63:PROC
EXTRN sub_100F6EBF:PROC
EXTRN sub_100F6EC3:PROC
EXTRN sub_100F6F1F:PROC
EXTRN sub_100F6F29:PROC
EXTRN sub_100F6F7F:PROC
EXTRN sub_100F6F83:PROC
EXTRN sub_100F6FE5:PROC
EXTRN sub_100F703F:PROC
EXTRN g_101CE7EC:DWORD
EXTRN g_101D1BF8:DWORD
EXTRN g_1072DDC8:DWORD
EXTRN g_1072DEDC:DWORD
EXTRN g_10764584:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_1003d4c0 PROC
    mov cl, byte ptr [esp + 8]
    movzx eax, cl
    sub esp, 64
    sub eax, 0
    push ebp
    mov ebp, dword ptr [esp + 72]
    je L13
    dec eax
    push esi
    je L6
    dec eax
    jne sub_1003D85B
    fld dword ptr [g_1072DEDC]
    push edi
    mov ecx, 16
    fchs
    mov esi, 010191368h
    lea edi, [esp + 12]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    fstp dword ptr [esp + 48]
    pop edi
L0:
    mov eax, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L1
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L1
    push 010199768h
    push 010193358h
    push eax
    call sub_100F6D74
    mov ecx, dword ptr [g_10764584]
    push ecx
    call sub_100F6CB8
    add esp, 16
L1:
    mov eax, dword ptr [g_101D1BF8]
    mov edx, dword ptr [eax]
    push ebp
    push 11
    push ebp
    push eax
    call dword ptr [edx + 0x10c]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L0
    lea esp, [esp]
L2:
    mov eax, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L3
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L3
    push 010199840h
    push 010193358h
    push eax
    call sub_100F6DCF
    mov ecx, dword ptr [g_10764584]
    push ecx
    call sub_100F6D13
    add esp, 16
L3:
    mov eax, dword ptr [g_101D1BF8]
    mov edx, dword ptr [eax]
    push 3
    push 24
    push ebp
    push eax
    call dword ptr [edx + 0x10c]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L2
    lea esi, [ebp + 16]
    jmp L4
    lea ebx, [ebx]
L4:
    mov eax, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L5
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L5
    push 0101997D0h
    push 010193358h
    push eax
    call sub_100F6E2F
    mov ecx, dword ptr [g_10764584]
    push ecx
    call sub_100F6D73
    add esp, 16
L5:
    mov eax, dword ptr [g_101D1BF8]
    mov edx, dword ptr [eax]
    lea ecx, [esp + 8]
    push ecx
    push esi
    push eax
    call dword ptr [edx + 0xb0]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L4
    mov dl, byte ptr [esp + 80]
    pop esi
    mov byte ptr [ebp + 010766715h], dl
    pop ebp
    add esp, 64
    ret
L6:
    mov eax, dword ptr [g_1072DDC8]
    add eax, 72
    lea ecx, [esp + 8]
    call sub_1005AE77
    mov dword ptr [esp + 56], 0
    mov dword ptr [esp + 60], 0
    mov dword ptr [esp + 64], 0
    nop
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
    push 0101998A0h
    push 010193358h
    push eax
    call sub_100F6EBF
    mov ecx, dword ptr [g_10764584]
    push ecx
    call sub_100F6E03
    add esp, 16
L8:
    mov eax, dword ptr [g_101D1BF8]
    mov edx, dword ptr [eax]
    push 000020000h
    push 11
    push ebp
    push eax
    call dword ptr [edx + 0x10c]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L7
    jmp L9
    lea ebx, [ebx]
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
    push 010199840h
    push 010193358h
    push eax
    call sub_100F6F1F
    mov ecx, dword ptr [g_10764584]
    push ecx
    call sub_100F6E63
    add esp, 16
L10:
    mov eax, dword ptr [g_101D1BF8]
    mov edx, dword ptr [eax]
    push 3
    push 24
    push ebp
    push eax
    call dword ptr [edx + 0x10c]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L9
    lea esi, [ebp + 16]
    jmp L11
    lea ebx, [ebx]
L11:
    mov eax, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L12
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L12
    push 0101997D0h
    push 010193358h
    push eax
    call sub_100F6F7F
    mov ecx, dword ptr [g_10764584]
    push ecx
    call sub_100F6EC3
    add esp, 16
L12:
    mov eax, dword ptr [g_101D1BF8]
    mov edx, dword ptr [eax]
    lea ecx, [esp + 8]
    push ecx
    push esi
    push eax
    call dword ptr [edx + 0xb0]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L11
    mov dl, byte ptr [esp + 80]
    pop esi
    mov byte ptr [ebp + 010766715h], dl
    pop ebp
    add esp, 64
    ret
L13:
    mov eax, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L14
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L14
    push 010199958h
    push 010193358h
    push eax
    call sub_100F6FE5
    mov ecx, dword ptr [g_10764584]
    push ecx
    call sub_100F6F29
    add esp, 16
L14:
    mov eax, dword ptr [g_101D1BF8]
    mov edx, dword ptr [eax]
    push ebp
    push 11
    push ebp
    push eax
    call dword ptr [edx + 0x10c]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L13
    lea ebx, [ebx]
L15:
    mov eax, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L16
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L16
    push 0101998F8h
    push 010193358h
    push eax
    call sub_100F703F
    mov ecx, dword ptr [g_10764584]
    push ecx
    call sub_100F6F83
    add esp, 16
L16:
    mov eax, dword ptr [g_101D1BF8]
    mov edx, dword ptr [eax]
    push 0
    push 24
    push ebp
    push eax
    call dword ptr [edx + 0x10c]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L15
    mov al, byte ptr [esp + 76]
FUN_1003d4c0 ENDP
END
