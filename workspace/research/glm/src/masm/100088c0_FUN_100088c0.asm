.686
.MODEL FLAT, C
.CODE
FUN_100088c0 PROC
    sub esp, 24
    mov eax, 048000000h
    mov dword ptr [edx], eax
    mov dword ptr [edx + 4], eax
    mov dword ptr [edx + 8], eax
    mov eax, 0C8000000h
    mov dword ptr [esi], eax
    mov dword ptr [esi + 4], eax
    mov dword ptr [esi + 8], eax
    mov eax, dword ptr [edi]
    mov dword ptr [esp + 12], eax
    mov eax, dword ptr [edi + 4]
    fld dword ptr [esp + 12]
    fmul dword ptr [ecx + 20]
    mov dword ptr [esp + 16], eax
    mov eax, dword ptr [edi + 8]
    mov dword ptr [esp + 20], eax
    mov eax, dword ptr [ecx + 60]
    mov dword ptr [esp], eax
    fadd dword ptr [esp]
    mov eax, dword ptr [ecx + 64]
    mov dword ptr [esp + 4], eax
    fstp dword ptr [esp]
    mov eax, dword ptr [ecx + 68]
    fld dword ptr [esp + 12]
    mov dword ptr [esp + 8], eax
    fmul dword ptr [ecx + 24]
    push ebx
    fadd dword ptr [esp + 8]
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 16]
    fmul dword ptr [ecx + 28]
    fadd dword ptr [esp + 12]
    fstp dword ptr [esp + 12]
    fld dword ptr [esp + 20]
    fmul dword ptr [ecx + 32]
    fadd dword ptr [esp + 4]
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 20]
    fmul dword ptr [ecx + 36]
    fadd dword ptr [esp + 8]
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 20]
    fmul dword ptr [ecx + 40]
    fadd dword ptr [esp + 12]
    fstp dword ptr [esp + 12]
    fld dword ptr [esp + 24]
    fmul dword ptr [ecx + 44]
    fadd dword ptr [esp + 4]
    fstp dword ptr [esp + 4]
    mov ebx, dword ptr [esp + 4]
    fld dword ptr [esp + 24]
    fmul dword ptr [ecx + 48]
    fadd dword ptr [esp + 8]
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 24]
    fmul dword ptr [ecx + 52]
    fadd dword ptr [esp + 12]
    fstp dword ptr [esp + 12]
    fld dword ptr [esp + 4]
    fcomp dword ptr [edx]
    fnstsw ax
    test ah, 5
    jp L0
    mov dword ptr [edx], ebx
L0:
    fld dword ptr [esp + 4]
    fcomp dword ptr [esi]
    fnstsw ax
    test ah, 65
    jne L1
    mov dword ptr [esi], ebx
L1:
    fld dword ptr [esp + 8]
    mov ebx, dword ptr [esp + 8]
    fcomp dword ptr [edx + 4]
    fnstsw ax
    test ah, 5
    jp L2
    mov dword ptr [edx + 4], ebx
L2:
    fld dword ptr [esp + 8]
    fcomp dword ptr [esi + 4]
    fnstsw ax
    test ah, 65
    jne L3
    mov dword ptr [esi + 4], ebx
L3:
    fld dword ptr [esp + 12]
    mov ebx, dword ptr [esp + 12]
    fcomp dword ptr [edx + 8]
    fnstsw ax
    test ah, 5
    jp L4
    mov dword ptr [edx + 8], ebx
L4:
    fld dword ptr [esp + 12]
    fcomp dword ptr [esi + 8]
    fnstsw ax
    test ah, 65
    jne L5
    mov dword ptr [esi + 8], ebx
