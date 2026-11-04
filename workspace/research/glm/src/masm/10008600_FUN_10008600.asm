.686
.MODEL FLAT, C
EXTRN sub_100085D0:PROC
EXTRN sub_1005DA5B:PROC
EXTRN g_101D1B9C:DWORD
.CODE
FUN_10008600 PROC
L0:
    sub esp, 24
    push ebx
    mov ebx, dword ptr [esp + 40]
    push ebp
    push esi
    mov esi, dword ptr [esp + 40]
    mov eax, dword ptr [esi + 8]
    mov ebp, 0FFFFFFFEh
    cmp eax, ebp
    push edi
    mov edi, dword ptr [esp + 56]
    jne L2
    nop
L1:
    mov eax, dword ptr [esi + 12]
    push eax
    push edi
    push ebx
    call sub_1005DA5B
    add esp, 12
    cmp eax, 3
    je L4
    mov esi, dword ptr [esi + eax*4 + 12]
    cmp dword ptr [esi + 8], ebp
    je L1
L2:
    mov eax, dword ptr [esi + 8]
    test eax, eax
    jl L3
    mov ecx, dword ptr [g_101D1B9C]
    imul eax, eax, 60
    add eax, dword ptr [ecx + 000000100h]
    push eax
    mov edx, ebx
    mov ebx, dword ptr [esp + 52]
    mov eax, edi
    call sub_100085D0
    add esp, 4
L3:
    mov eax, dword ptr [esi + 8]
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 24
    ret
L4:
    mov edx, dword ptr [esi + 12]
    cmp byte ptr [edx + 16], 3
    jae L5
    mov eax, dword ptr [ebx]
    mov ecx, dword ptr [ebx + 4]
    mov edx, dword ptr [ebx + 8]
    mov dword ptr [esp + 16], eax
    mov eax, dword ptr [esi + 12]
    mov dword ptr [esp + 20], ecx
    mov dword ptr [esp + 24], edx
    movzx ecx, byte ptr [eax + 16]
    mov edx, dword ptr [eax + 12]
    mov eax, dword ptr [edi]
    mov dword ptr [esp + ecx*4 + 16], edx
    mov ecx, dword ptr [edi + 4]
    mov edx, dword ptr [edi + 8]
    mov dword ptr [esp + 28], eax
    mov eax, dword ptr [esi + 12]
    mov dword ptr [esp + 32], ecx
    mov dword ptr [esp + 36], edx
    movzx ecx, byte ptr [eax + 16]
    mov edx, dword ptr [eax + 12]
    lea eax, [esp + 28]
    push eax
    mov dword ptr [esp + ecx*4 + 32], edx
    mov ecx, dword ptr [esp + 52]
    mov edx, dword ptr [esi + 20]
    push ebx
    push ecx
    push edx
    call L0
    mov ebx, eax
    mov eax, dword ptr [esi + 12]
    movzx eax, byte ptr [eax + 16]
    shl eax, 2
    add esp, 16
    mov ebp, ebx
    fld dword ptr [esp + eax + 16]
    fcomp dword ptr [eax + edi]
    fnstsw ax
    test ah, 5
    jp L7
    mov edx, dword ptr [esp + 48]
    mov eax, dword ptr [esi + 16]
    push edi
    lea ecx, [esp + 20]
    push ecx
    push edx
    push eax
    call L0
    add esp, 16
    mov ebp, eax
    jmp L6
L5:
    mov ecx, dword ptr [esp + 48]
    mov edx, dword ptr [esi + 16]
    push edi
    push ebx
    push ecx
    push edx
    call L0
    mov ecx, dword ptr [esi + 20]
    push edi
    mov ebp, eax
    mov eax, dword ptr [esp + 68]
    push ebx
    push eax
    push ecx
    call L0
    add esp, 32
    mov ebx, eax
L6:
    cmp ebp, ebx
    jne L8
L7:
    pop edi
    pop esi
    mov eax, ebp
    pop ebp
    pop ebx
    add esp, 24
    ret
L8:
    pop edi
    pop esi
    pop ebp
    mov eax, 0FFFFFFFEh
    pop ebx
    add esp, 24
    ret
FUN_10008600 ENDP
END
