.686
.MODEL FLAT, C
EXTRN sub_100085D0:PROC
EXTRN sub_10008788:PROC
EXTRN sub_1000882A:PROC
EXTRN sub_10008841:PROC
EXTRN sub_1000887A:PROC
EXTRN sub_1005DA5B:PROC
EXTRN EXTRN g_101D1B9C:DWORD:DWORD
.CODE
FUN_10008600 PROC
    sub sub esp, 24
    push push ebx
    mov mov ebx, dword ptr [esp + 40]
    push push ebp
    push push esi
    mov mov esi, dword ptr [esp + 40]
    mov mov eax, dword ptr [esi + 8]
    mov mov ebp, -2
    cmp cmp eax, ebp
    push push edi
    mov mov edi, dword ptr [esp + 56]
    jne L0
    nop nop
    mov mov eax, dword ptr [esi + 12]
    push push eax
    push push edi
    push push ebx
    call sub_1005DA5B
    add add esp, 12
    cmp cmp eax, 3
    je L2
    mov mov esi, dword ptr [esi + eax*4 + 12]
    cmp cmp dword ptr [esi + 8], ebp
    je L1
    mov mov eax, dword ptr [esi + 8]
    test test eax, eax
    jl L3
    mov mov ecx, dword ptr [g_101D1B9C]
    imul imul eax, eax, 60
    add add eax, dword ptr [ecx + 0100h]
    push push eax
    mov mov edx, ebx
    mov mov ebx, dword ptr [esp + 52]
    mov mov eax, edi
L0:
    call sub_100085D0
    add add esp, 4
    mov mov eax, dword ptr [esi + 8]
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 24
    ret ret
    mov mov edx, dword ptr [esi + 12]
    cmp cmp byte ptr [edx + 16], 3
    jae sub_10008788
    mov mov eax, dword ptr [ebx]
    mov mov ecx, dword ptr [ebx + 4]
    mov mov edx, dword ptr [ebx + 8]
    mov mov dword ptr [esp + 16], eax
    mov mov eax, dword ptr [esi + 12]
    mov mov dword ptr [esp + 20], ecx
    mov mov dword ptr [esp + 24], edx
    movzx movzx ecx, byte ptr [eax + 16]
    mov mov edx, dword ptr [eax + 12]
    mov mov eax, dword ptr [edi]
    mov mov dword ptr [esp + ecx*4 + 16], edx
    mov mov ecx, dword ptr [edi + 4]
    mov mov edx, dword ptr [edi + 8]
    mov mov dword ptr [esp + 28], eax
    mov mov eax, dword ptr [esi + 12]
    mov mov dword ptr [esp + 32], ecx
    mov mov dword ptr [esp + 36], edx
    movzx movzx ecx, byte ptr [eax + 16]
    mov mov edx, dword ptr [eax + 12]
    lea lea eax, [esp + 28]
    push push eax
    mov mov dword ptr [esp + ecx*4 + 32], edx
    mov mov ecx, dword ptr [esp + 52]
    mov mov edx, dword ptr [esi + 20]
    push push ebx
    push push ecx
    push push edx
    call L4
L4:
    mov mov ebx, eax
    mov mov eax, dword ptr [esi + 12]
    movzx movzx eax, byte ptr [eax + 16]
    shl shl eax, 2
    add add esp, 16
    mov mov ebp, ebx
    fld fld dword ptr [esp + eax + 16]
    fcomp fcomp dword ptr [eax + edi]
    fnstsw fnstsw ax
    test test ah, 5
    jp sub_1000882A
    mov mov edx, dword ptr [esp + 48]
    mov mov eax, dword ptr [esi + 16]
    push push edi
    lea lea ecx, [esp + 20]
    push push ecx
    push push edx
    push push eax
    call L5
L5:
    add add esp, 16
    mov mov ebp, eax
    jmp sub_10008841
    mov mov ecx, dword ptr [esp + 48]
    mov mov edx, dword ptr [esi + 16]
    push push edi
    push push ebx
    push push ecx
    push push edx
    call L6
L6:
    mov mov ecx, dword ptr [esi + 20]
    push push edi
    mov mov ebp, eax
    mov mov eax, dword ptr [esp + 68]
    push push ebx
    push push eax
    push push ecx
    call L7
L7:
    add add esp, 32
    mov mov ebx, eax
    cmp cmp ebp, ebx
    jne sub_1000887A
    pop pop edi
    pop pop esi
    mov mov eax, ebp
    pop pop ebp
    pop pop ebx
    add add esp, 24
    ret ret
    pop pop edi
    pop pop esi
    pop pop ebp
    mov mov eax, -2
    pop pop ebx
    add add esp, 24
    ret ret
FUN_10008600 ENDP
END
