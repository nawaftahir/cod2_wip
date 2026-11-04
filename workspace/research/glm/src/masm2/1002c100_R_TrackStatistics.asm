.686
.MODEL FLAT, C
EXTRN sub_1002C34F:PROC
EXTRN sub_1002C35B:PROC
EXTRN sub_1002C38C:PROC
EXTRN sub_1002C38D:PROC
EXTRN sub_1002C395:PROC
EXTRN sub_1002C3A7:PROC
EXTRN sub_1002C3AC:PROC
EXTRN sub_1002C3B8:PROC
EXTRN sub_1002C3DE:PROC
EXTRN sub_1002C42C:PROC
EXTRN sub_1002C42E:PROC
EXTRN sub_1002C44B:PROC
EXTRN sub_1002C47B:PROC
EXTRN sub_1002C485:PROC
EXTRN sub_1002C4C1:PROC
EXTRN sub_1002C4E7:PROC
EXTRN sub_100F5EE0:PROC
EXTRN sub_100F5F26:PROC
EXTRN sub_100F5F7E:PROC
EXTRN sub_100F5FC8:PROC
EXTRN EXTRN fp_101D4B2C:DWORD:DWORD
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_1019BDBC:DWORD:DWORD
EXTRN EXTRN g_101A5C68:DWORD:DWORD
.CODE
R_TrackStatistics PROC
    sub sub esp, 48
    mov mov ecx, dword ptr [esp + 56]
    fld fld dword ptr [ecx]
    mov mov eax, dword ptr [esp + 52]
    fmul fmul dword ptr [g_1019BDBC]
    push push 0F83FFF7h
    push push 0
    push push 010191348h
    fadd fadd dword ptr [eax]
    push push 010191348h
    lea lea edx, [esp + 28]
    fstp fstp dword ptr [esp + 16]
    fld fld dword ptr [ecx + 4]
    fmul fmul dword ptr [g_1019BDBC]
    fadd fadd dword ptr [eax + 4]
    fstp fstp dword ptr [esp + 20]
    fld fld dword ptr [ecx + 8]
    lea lea ecx, [esp + 16]
    fmul fmul dword ptr [g_1019BDBC]
    push push ecx
    push push eax
    push push edx
    fadd fadd dword ptr [eax + 8]
    fstp fstp dword ptr [esp + 36]
    call dword ptr [fp_101D4B2C]
    mov mov ax, word ptr [esp + 74]
    add add esp, 28
    test test ah, ah
    jne sub_1002C38D
    test test al, al
    jne sub_1002C395
    fld fld dword ptr [g_1019BC78]
    fld fld dword ptr [esp + 12]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp sub_1002C3AC
    mov mov eax, dword ptr [esp + 36]
    test test eax, eax
    je sub_1002C3B8
    mov mov edx, dword ptr [esp + 60]
    sub sub edx, eax
    lea lea esp, [esp]
    mov mov cl, byte ptr [eax]
    mov mov byte ptr [edx + eax], cl
    inc inc eax
    test test cl, cl
    jne L0
    mov mov eax, dword ptr [esp + 28]
    push push ebp
    mov mov ebp, dword ptr [esp + 76]
    push push esi
    mov mov esi, dword ptr [esp + 72]
    mov mov byte ptr [esi], cl
    push push edi
    mov mov edi, dword ptr [esp + 80]
    mov mov byte ptr [esi + ebp - 1], cl
    sar sar eax, 20
    and and eax, 31
    mov mov byte ptr [edi], cl
    mov mov byte ptr [edi + ebp - 1], cl
    jle L1
    cmp cmp eax, 23
    jge L2
    lea lea eax, [eax + eax*4]
    mov mov ecx, dword ptr [eax*4 + 0101A5A9Ch]
    push push ebp
    push push ecx
    jmp L3
    push push ebp
    push push 010197934h
    push push esi
    call sub_100F5EE0
    mov mov al, byte ptr [esi + ebp - 1]
    add add esp, 12
    test test al, al
    je L4
    pop pop edi
    pop pop esi
    xor xor eax, eax
    pop pop ebp
    add add esp, 48
    ret ret
    mov mov eax, esi
    lea lea edx, [eax + 1]
    lea lea esp, [esp]
    mov mov cl, byte ptr [eax]
    inc inc eax
    test test cl, cl
    jne L5
    sub sub eax, edx
    push push ebx
    mov mov ebx, eax
    test test byte ptr [esp + 48], 1
    push push ebp
    je sub_1002C34F
    push push 01019792Ch
    jmp sub_1002C35B
    push push 01019791Ch
    push push edi
    call sub_100F5F26
    mov mov al, byte ptr [edi + ebp - 1]
    add add esp, 12
    test test al, al
    je sub_1002C38C
    pop pop ebx
    pop pop edi
    pop pop esi
    xor xor eax, eax
    pop pop ebp
    add add esp, 48
