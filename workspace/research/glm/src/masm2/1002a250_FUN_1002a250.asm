.686
.MODEL FLAT, C
EXTRN sub_1002A3C1:PROC
EXTRN sub_1002A416:PROC
EXTRN sub_1005DA5B:PROC
.CODE
FUN_1002a250 PROC
    sub sub esp, 24
    push push ebx
    mov mov ebx, dword ptr [esp + 40]
    push push ebp
    push push esi
    push push edi
    mov mov edi, dword ptr [esp + 48]
    cmp cmp dword ptr [edi + 8], -2
    jne L2
    mov mov ebp, dword ptr [esp + 60]
    mov mov esi, dword ptr [esp + 56]
    lea lea ecx, [ecx]
    mov mov eax, dword ptr [edi + 12]
    push push eax
    push push ebp
L0:
    push push esi
    call sub_1005DA5B
    add add esp, 12
    cmp cmp eax, 3
    jne L4
    mov mov ecx, dword ptr [edi + 12]
    cmp cmp byte ptr [ecx + 16], 3
    jb L6
    mov mov edx, dword ptr [edi + 16]
    mov mov eax, dword ptr [esp + 44]
    push push ebp
    push push esi
    push push ebx
    push push edx
    push push eax
    call L1
L1:
    mov mov edi, dword ptr [edi + 20]
    add add esp, 20
    jmp L5
    mov mov edi, dword ptr [edi + eax*4 + 12]
    cmp cmp dword ptr [edi + 8], -2
    je L3
    mov mov eax, dword ptr [edi + 8]
    test test eax, eax
    jl sub_1002A3C1
    mov mov esi, dword ptr [esp + 44]
    mov mov ecx, ebx
    call L0
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 24
    ret ret
    mov mov eax, dword ptr [esi + 8]
    mov mov ecx, dword ptr [esi]
    mov mov edx, dword ptr [esi + 4]
    mov mov dword ptr [esp + 24], eax
    mov mov eax, dword ptr [edi + 12]
    mov mov dword ptr [esp + 16], ecx
    mov mov dword ptr [esp + 20], edx
    movzx movzx ecx, byte ptr [eax + 16]
    mov mov edx, dword ptr [eax + 12]
    mov mov eax, dword ptr [ebp]
    mov mov dword ptr [esp + ecx*4 + 16], edx
    mov mov ecx, dword ptr [ebp + 4]
    mov mov edx, dword ptr [ebp + 8]
    mov mov dword ptr [esp + 28], eax
    mov mov eax, dword ptr [edi + 12]
    mov mov dword ptr [esp + 32], ecx
    mov mov dword ptr [esp + 36], edx
    movzx movzx ecx, byte ptr [eax + 16]
    mov mov edx, dword ptr [eax + 12]
    mov mov dword ptr [esp + ecx*4 + 28], edx
    movzx movzx eax, byte ptr [eax + 16]
    shl shl eax, 2
    fld fld dword ptr [esp + eax + 16]
    fcomp fcomp dword ptr [eax + ebp]
    fnstsw fnstsw ax
    test test ah, 5
    jp sub_1002A416
    mov mov ecx, dword ptr [edi + 16]
    mov mov edx, dword ptr [esp + 44]
    push push ebp
    lea lea eax, [esp + 20]
    push push eax
    push push ebx
    push push ecx
    push push edx
    call L7
L7:
    add add esp, 20
    mov mov ecx, dword ptr [edi + 20]
    mov mov edx, dword ptr [esp + 44]
    lea lea eax, [esp + 28]
    push push eax
    push push esi
    push push ebx
    push push ecx
    push push edx
    call L8
L8:
    add add esp, 20
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 24
    ret ret
FUN_1002a250 ENDP
END
