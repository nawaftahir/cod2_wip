.686
.MODEL FLAT, C
EXTRN sub_100F5EE0:PROC
EXTRN sub_100F5F26:PROC
EXTRN sub_100F5F7E:PROC
EXTRN sub_100F5FC8:PROC
EXTRN fp_101D4B2C:DWORD
EXTRN g_1019BC78:DWORD
EXTRN g_1019BDBC:DWORD
EXTRN g_101A5C68:DWORD
.CODE
R_TrackStatistics PROC
    sub esp, 48
    mov ecx, dword ptr [esp + 56]
    fld dword ptr [ecx]
    mov eax, dword ptr [esp + 52]
    fmul dword ptr [g_1019BDBC]
    push 00F83FFF7h
    push 0
    push 010191348h
    fadd dword ptr [eax]
    push 010191348h
    lea edx, [esp + 28]
    fstp dword ptr [esp + 16]
    fld dword ptr [ecx + 4]
    fmul dword ptr [g_1019BDBC]
    fadd dword ptr [eax + 4]
    fstp dword ptr [esp + 20]
    fld dword ptr [ecx + 8]
    lea ecx, [esp + 16]
    fmul dword ptr [g_1019BDBC]
    push ecx
    push eax
    push edx
    fadd dword ptr [eax + 8]
    fstp dword ptr [esp + 36]
    call dword ptr [fp_101D4B2C]
    mov ax, word ptr [esp + 74]
    add esp, 28
    test ah, ah
    jne L16
    test al, al
    jne L16
    fld dword ptr [g_1019BC78]
    fld dword ptr [esp + 12]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L16
    mov eax, dword ptr [esp + 36]
    test eax, eax
    je L16
    mov edx, dword ptr [esp + 60]
    sub edx, eax
    lea esp, [esp]
L0:
    mov cl, byte ptr [eax]
    mov byte ptr [edx + eax], cl
    inc eax
    test cl, cl
    jne L0
    mov eax, dword ptr [esp + 28]
    push ebp
    mov ebp, dword ptr [esp + 76]
    push esi
    mov esi, dword ptr [esp + 72]
    mov byte ptr [esi], cl
    push edi
    mov edi, dword ptr [esp + 80]
    mov byte ptr [esi + ebp - 1], cl
    sar eax, 20
    and eax, 31
    mov byte ptr [edi], cl
    mov byte ptr [edi + ebp - 1], cl
    jle L1
    cmp eax, 23
    jge L1
    lea eax, [eax + eax*4]
    mov ecx, dword ptr [eax*4 + 0101A5A9Ch]
    push ebp
    push ecx
    jmp L2
L1:
    push ebp
    push 010197934h
L2:
    push esi
    call sub_100F5EE0
    mov al, byte ptr [esi + ebp - 1]
    add esp, 12
    test al, al
    je L3
    pop edi
    pop esi
    xor eax, eax
    pop ebp
    add esp, 48
    ret
L3:
    mov eax, esi
    lea edx, [eax + 1]
    lea esp, [esp]
L4:
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L4
    sub eax, edx
    push ebx
    mov ebx, eax
    test byte ptr [esp + 48], 1
    push ebp
    je L5
    push 01019792Ch
    jmp L6
L5:
    push 01019791Ch
L6:
    push edi
    call sub_100F5F26
    mov al, byte ptr [edi + ebp - 1]
    add esp, 12
    test al, al
    je L8
L7:
    pop ebx
    pop edi
    pop esi
    xor eax, eax
    pop ebp
    add esp, 48
    ret
L8:
    lea ecx, [edi + 1]
    mov edi, edi
L9:
    mov al, byte ptr [edi]
    inc edi
    test al, al
    jne L9
    mov eax, dword ptr [g_101A5C68]
    sub edi, ecx
    test eax, eax
    je L15
    mov eax, 0101A5C68h
    mov dword ptr [esp + 72], eax
    nop
L10:
    mov edx, dword ptr [esp + 44]
    test dword ptr [eax + 8], edx
    je L12
    mov byte ptr [ebx + esi], 32
    mov edx, dword ptr [eax]
    inc ebx
    mov ecx, ebp
    sub ecx, ebx
    push ecx
    push edx
    add esi, ebx
    push esi
    call sub_100F5F7E
    mov eax, dword ptr [esp + 92]
    mov cl, byte ptr [eax + ebp - 1]
    add esp, 12
    test cl, cl
    jne L7
    mov eax, esi
    lea edx, [eax + 1]
L11:
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L11
    mov esi, dword ptr [esp + 80]
    sub eax, edx
    add ebx, eax
    mov eax, dword ptr [esp + 72]
L12:
    mov ecx, dword ptr [esp + 48]
    test dword ptr [eax + 12], ecx
    je L14
    mov ecx, dword ptr [esp + 84]
    mov byte ptr [edi + ecx], 32
    mov eax, dword ptr [eax]
    inc edi
    mov edx, ebp
    sub edx, edi
    push edx
    lea esi, [edi + ecx]
    push eax
    push esi
    call sub_100F5FC8
    mov ecx, dword ptr [esp + 96]
    mov al, byte ptr [ecx + ebp - 1]
    add esp, 12
    test al, al
    jne L7
    mov eax, esi
    lea edx, [eax + 1]
L13:
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L13
    mov esi, dword ptr [esp + 80]
    sub eax, edx
    add edi, eax
    mov eax, dword ptr [esp + 72]
L14:
    mov ecx, dword ptr [eax + 20]
    add eax, 20
    test ecx, ecx
    mov dword ptr [esp + 72], eax
    jne L10
L15:
    pop ebx
    pop edi
    pop esi
    mov eax, 1
    pop ebp
    add esp, 48
    ret
L16:
    xor eax, eax
    add esp, 48
    ret
R_TrackStatistics ENDP
END