L5:
    mov eax, dword ptr [edi + 12]
    mov dword ptr [esp + 16], eax
    mov eax, dword ptr [edi + 4]
    fld dword ptr [esp + 16]
    fmul dword ptr [ecx + 20]
    mov dword ptr [esp + 20], eax
    mov eax, dword ptr [edi + 8]
    mov dword ptr [esp + 24], eax
    mov eax, dword ptr [ecx + 60]
    mov dword ptr [esp + 4], eax
    fadd dword ptr [esp + 4]
    mov eax, dword ptr [ecx + 64]
    mov dword ptr [esp + 8], eax
    fstp dword ptr [esp + 4]
    mov eax, dword ptr [ecx + 68]
    fld dword ptr [esp + 16]
    mov dword ptr [esp + 12], eax
    fmul dword ptr [ecx + 24]
    fadd dword ptr [esp + 8]
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 16]
    fmul dword ptr [ecx + 28]
    fadd dword ptr [esp + 12]
    fstp dword ptr [esp + 12]
    fld dword ptr [esp + 20]
    fmul dword ptr [ecx + 32]
    fadd dword ptr [esp + 4]
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 20]
    fmul dword ptr [ecx + 36]
    fadd dword ptr [esp + 8]
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 20]
    fmul dword ptr [ecx + 40]
    fadd dword ptr [esp + 12]
    fstp dword ptr [esp + 12]
    fld dword ptr [esp + 24]
    fmul dword ptr [ecx + 44]
    fadd dword ptr [esp + 4]
    fstp dword ptr [esp + 4]
    mov ebx, dword ptr [esp + 4]
    fld dword ptr [esp + 24]
    fmul dword ptr [ecx + 48]
    fadd dword ptr [esp + 8]
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 24]
    fmul dword ptr [ecx + 52]
    fadd dword ptr [esp + 12]
    fstp dword ptr [esp + 12]
    fld dword ptr [esp + 4]
    fcomp dword ptr [edx]
    fnstsw ax
    test ah, 5
    jp L6
    mov dword ptr [edx], ebx
L6:
    fld dword ptr [esp + 4]
    fcomp dword ptr [esi]
    fnstsw ax
    test ah, 65
    jne L7
    mov dword ptr [esi], ebx
L7:
    fld dword ptr [esp + 8]
    mov ebx, dword ptr [esp + 8]
    fcomp dword ptr [edx + 4]
    fnstsw ax
    test ah, 5
    jp L8
    mov dword ptr [edx + 4], ebx
L8:
    fld dword ptr [esp + 8]
    fcomp dword ptr [esi + 4]
    fnstsw ax
    test ah, 65
    jne L9
    mov dword ptr [esi + 4], ebx
L9:
    fld dword ptr [esp + 12]
    mov ebx, dword ptr [esp + 12]
    fcomp dword ptr [edx + 8]
    fnstsw ax
    test ah, 5
    jp L10
    mov dword ptr [edx + 8], ebx
L10:
    fld dword ptr [esp + 12]
    fcomp dword ptr [esi + 8]
    fnstsw ax
    test ah, 65
    jne L11
    mov dword ptr [esi + 8], ebx
L11:
    mov eax, dword ptr [edi]
    mov dword ptr [esp + 16], eax
    mov eax, dword ptr [edi + 16]
    fld dword ptr [esp + 16]
    fmul dword ptr [ecx + 20]
    mov dword ptr [esp + 20], eax
    mov eax, dword ptr [edi + 8]
    mov dword ptr [esp + 24], eax
    mov eax, dword ptr [ecx + 60]
    mov dword ptr [esp + 4], eax
    fadd dword ptr [esp + 4]
    mov eax, dword ptr [ecx + 64]
    mov dword ptr [esp + 8], eax
    fstp dword ptr [esp + 4]
    mov eax, dword ptr [ecx + 68]
    fld dword ptr [esp + 16]
    mov dword ptr [esp + 12], eax
    fmul dword ptr [ecx + 24]
    fadd dword ptr [esp + 8]
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 16]
    fmul dword ptr [ecx + 28]
    fadd dword ptr [esp + 12]
    fstp dword ptr [esp + 12]
    fld dword ptr [esp + 20]
    fmul dword ptr [ecx + 32]
    fadd dword ptr [esp + 4]
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 20]
    fmul dword ptr [ecx + 36]
    fadd dword ptr [esp + 8]
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 20]
    fmul dword ptr [ecx + 40]
    fadd dword ptr [esp + 12]
    fstp dword ptr [esp + 12]
    fld dword ptr [esp + 24]
    fmul dword ptr [ecx + 44]
    fadd dword ptr [esp + 4]
    fstp dword ptr [esp + 4]
    mov ebx, dword ptr [esp + 4]
    fld dword ptr [esp + 24]
    fmul dword ptr [ecx + 48]
    fadd dword ptr [esp + 8]
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 24]
    fmul dword ptr [ecx + 52]
    fadd dword ptr [esp + 12]
    fstp dword ptr [esp + 12]
    fld dword ptr [esp + 4]
    fcomp dword ptr [edx]
    fnstsw ax
    test ah, 5
    jp L12
    mov dword ptr [edx], ebx
