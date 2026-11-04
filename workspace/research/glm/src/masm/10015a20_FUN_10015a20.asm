.686
.MODEL FLAT, C
.CODE
FUN_10015a20 PROC
    sub esp, 24
    fld dword ptr [esp + 32]
    push ebx
    push esi
    mov esi, 048000000h
    mov dword ptr [ecx], esi
    mov dword ptr [ecx + 4], esi
    mov dword ptr [ecx + 8], esi
    mov esi, 0C8000000h
    mov dword ptr [edx], esi
    mov dword ptr [edx + 4], esi
    mov dword ptr [edx + 8], esi
    fmul dword ptr [eax]
    mov esi, dword ptr [esp + 36]
    push edi
    fstp dword ptr [esp + 24]
    add esi, 8
    fld dword ptr [esp + 44]
    mov ebx, 4
    fmul dword ptr [eax + 4]
    fstp dword ptr [esp + 28]
    fld dword ptr [esp + 44]
    fmul dword ptr [eax + 8]
    fstp dword ptr [esp + 32]
    lea esp, [esp]
L0:
    fld dword ptr [esp + 24]
    fadd dword ptr [esi - 8]
    fstp dword ptr [esp + 12]
    mov edi, dword ptr [esp + 12]
    fld dword ptr [esp + 28]
    fadd dword ptr [esi - 4]
    fstp dword ptr [esp + 16]
    fld dword ptr [esp + 32]
    fadd dword ptr [esi]
    fstp dword ptr [esp + 20]
    fld dword ptr [esp + 12]
    fcomp dword ptr [ecx]
    fnstsw ax
    test ah, 5
    jp L1
    mov dword ptr [ecx], edi
L1:
    fld dword ptr [esp + 12]
    fcomp dword ptr [edx]
    fnstsw ax
    test ah, 65
    jne L2
    mov dword ptr [edx], edi
L2:
    fld dword ptr [esp + 16]
    mov edi, dword ptr [esp + 16]
    fcomp dword ptr [ecx + 4]
    fnstsw ax
    test ah, 5
    jp L3
    mov dword ptr [ecx + 4], edi
L3:
    fld dword ptr [esp + 16]
    fcomp dword ptr [edx + 4]
    fnstsw ax
    test ah, 65
    jne L4
    mov dword ptr [edx + 4], edi
L4:
    fld dword ptr [esp + 20]
    mov edi, dword ptr [esp + 20]
    fcomp dword ptr [ecx + 8]
    fnstsw ax
    test ah, 5
    jp L5
    mov dword ptr [ecx + 8], edi
L5:
    fld dword ptr [esp + 20]
    fcomp dword ptr [edx + 8]
    fnstsw ax
    test ah, 65
    jne L6
    mov dword ptr [edx + 8], edi
L6:
    fld dword ptr [esi - 8]
    fsub dword ptr [esp + 24]
    fstp dword ptr [esp + 12]
    mov edi, dword ptr [esp + 12]
    fld dword ptr [esi - 4]
    fsub dword ptr [esp + 28]
    fstp dword ptr [esp + 16]
    fld dword ptr [esi]
    fsub dword ptr [esp + 32]
    fstp dword ptr [esp + 20]
    fld dword ptr [esp + 12]
    fcomp dword ptr [ecx]
    fnstsw ax
    test ah, 5
    jp L7
    mov dword ptr [ecx], edi
L7:
    fld dword ptr [esp + 12]
    fcomp dword ptr [edx]
    fnstsw ax
    test ah, 65
    jne L8
    mov dword ptr [edx], edi
L8:
    fld dword ptr [esp + 16]
    mov edi, dword ptr [esp + 16]
    fcomp dword ptr [ecx + 4]
    fnstsw ax
    test ah, 5
    jp L9
    mov dword ptr [ecx + 4], edi
L9:
    fld dword ptr [esp + 16]
    fcomp dword ptr [edx + 4]
    fnstsw ax
    test ah, 65
    jne L10
    mov dword ptr [edx + 4], edi
L10:
    fld dword ptr [esp + 20]
    mov edi, dword ptr [esp + 20]
    fcomp dword ptr [ecx + 8]
    fnstsw ax
    test ah, 5
    jp L11
    mov dword ptr [ecx + 8], edi
L11:
    fld dword ptr [esp + 20]
    fcomp dword ptr [edx + 8]
    fnstsw ax
    test ah, 65
    jne L12
    mov dword ptr [edx + 8], edi
L12:
    add esi, 12
    dec ebx
    jne L0
    pop edi
    pop esi
    pop ebx
    add esp, 24
    ret
FUN_10015a20 ENDP
END
