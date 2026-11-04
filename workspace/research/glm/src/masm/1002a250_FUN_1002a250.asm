.686
.MODEL FLAT, C
EXTRN sub_1002A275:PROC
EXTRN sub_1005DA5B:PROC
.CODE
FUN_1002a250 PROC
L0:
    sub esp, 24
    push ebx
    mov ebx, dword ptr [esp + 40]
    push ebp
    push esi
    push edi
    mov edi, dword ptr [esp + 48]
    cmp dword ptr [edi + 8], -2
    jne L4
    mov ebp, dword ptr [esp + 60]
    mov esi, dword ptr [esp + 56]
    lea ecx, [ecx]
L1:
    mov eax, dword ptr [edi + 12]
    push eax
    push ebp
    push esi
    call sub_1005DA5B
    add esp, 12
    cmp eax, 3
    jne L2
    mov ecx, dword ptr [edi + 12]
    cmp byte ptr [ecx + 16], 3
    jb L5
    mov edx, dword ptr [edi + 16]
    mov eax, dword ptr [esp + 44]
    push ebp
    push esi
    push ebx
    push edx
    push eax
    call L0
    mov edi, dword ptr [edi + 20]
    add esp, 20
    jmp L3
L2:
    mov edi, dword ptr [edi + eax*4 + 12]
L3:
    cmp dword ptr [edi + 8], -2
    je L1
L4:
    mov eax, dword ptr [edi + 8]
    test eax, eax
    jl L7
    mov esi, dword ptr [esp + 44]
    mov ecx, ebx
    call sub_1002A275
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 24
    ret
L5:
    mov eax, dword ptr [esi + 8]
    mov ecx, dword ptr [esi]
    mov edx, dword ptr [esi + 4]
    mov dword ptr [esp + 24], eax
    mov eax, dword ptr [edi + 12]
    mov dword ptr [esp + 16], ecx
    mov dword ptr [esp + 20], edx
    movzx ecx, byte ptr [eax + 16]
    mov edx, dword ptr [eax + 12]
    mov eax, dword ptr [ebp]
    mov dword ptr [esp + ecx*4 + 16], edx
    mov ecx, dword ptr [ebp + 4]
    mov edx, dword ptr [ebp + 8]
    mov dword ptr [esp + 28], eax
    mov eax, dword ptr [edi + 12]
    mov dword ptr [esp + 32], ecx
    mov dword ptr [esp + 36], edx
    movzx ecx, byte ptr [eax + 16]
    mov edx, dword ptr [eax + 12]
    mov dword ptr [esp + ecx*4 + 28], edx
    movzx eax, byte ptr [eax + 16]
    shl eax, 2
    fld dword ptr [esp + eax + 16]
    fcomp dword ptr [eax + ebp]
    fnstsw ax
    test ah, 5
    jp L6
    mov ecx, dword ptr [edi + 16]
    mov edx, dword ptr [esp + 44]
    push ebp
    lea eax, [esp + 20]
    push eax
    push ebx
    push ecx
    push edx
    call L0
    add esp, 20
L6:
    mov ecx, dword ptr [edi + 20]
    mov edx, dword ptr [esp + 44]
    lea eax, [esp + 28]
    push eax
    push esi
    push ebx
    push ecx
    push edx
    call L0
    add esp, 20
L7:
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 24
    ret
FUN_1002a250 ENDP
END