L12:
    fld dword ptr [esp + 4]
    fcomp dword ptr [esi]
    fnstsw ax
    test ah, 65
    jne L13
    mov dword ptr [esi], ebx
L13:
    fld dword ptr [esp + 8]
    mov ebx, dword ptr [esp + 8]
    fcomp dword ptr [edx + 4]
    fnstsw ax
    test ah, 5
    jp L14
    mov dword ptr [edx + 4], ebx
L14:
    fld dword ptr [esp + 8]
    fcomp dword ptr [esi + 4]
    fnstsw ax
    test ah, 65
    jne L15
    mov dword ptr [esi + 4], ebx
L15:
    fld dword ptr [esp + 12]
    mov ebx, dword ptr [esp + 12]
    fcomp dword ptr [edx + 8]
    fnstsw ax
    test ah, 5
    jp L16
    mov dword ptr [edx + 8], ebx
L16:
    fld dword ptr [esp + 12]
    fcomp dword ptr [esi + 8]
    fnstsw ax
    test ah, 65
    jne L17
    mov dword ptr [esi + 8], ebx
L17:
    mov eax, dword ptr [edi + 12]
    mov dword ptr [esp + 16], eax
    mov eax, dword ptr [edi + 16]
    fld dword ptr [esp + 16]
    fmul dword ptr [ecx + 20]
    mov dword ptr [esp + 20], eax
    mov eax, dword ptr [edi + 8]
    mov dword ptr [esp + 24], eax
    mov eax, dword ptr [ecx + 60]
    mov dword ptr [esp + 4], eax
    fadd dword ptr [esp + 4]
    mov eax, dword ptr [ecx + 64]
    mov dword ptr [esp + 8], eax
    fstp dword ptr [esp + 4]
    mov eax, dword ptr [ecx + 68]
    fld dword ptr [esp + 16]
    mov dword ptr [esp + 12], eax
    fmul dword ptr [ecx + 24]
    fadd dword ptr [esp + 8]
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 16]
    fmul dword ptr [ecx + 28]
    fadd dword ptr [esp + 12]
    fstp dword ptr [esp + 12]
    fld dword ptr [esp + 20]
    fmul dword ptr [ecx + 32]
    fadd dword ptr [esp + 4]
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 20]
    fmul dword ptr [ecx + 36]
    fadd dword ptr [esp + 8]
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 20]
    fmul dword ptr [ecx + 40]
    fadd dword ptr [esp + 12]
    fstp dword ptr [esp + 12]
    fld dword ptr [esp + 24]
    fmul dword ptr [ecx + 44]
    fadd dword ptr [esp + 4]
    fstp dword ptr [esp + 4]
    mov ebx, dword ptr [esp + 4]
    fld dword ptr [esp + 24]
    fmul dword ptr [ecx + 48]
    fadd dword ptr [esp + 8]
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 24]
    fmul dword ptr [ecx + 52]
    fadd dword ptr [esp + 12]
    fstp dword ptr [esp + 12]
    fld dword ptr [esp + 4]
    fcomp dword ptr [edx]
    fnstsw ax
    test ah, 5
    jp L18
    mov dword ptr [edx], ebx
L18:
    fld dword ptr [esp + 4]
    fcomp dword ptr [esi]
    fnstsw ax
    test ah, 65
    jne L19
    mov dword ptr [esi], ebx
L19:
    fld dword ptr [esp + 8]
    mov ebx, dword ptr [esp + 8]
    fcomp dword ptr [edx + 4]
    fnstsw ax
    test ah, 5
    jp L20
    mov dword ptr [edx + 4], ebx
L20:
    fld dword ptr [esp + 8]
    fcomp dword ptr [esi + 4]
    fnstsw ax
    test ah, 65
    jne L21
    mov dword ptr [esi + 4], ebx
L21:
    fld dword ptr [esp + 12]
    mov ebx, dword ptr [esp + 12]
    fcomp dword ptr [edx + 8]
    fnstsw ax
    test ah, 5
    jp L22
    mov dword ptr [edx + 8], ebx
