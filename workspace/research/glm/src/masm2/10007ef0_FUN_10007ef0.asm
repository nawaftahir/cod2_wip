.686
.MODEL FLAT, C
EXTRN sub_10008123:PROC
EXTRN sub_10008158:PROC
EXTRN sub_100081A4:PROC
EXTRN sub_100081B0:PROC
EXTRN sub_100081C8:PROC
EXTRN sub_100081E1:PROC
EXTRN sub_100081F3:PROC
EXTRN sub_1000824D:PROC
EXTRN EXTRN g_1019BDE4:DWORD:DWORD
EXTRN EXTRN g_1019BE58:DWORD:DWORD
.CODE
FUN_10007ef0 PROC
    sub sub esp, 028Ch
    push push ebx
    mov mov ebx, dword ptr [esp + 0298h]
    push push ebp
    push push esi
    mov mov esi, eax
    mov mov eax, dword ptr [ebx]
    push push edi
    xor xor edi, edi
    xor xor ebp, ebp
    xor xor ecx, ecx
    test test eax, eax
    jle L0
    mov mov edx, dword ptr [esp + 02A0h]
    add add edx, 4
    lea lea esp, [esp]
    fld fld dword ptr [edx + 4]
    mov mov byte ptr [esp + ecx + 20], 2
    fmul fmul dword ptr [esi + 8]
    fld fld dword ptr [edx - 4]
    fmul fmul dword ptr [esi]
    faddp faddp st(1)
    fld fld dword ptr [esi + 4]
    fmul fmul dword ptr [edx]
    faddp faddp st(1)
    fadd fadd dword ptr [esi + 12]
    fsub fsub dword ptr [g_1019BDE4]
    fcom fcom dword ptr [g_1019BE58]
    fst fst dword ptr [esp + ecx*4 + 098h]
    fnstsw fnstsw ax
    test test ah, 5
    jp L2
    fstp fstp st(0)
    mov mov byte ptr [esp + ecx + 20], 1
    inc inc ebp
    jmp L3
    fcomp fcomp dword ptr [g_1019BDE4]
    fnstsw fnstsw ax
    test test ah, 65
    jne L4
    mov mov byte ptr [esp + ecx + 20], 0
    inc inc edi
    mov mov eax, dword ptr [ebx]
    inc inc ecx
    add add edx, 12
    cmp cmp ecx, eax
    jl L1
    test test edi, edi
    jne L5
    pop pop edi
    pop pop esi
    pop pop ebp
    mov mov dword ptr [ebx], 0
    xor xor eax, eax
    pop pop ebx
    add add esp, 028Ch
    ret ret
    test test ebp, ebp
    jne L6
    mov mov eax, dword ptr [esp + 02A0h]
    pop pop edi
L0:
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 028Ch
    ret ret
    mov mov al, byte ptr [esp + 20]
    fld fld dword ptr [esp + 098h]
    mov mov esi, dword ptr [esp + 02A8h]
    fstp fstp dword ptr [esp + ecx*4 + 098h]
    mov mov byte ptr [esp + ecx + 20], al
    mov mov ecx, dword ptr [esp + 02A0h]
    mov mov eax, 1
    lea lea edx, [esp + 20]
    xor xor ebp, ebp
    xor xor edi, edi
    add add ecx, 8
    sub sub eax, edx
    mov mov dword ptr [esp + 16], eax
    cmp cmp ebp, 080h
    jge sub_100081B0
L4:
    mov mov dl, byte ptr [esp + edi + 20]
    cmp cmp dl, 2
    lea lea eax, [esp + edi + 20]
    jne sub_10008123
    mov mov eax, dword ptr [ecx - 8]
    mov mov dword ptr [esi], eax
    mov mov edx, dword ptr [ecx - 4]
    mov mov dword ptr [esi + 4], edx
    mov mov eax, dword ptr [ecx]
    mov mov dword ptr [esi + 8], eax
    inc inc ebp
    add add esi, 12
    jmp sub_100081C8
    test test dl, dl
    jne sub_10008158
    mov mov ebx, dword ptr [ecx - 8]
    mov mov dword ptr [esi], ebx
    mov mov ebx, dword ptr [ecx - 4]
    mov mov dword ptr [esi + 4], ebx
L5:
    mov mov ebx, dword ptr [ecx]
    mov mov dword ptr [esi + 8], ebx
    inc inc ebp
    add add esi, 12
    mov mov bl, byte ptr [eax + 1]
    cmp cmp bl, 2
    je sub_100081E1
    cmp cmp bl, dl
    mov mov ebx, dword ptr [esp + 02A4h]
    je sub_100081F3
    mov mov edx, dword ptr [esp + 16]
    fld fld dword ptr [esp + edi*4 + 098h]
    fsub fsub dword ptr [esp + edi*4 + 09Ch]
    add add eax, edx
    cdq cdq
    idiv idiv dword ptr [ebx]
    inc inc ebp
    fdivr fdivr dword ptr [esp + edi*4 + 098h]
    add add esi, 12
    lea lea eax, [edx + edx*2]
    mov mov edx, dword ptr [esp + 02A0h]
    lea lea eax, [edx + eax*4]
    fld fld dword ptr [eax]
    fsub fsub dword ptr [ecx - 8]
    fmul fmul st(1)
    fadd fadd dword ptr [ecx - 8]
    fstp fstp dword ptr [esi - 12]
    fld fld dword ptr [eax + 4]
    fsub fsub dword ptr [ecx - 4]
    fmul fmul st(1)
    fadd fadd dword ptr [ecx - 4]
    fstp fstp dword ptr [esi - 8]
    fld fld dword ptr [eax + 8]
    fsub fsub dword ptr [ecx]
    fmul fmul st(1)
    fadd fadd dword ptr [ecx]
    fstp fstp dword ptr [esi - 4]
    fstp fstp st(0)
    jmp sub_1000824D
    mov mov ebx, dword ptr [esp + 02A4h]
    mov mov eax, dword ptr [ebx]
    inc inc edi
    add add ecx, 12
    cmp cmp edi, eax
    jl sub_100081A4
    mov mov eax, dword ptr [esp + 02A8h]
    pop pop edi
    pop pop esi
    mov mov dword ptr [ebx], ebp
    pop pop ebp
    pop pop ebx
    add add esp, 028Ch
    ret ret
FUN_10007ef0 ENDP
END
