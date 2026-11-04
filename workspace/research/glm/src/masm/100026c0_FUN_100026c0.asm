.686
.MODEL FLAT, C
.CODE
FUN_100026c0 PROC
    push ecx
    mov eax, 048000000h
    mov dword ptr [ecx + 4], eax
    mov dword ptr [ecx + 8], eax
    mov dword ptr [ecx + 12], eax
    mov eax, 0C8000000h
    push ebx
    xor ebx, ebx
    mov dword ptr [ecx + 16], eax
    mov dword ptr [ecx + 20], eax
    mov dword ptr [ecx + 24], eax
    cmp word ptr [ecx + 34], bx
    push ebp
    mov ebp, dword ptr [esp + 16]
    jbe L7
    nop
L0:
    mov eax, dword ptr [ecx + 36]
    movzx edx, word ptr [eax + ebx*2]
    add edx, dword ptr [ecx + 28]
    imul edx, edx, 68
    fld dword ptr [edx + esi]
    fcomp dword ptr [ecx + 4]
    fnstsw ax
    test ah, 5
    jp L1
    mov eax, dword ptr [edx + esi]
    mov dword ptr [ecx + 4], eax
L1:
    fld dword ptr [edx + esi]
    fcomp dword ptr [ecx + 16]
    fnstsw ax
    test ah, 65
    jne L2
    mov eax, dword ptr [edx + esi]
    mov dword ptr [ecx + 16], eax
L2:
    fld dword ptr [edx + esi + 4]
    fcomp dword ptr [ecx + 8]
    fnstsw ax
    test ah, 5
    jp L3
    mov eax, dword ptr [edx + esi + 4]
    mov dword ptr [ecx + 8], eax
L3:
    fld dword ptr [edx + esi + 4]
    fcomp dword ptr [ecx + 20]
    fnstsw ax
    test ah, 65
    jne L4
    mov eax, dword ptr [edx + esi + 4]
    mov dword ptr [ecx + 20], eax
L4:
    fld dword ptr [edx + esi + 8]
    fcomp dword ptr [ecx + 12]
    fnstsw ax
    test ah, 5
    jp L5
    mov eax, dword ptr [edx + esi + 8]
    mov dword ptr [ecx + 12], eax
L5:
    fld dword ptr [edx + esi + 8]
    fcomp dword ptr [ecx + 24]
    fnstsw ax
    test ah, 65
    jne L6
    mov eax, dword ptr [edx + esi + 8]
    mov dword ptr [ecx + 24], eax
L6:
    mov eax, dword ptr [edx + ebp + 36]
    mov dword ptr [esp + 8], eax
    fld dword ptr [esp + 8]
    inc ebx
    fmul dword ptr [edi + 12]
    fadd dword ptr [edi + 4]
    fstp dword ptr [edx + esi + 36]
    mov eax, dword ptr [edx + ebp + 40]
    mov dword ptr [esp + 8], eax
    fld dword ptr [esp + 8]
    fmul dword ptr [edi + 16]
    fadd dword ptr [edi + 8]
    fstp dword ptr [edx + esi + 40]
    movzx edx, word ptr [ecx + 34]
    cmp ebx, edx
    jl L0
L7:
    pop ebp
    pop ebx
    pop ecx
    ret
FUN_100026c0 ENDP
END