L22:
    fld dword ptr [esp + 12]
    fcomp dword ptr [esi + 8]
    fnstsw ax
    test ah, 65
    jne L23
    mov dword ptr [esi + 8], ebx
L23:
    mov eax, dword ptr [edi]
    mov dword ptr [esp + 16], eax
    mov eax, dword ptr [edi + 4]
    fld dword ptr [esp + 16]
    fmul dword ptr [ecx + 20]
    mov dword ptr [esp + 20], eax
    mov eax, dword ptr [edi + 20]
    mov dword ptr [esp + 24], eax
    mov eax, dword ptr [ecx + 60]
    mov dword ptr [esp + 4], eax
    fadd dword ptr [esp + 4]
    mov eax, dword ptr [ecx + 64]
    mov dword ptr [esp + 8], eax
    fstp dword ptr [esp + 4]
    mov eax, dword ptr [ecx + 68]
    fld dword ptr [esp + 16]
    mov dword ptr [esp + 12], eax
    fmul dword ptr [ecx + 24]
    fadd dword ptr [esp + 8]
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 16]
    fmul dword ptr [ecx + 28]
    fadd dword ptr [esp + 12]
    fstp dword ptr [esp + 12]
    fld dword ptr [esp + 20]
    fmul dword ptr [ecx + 32]
    fadd dword ptr [esp + 4]
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 20]
    fmul dword ptr [ecx + 36]
    fadd dword ptr [esp + 8]
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 20]
    fmul dword ptr [ecx + 40]
    fadd dword ptr [esp + 12]
    fstp dword ptr [esp + 12]
    fld dword ptr [esp + 24]
    fmul dword ptr [ecx + 44]
    fadd dword ptr [esp + 4]
    fstp dword ptr [esp + 4]
    mov ebx, dword ptr [esp + 4]
    fld dword ptr [esp + 24]
    fmul dword ptr [ecx + 48]
    fadd dword ptr [esp + 8]
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 24]
    fmul dword ptr [ecx + 52]
    fadd dword ptr [esp + 12]
    fstp dword ptr [esp + 12]
    fld dword ptr [esp + 4]
    fcomp dword ptr [edx]
    fnstsw ax
    test ah, 5
    jp L24
    mov dword ptr [edx], ebx
L24:
    fld dword ptr [esp + 4]
    fcomp dword ptr [esi]
    fnstsw ax
    test ah, 65
    jne L25
    mov dword ptr [esi], ebx
L25:
    fld dword ptr [esp + 8]
    mov ebx, dword ptr [esp + 8]
    fcomp dword ptr [edx + 4]
    fnstsw ax
    test ah, 5
    jp L26
    mov dword ptr [edx + 4], ebx
L26:
    fld dword ptr [esp + 8]
    fcomp dword ptr [esi + 4]
    fnstsw ax
    test ah, 65
    jne L27
    mov dword ptr [esi + 4], ebx
L27:
    fld dword ptr [esp + 12]
    mov ebx, dword ptr [esp + 12]
    fcomp dword ptr [edx + 8]
    fnstsw ax
    test ah, 5
    jp L28
    mov dword ptr [edx + 8], ebx
L28:
    fld dword ptr [esp + 12]
    fcomp dword ptr [esi + 8]
    fnstsw ax
    test ah, 65
    jne L29
    mov dword ptr [esi + 8], ebx
