.686
.MODEL FLAT, C
EXTRN sub_10007ABB:PROC
EXTRN sub_10007F14:PROC
EXTRN sub_100092D6:PROC
EXTRN sub_100096CB:PROC
EXTRN sub_10009811:PROC
EXTRN sub_1000993A:PROC
EXTRN sub_10009CE1:PROC
EXTRN sub_10009D5C:PROC
EXTRN sub_1005D978:PROC
EXTRN g_1019BC84:DWORD
EXTRN g_1019BF38:DWORD
EXTRN g_101CE5D0:DWORD
EXTRN g_101CE5D4:DWORD
EXTRN g_101CE5D8:DWORD
EXTRN g_101CE5DC:DWORD
EXTRN g_101CE5EC:DWORD
.CODE
FUN_10009df0 PROC
L0:
    sub esp, 12
    push ebx
    mov ebx, dword ptr [esp + 32]
    push ebp
    mov ebp, dword ptr [esp + 40]
    push esi
    mov esi, dword ptr [esp + 28]
    push edi
    push ebp
    push ebx
    push esi
    call sub_10007ABB
    add esp, 12
    push ebp
    push ebx
    push esi
    call sub_100092D6
    mov al, byte ptr [g_101CE5EC]
    add esp, 12
    test al, al
    je L1
    mov edi, ebp
    mov ecx, esi
    call sub_100096CB
L1:
    mov edx, dword ptr [esp + 36]
    xor edi, edi
    cmp edx, edi
    mov eax, edx
    je L3
    mov cl, 1
    lea esp, [esp]
L2:
    mov byte ptr [eax + 1], cl
    mov eax, dword ptr [eax + 4]
    cmp eax, edi
    jne L2
L3:
    cmp dword ptr [esp + 52], edi
    jne L5
    mov edx, dword ptr [esp + 40]
    push esi
    mov edi, ebp
    call sub_10009D5C
    mov eax, dword ptr [esp + 40]
    xor ecx, ecx
    add esp, 4
    cmp eax, ecx
    je L12
    lea ecx, [ecx]
L4:
    mov byte ptr [eax + 1], cl
    mov eax, dword ptr [eax + 4]
    cmp eax, ecx
    jne L4
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 12
    ret
L5:
    cmp dword ptr [esi + 32], edi
    mov dword ptr [esp + 24], edi
    jle L10
    mov dword ptr [esp + 20], edi
L6:
    mov ebx, dword ptr [esi + 36]
    mov ecx, dword ptr [esp + 20]
    mov al, byte ptr [ebx + ecx + 1]
    add ebx, ecx
    test al, al
    jne L9
    fld dword ptr [g_101CE5D4]
    lea esi, [ebx + 8]
    fmul dword ptr [esi + 4]
    fld dword ptr [g_101CE5D8]
    fmul dword ptr [esi + 8]
    faddp st(1)
    fld dword ptr [g_101CE5DC]
    fmul dword ptr [esi + 12]
    faddp st(1)
    fld dword ptr [g_101CE5D0]
    fmul dword ptr [esi]
    faddp st(1)
    fcomp dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 65
    je L9
    mov edi, dword ptr [esp + 44]
    mov ecx, ebp
    mov edx, edi
    mov eax, ebx
    call sub_10007F14
    test al, al
    jne L9
    call sub_10009811
    test al, al
    jne L9
    fld dword ptr [g_1019BC84]
    fld dword ptr [g_101CE5DC]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L7
    fld dword ptr [g_101CE5D4]
    fmul dword ptr [esi + 4]
    fld dword ptr [g_101CE5D8]
    fmul dword ptr [esi + 8]
    faddp st(1)
    fld dword ptr [g_101CE5DC]
    fmul dword ptr [esi + 12]
    faddp st(1)
    fld dword ptr [g_101CE5D0]
    fmul dword ptr [esi]
    faddp st(1)
    fcomp dword ptr [g_1019BF38]
    fnstsw ax
    test ah, 65
    jne L7
    movzx eax, byte ptr [ebx + 36]
    mov edi, dword ptr [ebx + 32]
    push 0101CE5D0h
    push eax
    mov ecx, esi
    call sub_1005D978
    add esp, 8
    test eax, eax
    je L9
    mov ecx, dword ptr [esp + 52]
    mov edx, dword ptr [esp + 44]
    mov eax, dword ptr [ebx + 28]
    push ecx
    push ebp
    push edx
    push esi
    push ebx
    push eax
    mov dword ptr [ebx + 4], 0
    call L0
    add esp, 24
    jmp L9
L7:
    mov ecx, dword ptr [esp + 40]
    push ecx
    mov edx, edi
    mov ecx, ebp
    mov edi, ebx
    call sub_10009CE1
    add esp, 4
    test al, al
    je L9
    cmp byte ptr [ebx], 0
    jne L8
    mov edx, dword ptr [esp + 36]
    push ebx
    mov dword ptr [ebx + 4], edx
    call sub_1000993A
    add esp, 4
    jmp L9
L8:
    mov eax, dword ptr [esp + 36]
    cmp dword ptr [ebx + 4], eax
    je L9
    mov dword ptr [ebx + 4], 0
L9:
    mov eax, dword ptr [esp + 24]
    mov edx, dword ptr [esp + 20]
    mov esi, dword ptr [esp + 32]
    mov ecx, dword ptr [esi + 32]
    inc eax
    add edx, 68
    cmp eax, ecx
    mov dword ptr [esp + 24], eax
    mov dword ptr [esp + 20], edx
    jl L6
    mov edx, dword ptr [esp + 36]
L10:
    test edx, edx
    mov eax, edx
    je L12
    lea esp, [esp]
L11:
    mov byte ptr [eax + 1], 0
    mov eax, dword ptr [eax + 4]
    test eax, eax
    jne L11
L12:
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 12
    ret
FUN_10009df0 ENDP
END
