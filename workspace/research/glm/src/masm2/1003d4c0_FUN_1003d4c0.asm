.686
.MODEL FLAT, C
EXTRN sub_1003D833:PROC
EXTRN sub_1003D838:PROC
EXTRN sub_1003D85B:PROC
EXTRN sub_1003D89A:PROC
EXTRN sub_1003D8E5:PROC
EXTRN sub_1003D8F3:PROC
EXTRN sub_1003D8F5:PROC
EXTRN sub_1003D95A:PROC
EXTRN sub_1003D9A5:PROC
EXTRN sub_1003D9B3:PROC
EXTRN sub_1003D9B6:PROC
EXTRN sub_1003DA71:PROC
EXTRN sub_1003DA7F:PROC
EXTRN sub_1003DA80:PROC
EXTRN sub_1003DB25:PROC
EXTRN sub_1003DB33:PROC
EXTRN sub_1003DB35:PROC
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
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_1072DDC8:DWORD:DWORD
EXTRN EXTRN g_1072DEDC:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_1003d4c0 PROC
    mov mov cl, byte ptr [esp + 8]
    movzx movzx eax, cl
    sub sub esp, 64
    sub sub eax, 0
    push push ebp
    mov mov ebp, dword ptr [esp + 72]
    je L11
    dec dec eax
    push push esi
    je L4
    dec dec eax
    jne sub_1003D85B
    fld fld dword ptr [g_1072DEDC]
    push push edi
    mov mov ecx, 16
    fchs fchs
    mov mov esi, 010191368h
    lea lea edi, [esp + 12]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    fstp fstp dword ptr [esp + 48]
    pop pop edi
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je L0
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je L1
    push push 010199768h
    push push 010193358h
    push push eax
    call sub_100F6D74
    mov mov ecx, dword ptr [g_10764584]
    push push ecx
    call sub_100F6CB8
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov edx, dword ptr [eax]
    push push ebp
    push push 11
    push push ebp
    push push eax
    call call dword ptr [edx + 010Ch]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne L2
    lea lea esp, [esp]
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je L3
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je L5
    push push 010199840h
    push push 010193358h
    push push eax
    call sub_100F6DCF
    mov mov ecx, dword ptr [g_10764584]
    push push ecx
    call sub_100F6D13
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
L2:
    mov mov edx, dword ptr [eax]
    push push 3
    push push 24
    push push ebp
    push push eax
    call call dword ptr [edx + 010Ch]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne L6
    lea lea esi, [ebp + 16]
    jmp L7
    lea lea ebx, [ebx]
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je L8
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je L9
    push push 0101997D0h
    push push 010193358h
    push push eax
    call sub_100F6E2F
    mov mov ecx, dword ptr [g_10764584]
    push push ecx
    call sub_100F6D73
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov edx, dword ptr [eax]
    lea lea ecx, [esp + 8]
    push push ecx
    push push esi
    push push eax
    call call dword ptr [edx + 0B0h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne L10
    mov mov dl, byte ptr [esp + 80]
    pop pop esi
    mov mov byte ptr [ebp + 010766715h], dl
    pop pop ebp
    add add esp, 64
    ret ret
    mov mov eax, dword ptr [g_1072DDC8]
    add add eax, 72
    lea lea ecx, [esp + 8]
    call sub_1005AE77
    mov mov dword ptr [esp + 56], 0
    mov mov dword ptr [esp + 60], 0
    mov mov dword ptr [esp + 64], 0
    nop nop
    mov mov eax, dword ptr [g_101CE7EC]
L6:
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je L12
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je sub_1003D833
    push push 0101998A0h
    push push 010193358h
    push push eax
    call sub_100F6EBF
    mov mov ecx, dword ptr [g_10764584]
    push push ecx
    call sub_100F6E03
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov edx, dword ptr [eax]
    push push 020000h
    push push 11
    push push ebp
    push push eax
    call call dword ptr [edx + 010Ch]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_1003D838
    jmp sub_1003D89A
    lea lea ebx, [ebx]
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
L7:
    je sub_1003D8E5
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je sub_1003D8F3
    push push 010199840h
    push push 010193358h
    push push eax
    call sub_100F6F1F
    mov mov ecx, dword ptr [g_10764584]
    push push ecx
    call sub_100F6E63
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov edx, dword ptr [eax]
    push push 3
    push push 24
    push push ebp
    push push eax
    call call dword ptr [edx + 010Ch]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_1003D8F5
L8:
    lea lea esi, [ebp + 16]
    jmp sub_1003D95A
    lea lea ebx, [ebx]
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je sub_1003D9A5
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je sub_1003D9B3
    push push 0101997D0h
    push push 010193358h
    push push eax
    call sub_100F6F7F
    mov mov ecx, dword ptr [g_10764584]
    push push ecx
    call sub_100F6EC3
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov edx, dword ptr [eax]
    lea lea ecx, [esp + 8]
    push push ecx
    push push esi
    push push eax
    call call dword ptr [edx + 0B0h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_1003D9B6
    mov mov dl, byte ptr [esp + 80]
    pop pop esi
    mov mov byte ptr [ebp + 010766715h], dl
    pop pop ebp
    add add esp, 64
    ret ret
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je sub_1003DA71
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
L11:
    je sub_1003DA7F
    push push 010199958h
    push push 010193358h
    push push eax
    call sub_100F6FE5
    mov mov ecx, dword ptr [g_10764584]
    push push ecx
    call sub_100F6F29
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov edx, dword ptr [eax]
    push push ebp
    push push 11
    push push ebp
    push push eax
    call call dword ptr [edx + 010Ch]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_1003DA80
    lea lea ebx, [ebx]
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je sub_1003DB25
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je sub_1003DB33
    push push 0101998F8h
    push push 010193358h
    push push eax
    call sub_100F703F
    mov mov ecx, dword ptr [g_10764584]
    push push ecx
    call sub_100F6F83
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov edx, dword ptr [eax]
    push push 0
    push push 24
    push push ebp
    push push eax
    call call dword ptr [edx + 010Ch]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_1003DB35
L12:
    mov mov al, byte ptr [esp + 76]
FUN_1003d4c0 ENDP
END