L29:
    mov eax, dword ptr [edi + 12]
    mov dword ptr [esp + 16], eax
    mov eax, dword ptr [edi + 4]
    fld dword ptr [esp + 16]
    fmul dword ptr [ecx + 20]
    mov dword ptr [esp + 20], eax
    mov eax, dword ptr [edi + 20]
    mov dword ptr [esp + 24], eax
    mov eax, dword ptr [ecx + 60]
    mov dword ptr [esp + 4], eax
    fadd dword ptr [esp + 4]
    mov eax, dword ptr [ecx + 64]
    mov dword ptr [esp + 8], eax
    fstp dword ptr [esp + 4]
    mov eax, dword ptr [ecx + 68]
    fld dword ptr [esp + 16]
    mov dword ptr [esp + 12], eax
    fmul dword ptr [ecx + 24]
    fadd dword ptr [esp + 8]
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 16]
    fmul dword ptr [ecx + 28]
    fadd dword ptr [esp + 12]
    fstp dword ptr [esp + 12]
    fld dword ptr [esp + 20]
    fmul dword ptr [ecx + 32]
    fadd dword ptr [esp + 4]
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 20]
    fmul dword ptr [ecx + 36]
    fadd dword ptr [esp + 8]
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 20]
    fmul dword ptr [ecx + 40]
    fadd dword ptr [esp + 12]
    fstp dword ptr [esp + 12]
    fld dword ptr [esp + 24]
    fmul dword ptr [ecx + 44]
    fadd dword ptr [esp + 4]
    fstp dword ptr [esp + 4]
    mov ebx, dword ptr [esp + 4]
    fld dword ptr [esp + 24]
    fmul dword ptr [ecx + 48]
    fadd dword ptr [esp + 8]
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 24]
    fmul dword ptr [ecx + 52]
    fadd dword ptr [esp + 12]
    fstp dword ptr [esp + 12]
    fld dword ptr [esp + 4]
    fcomp dword ptr [edx]
    fnstsw ax
    test ah, 5
    jp L30
    mov dword ptr [edx], ebx
L30:
    fld dword ptr [esp + 4]
    fcomp dword ptr [esi]
    fnstsw ax
    test ah, 65
    jne L31
    mov dword ptr [esi], ebx
L31:
    fld dword ptr [esp + 8]
    mov ebx, dword ptr [esp + 8]
    fcomp dword ptr [edx + 4]
    fnstsw ax
    test ah, 5
    jp L32
    mov dword ptr [edx + 4], ebx
L32:
    fld dword ptr [esp + 8]
    fcomp dword ptr [esi + 4]
    fnstsw ax
    test ah, 65
    jne L33
    mov dword ptr [esi + 4], ebx
L33:
    fld dword ptr [esp + 12]
    mov ebx, dword ptr [esp + 12]
    fcomp dword ptr [edx + 8]
    fnstsw ax
    test ah, 5
    jp L34
    mov dword ptr [edx + 8], ebx
L34:
    fld dword ptr [esp + 12]
    fcomp dword ptr [esi + 8]
    fnstsw ax
    test ah, 65
    jne L35
    mov dword ptr [esi + 8], ebx
L35:
    mov eax, dword ptr [edi]
    mov dword ptr [esp + 16], eax
    mov eax, dword ptr [edi + 16]
    fld dword ptr [esp + 16]
    fmul dword ptr [ecx + 20]
    mov dword ptr [esp + 20], eax
    mov eax, dword ptr [edi + 20]
    mov dword ptr [esp + 24], eax
    mov eax, dword ptr [ecx + 60]
    mov dword ptr [esp + 4], eax
    fadd dword ptr [esp + 4]
    mov eax, dword ptr [ecx + 64]
    mov dword ptr [esp + 8], eax
    fstp dword ptr [esp + 4]
    mov eax, dword ptr [ecx + 68]
    fld dword ptr [esp + 16]
    mov dword ptr [esp + 12], eax
    fmul dword ptr [ecx + 24]
    fadd dword ptr [esp + 8]
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 16]
    fmul dword ptr [ecx + 28]
    fadd dword ptr [esp + 12]
    fstp dword ptr [esp + 12]
    fld dword ptr [esp + 20]
    fmul dword ptr [ecx + 32]
    fadd dword ptr [esp + 4]
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 20]
    fmul dword ptr [ecx + 36]
    fadd dword ptr [esp + 8]
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 20]
    fmul dword ptr [ecx + 40]
    fadd dword ptr [esp + 12]
    fstp dword ptr [esp + 12]
    fld dword ptr [esp + 24]
    fmul dword ptr [ecx + 44]
    fadd dword ptr [esp + 4]
    fstp dword ptr [esp + 4]
    mov ebx, dword ptr [esp + 4]
    fld dword ptr [esp + 24]
    fmul dword ptr [ecx + 48]
    fadd dword ptr [esp + 8]
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 24]
    fmul dword ptr [ecx + 52]
    fadd dword ptr [esp + 12]
    fstp dword ptr [esp + 12]
    fld dword ptr [esp + 4]
    fcomp dword ptr [edx]
    fnstsw ax
    test ah, 5
    jp L36
    mov dword ptr [edx], ebx
