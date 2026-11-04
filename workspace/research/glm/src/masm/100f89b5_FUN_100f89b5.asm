.686
.MODEL FLAT, C
EXTRN sub_10102488:PROC
EXTRN sub_101024F9:PROC
EXTRN sub_10102555:PROC
EXTRN sub_101025C6:PROC
EXTRN sub_10102C9A:PROC
EXTRN sub_10102D25:PROC
EXTRN sub_10102D47:PROC
EXTRN sub_10102E0D:PROC
EXTRN sub_10102EFB:PROC
EXTRN g_1019BE20:DWORD
.CODE
FUN_100f89b5 PROC
    push ebp
    mov ebp, esp
    sub esp, 28
    push ebx
    push esi
    push edi
    mov esi, 00000FFFFh
    push esi
    push 00000133Fh
    call sub_10102C9A
    mov edi, dword ptr [ebp + 14]
    mov edx, dword ptr [ebp + 8]
    pop ecx
    mov dword ptr [ebp - 4], eax
    pop ecx
    mov ecx, 000007FF0h
    mov eax, edi
    and ax, cx
    cmp ax, cx
    je L0
    mov eax, dword ptr [ebp + 22]
    and ax, cx
    cmp ax, cx
    jne L4
L0:
    mov eax, 000007FF8h
    and edi, eax
    cmp di, cx
    mov ebx, 00007FFFFh
    jne L1
    test dword ptr [ebp + 12], ebx
    jne L2
    test edx, edx
    jne L2
L1:
    mov esi, dword ptr [ebp + 22]
    and esi, eax
    cmp si, cx
    jne L3
    test dword ptr [ebp + 20], ebx
    jne L2
    cmp dword ptr [ebp + 16], 0
    je L3
L2:
    push dword ptr [ebp - 4]
    fld qword ptr [ebp + 8]
    fadd qword ptr [ebp + 16]
    sub esp, 24
    fstp qword ptr [esp + 16]
    fld qword ptr [ebp + 16]
    fstp qword ptr [esp + 8]
    fld qword ptr [ebp + 8]
    fstp qword ptr [esp]
    push 38
    push 8
    jmp L21
L3:
    cmp di, ax
    je L23
    cmp si, ax
    je L23
    mov esi, 00000FFFFh
L4:
    fld qword ptr [ebp + 8]
    fld st(0)
    fld qword ptr [ebp + 16]
    fucompp
    fnstsw ax
    test ah, 68
    jp L5
    push esi
    fstp st(0)
    push dword ptr [ebp - 4]
    call sub_10102D47
    fld qword ptr [ebp + 8]
    pop ecx
    pop ecx
    jmp L24
L5:
    fld qword ptr [g_1019BE20]
    fld st(0)
    fld st(2)
    fucompp
    fnstsw ax
    test ah, 68
    jp L7
    fld qword ptr [ebp + 16]
    mov dword ptr [ebp - 28], 1
    fcomp st(2)
    fnstsw ax
    test ah, 65
    jne L6
    and dword ptr [ebp - 24], 0
    jmp L7
L6:
    mov dword ptr [ebp - 24], 080000000h
L7:
    fld st(1)
    fcomp st(1)
    fnstsw ax
    test ah, 65
    jne L8
    fld qword ptr [ebp + 16]
    fcomp st(2)
    fnstsw ax
    test ah, 5
    jnp L9
L8:
    fld st(1)
    fcomp st(1)
    fnstsw ax
    test ah, 5
    jp L10
    fld qword ptr [ebp + 16]
    fcomp st(2)
    fnstsw ax
    test ah, 65
    jne L10
L9:
    test edx, edx
    fstp st(0)
    lea eax, [edx - 1]
    fstp st(0)
    mov dword ptr [ebp - 28], eax
    mov eax, dword ptr [ebp + 12]
    mov dword ptr [ebp - 24], eax
    jne L16
    dec eax
    jmp L14
L10:
    fld st(1)
    fcomp st(1)
    fnstsw ax
    test ah, 65
    jne L11
    fld qword ptr [ebp + 16]
    fcomp st(2)
    fnstsw ax
    test ah, 65
    je L12
L11:
    fld st(1)
    fcompp
    fnstsw ax
    test ah, 5
    jp L15
    fld qword ptr [ebp + 16]
    fcompp
    fnstsw ax
    test ah, 5
    jp L16
    jmp L13
L12:
    fstp st(0)
    fstp st(0)
L13:
    mov eax, dword ptr [ebp + 12]
    inc edx
    mov dword ptr [ebp - 28], edx
    mov dword ptr [ebp - 24], eax
    jne L16
    inc eax
L14:
    mov dword ptr [ebp - 24], eax
    jmp L16
L15:
    fstp st(0)
L16:
    test word ptr [ebp - 22], cx
    jne L18
    test dword ptr [ebp - 24], 0000FFFFFh
    jne L17
    cmp dword ptr [ebp - 28], 0
    je L18
L17:
    fld qword ptr [ebp - 28]
    lea eax, [ebp - 8]
    push eax
    push ecx
    push ecx
    fstp qword ptr [esp]
    call sub_10102555
    mov eax, dword ptr [ebp - 8]
    fstp qword ptr [ebp - 16]
    fld qword ptr [ebp - 16]
    add esp, 12
    add eax, 000000600h
    push eax
    push ecx
    push ecx
    fstp qword ptr [esp]
    call sub_10102488
    add esp, 12
    fstp qword ptr [ebp - 28]
    push dword ptr [ebp - 4]
    fld qword ptr [ebp - 28]
    sub esp, 24
    fstp qword ptr [esp + 16]
    fld qword ptr [ebp + 16]
    fstp qword ptr [esp + 8]
    fld qword ptr [ebp + 8]
    fstp qword ptr [esp]
    push 38
    push 18
    jmp L21
L18:
    cmp dword ptr [ebp - 24], 07FF00000h
    jne L19
    cmp dword ptr [ebp - 28], 0
    je L20
L19:
    cmp dword ptr [ebp - 24], 0FFF00000h
    jne L22
    cmp dword ptr [ebp - 28], 0
    jne L22
L20:
    fld qword ptr [ebp - 28]
    lea eax, [ebp - 8]
    push eax
    push ecx
    push ecx
    fstp qword ptr [esp]
    call sub_101025C6
    mov eax, dword ptr [ebp - 8]
    fstp qword ptr [ebp - 16]
    fld qword ptr [ebp - 16]
    add esp, 12
    add eax, 0FFFFFA00h
    push eax
    push ecx
    push ecx
    fstp qword ptr [esp]
    call sub_101024F9
    add esp, 12
    fstp qword ptr [ebp - 28]
    push dword ptr [ebp - 4]
    fld qword ptr [ebp - 28]
    sub esp, 24
    fstp qword ptr [esp + 16]
    fld qword ptr [ebp + 16]
    fstp qword ptr [esp + 8]
    fld qword ptr [ebp + 8]
    fstp qword ptr [esp]
    push 38
    push 17
L21:
    call sub_10102E0D
    add esp, 36
    jmp L24
L22:
    push esi
    push dword ptr [ebp - 4]
    call sub_10102EFB
    fld qword ptr [ebp - 28]
    pop ecx
    pop ecx
    jmp L24
L23:
    push dword ptr [ebp - 4]
    fld qword ptr [ebp + 16]
    sub esp, 16
    fstp qword ptr [esp + 8]
    fld qword ptr [ebp + 8]
    fstp qword ptr [esp]
    push 38
    call sub_10102D25
    add esp, 24
L24:
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_100f89b5 ENDP
END