L0:
    ret ret
    lea lea ecx, [edi + 1]
    mov mov edi, edi
    mov mov al, byte ptr [edi]
    inc inc edi
    test test al, al
    jne sub_1002C3A7
    mov mov eax, dword ptr [g_101A5C68]
    sub sub edi, ecx
    test test eax, eax
    je sub_1002C47B
    mov mov eax, 0101A5C68h
    mov mov dword ptr [esp + 72], eax
    nop nop
    mov mov edx, dword ptr [esp + 44]
    test test dword ptr [eax + 8], edx
    je sub_1002C42E
    mov mov byte ptr [ebx + esi], 32
    mov mov edx, dword ptr [eax]
    inc inc ebx
    mov mov ecx, ebp
    sub sub ecx, ebx
    push push ecx
    push push edx
    add add esi, ebx
    push push esi
    call sub_100F5F7E
    mov mov eax, dword ptr [esp + 92]
    mov mov cl, byte ptr [eax + ebp - 1]
    add add esp, 12
    test test cl, cl
    jne sub_1002C3DE
    mov mov eax, esi
    lea lea edx, [eax + 1]
    mov mov cl, byte ptr [eax]
    inc inc eax
    test test cl, cl
    jne sub_1002C44B
    mov mov esi, dword ptr [esp + 80]
    sub sub eax, edx
    add add ebx, eax
    mov mov eax, dword ptr [esp + 72]
L1:
    mov mov ecx, dword ptr [esp + 48]
    test test dword ptr [eax + 12], ecx
    je sub_1002C4C1
    mov mov ecx, dword ptr [esp + 84]
    mov mov byte ptr [edi + ecx], 32
    mov mov eax, dword ptr [eax]
    inc inc edi
    mov mov edx, ebp
    sub sub edx, edi
    push push edx
L3:
    lea lea esi, [edi + ecx]
    push push eax
    push push esi
    call sub_100F5FC8
    mov mov ecx, dword ptr [esp + 96]
    mov mov al, byte ptr [ecx + ebp - 1]
    add add esp, 12
    test test al, al
    jne sub_1002C42C
    mov mov eax, esi
    lea lea edx, [eax + 1]
    mov mov cl, byte ptr [eax]
    inc inc eax
    test test cl, cl
    jne sub_1002C4E7
    mov mov esi, dword ptr [esp + 80]
    sub sub eax, edx
    add add edi, eax
L4:
    mov mov eax, dword ptr [esp + 72]
    mov mov ecx, dword ptr [eax + 20]
    add add eax, 20
    test test ecx, ecx
    mov mov dword ptr [esp + 72], eax
    jne sub_1002C485
    pop pop ebx
    pop pop edi
    pop pop esi
    mov mov eax, 1
    pop pop ebp
    add add esp, 48
    ret ret
    xor xor eax, eax
    add add esp, 48
L5:
    ret ret
R_TrackStatistics ENDP
END