L36:
    fld dword ptr [esp + 4]
    fcomp dword ptr [esi]
    fnstsw ax
    test ah, 65
    jne L37
    mov dword ptr [esi], ebx
L37:
    fld dword ptr [esp + 8]
    mov ebx, dword ptr [esp + 8]
    fcomp dword ptr [edx + 4]
    fnstsw ax
    test ah, 5
    jp L38
    mov dword ptr [edx + 4], ebx
L38:
    fld dword ptr [esp + 8]
    fcomp dword ptr [esi + 4]
    fnstsw ax
    test ah, 65
    jne L39
    mov dword ptr [esi + 4], ebx
L39:
    fld dword ptr [esp + 12]
    mov ebx, dword ptr [esp + 12]
    fcomp dword ptr [edx + 8]
    fnstsw ax
    test ah, 5
    jp L40
    mov dword ptr [edx + 8], ebx
L40:
    fld dword ptr [esp + 12]
    fcomp dword ptr [esi + 8]
    fnstsw ax
    test ah, 65
    jne L41
    mov dword ptr [esi + 8], ebx
L41:
    mov eax, dword ptr [edi + 12]
    mov dword ptr [esp + 16], eax
    mov eax, dword ptr [edi + 16]
    fld dword ptr [esp + 16]
    fmul dword ptr [ecx + 20]
    mov dword ptr [esp + 20], eax
    mov eax, dword ptr [edi + 20]
    mov dword ptr [esp + 24], eax
    mov eax, dword ptr [ecx + 60]
    mov dword ptr [esp + 4], eax
    fadd dword ptr [esp + 4]
    mov eax, dword ptr [ecx + 64]
    mov dword ptr [esp + 8], eax
    fstp dword ptr [esp + 4]
    mov eax, dword ptr [ecx + 68]
    fld dword ptr [esp + 16]
    mov dword ptr [esp + 12], eax
    fmul dword ptr [ecx + 24]
    pop ebx
    fadd dword ptr [esp + 4]
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 12]
    fmul dword ptr [ecx + 28]
    fadd dword ptr [esp + 8]
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 16]
    fmul dword ptr [ecx + 32]
    fadd dword ptr [esp]
    fstp dword ptr [esp]
    fld dword ptr [esp + 16]
    fmul dword ptr [ecx + 36]
    fadd dword ptr [esp + 4]
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 16]
    fmul dword ptr [ecx + 40]
    fadd dword ptr [esp + 8]
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 20]
    fmul dword ptr [ecx + 44]
    fadd dword ptr [esp]
    fstp dword ptr [esp]
    fld dword ptr [esp + 20]
    fmul dword ptr [ecx + 48]
    fadd dword ptr [esp + 4]
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 20]
    fmul dword ptr [ecx + 52]
    mov ecx, dword ptr [esp]
    fadd dword ptr [esp + 8]
    fstp dword ptr [esp + 8]
    fld dword ptr [esp]
    fcomp dword ptr [edx]
    fnstsw ax
    test ah, 5
    jp L42
    mov dword ptr [edx], ecx
L42:
    fld dword ptr [esp]
    fcomp dword ptr [esi]
    fnstsw ax
    test ah, 65
    jne L43
    mov dword ptr [esi], ecx
L43:
    fld dword ptr [esp + 4]
    mov ecx, dword ptr [esp + 4]
    fcomp dword ptr [edx + 4]
    fnstsw ax
    test ah, 5
    jp L44
    mov dword ptr [edx + 4], ecx
L44:
    fld dword ptr [esp + 4]
    fcomp dword ptr [esi + 4]
    fnstsw ax
    test ah, 65
    jne L45
    mov dword ptr [esi + 4], ecx
L45:
    fld dword ptr [esp + 8]
    mov ecx, dword ptr [esp + 8]
    fcomp dword ptr [edx + 8]
    fnstsw ax
    test ah, 5
    jp L46
    mov dword ptr [edx + 8], ecx
L46:
    fld dword ptr [esp + 8]
    fcomp dword ptr [esi + 8]
    fnstsw ax
    test ah, 65
    jne L47
    mov dword ptr [esi + 8], ecx
L47:
    add esp, 24
    ret
FUN_100088c0 ENDP
END
