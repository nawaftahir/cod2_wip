.686
.MODEL FLAT, C
EXTRN sub_10007EB2:PROC
EXTRN sub_100097AB:PROC
EXTRN sub_10009B37:PROC
EXTRN g_1019BC84:DWORD
EXTRN g_101CE5D0:DWORD
EXTRN g_101CE5D4:DWORD
EXTRN g_101CE5D8:DWORD
EXTRN g_101CE5DC:DWORD
.CODE
FUN_10009bc0 PROC
L0:
    sub esp, 8
    mov eax, dword ptr [esp + 12]
    mov edx, dword ptr [eax + 32]
    xor ecx, ecx
    cmp edx, ecx
    mov dword ptr [esp + 4], ecx
    jle L5
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 40]
    push esi
    push edi
    mov edi, dword ptr [esp + 52]
    mov dword ptr [esp + 16], ecx
    jmp L1
    lea ebx, [ebx]
L1:
    mov ebx, dword ptr [eax + 36]
    add ebx, dword ptr [esp + 16]
    xor eax, eax
    test edi, edi
    jle L3
    mov ecx, dword ptr [ebx + 28]
L2:
    cmp ecx, dword ptr [ebp + eax*4]
    je L4
    inc eax
    cmp eax, edi
    jl L2
L3:
    mov al, byte ptr [ebx + 1]
    test al, al
    jne L4
    fld dword ptr [g_101CE5D4]
    fmul dword ptr [ebx + 12]
    fld dword ptr [g_101CE5D8]
    fmul dword ptr [ebx + 16]
    faddp st(1)
    fld dword ptr [g_101CE5DC]
    fmul dword ptr [ebx + 20]
    faddp st(1)
    fld dword ptr [g_101CE5D0]
    fmul dword ptr [ebx + 8]
    faddp st(1)
    fcomp dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 65
    je L4
    mov esi, dword ptr [esp + 40]
    mov edx, dword ptr [esp + 36]
    mov ecx, esi
    mov eax, ebx
    call sub_10007EB2
    test al, al
    jne L4
    call sub_100097AB
    test al, al
    jne L4
    mov eax, dword ptr [esp + 36]
    mov ecx, dword ptr [esp + 32]
    push 0
    push esi
    mov esi, dword ptr [esp + 52]
    push eax
    push ecx
    mov eax, ebx
    call sub_10009B37
    add esp, 16
    test eax, eax
    je L4
    mov edx, dword ptr [ebx + 28]
    mov ecx, dword ptr [esp + 40]
    mov dword ptr [ebp + edi*4], edx
    mov edx, dword ptr [esp + 36]
    inc edi
    push edi
    push ebp
    mov eax, esi
    push eax
    mov eax, dword ptr [esp + 44]
    push ecx
    mov ecx, dword ptr [ebx + 28]
    push edx
    push eax
    push ecx
    call L0
    add esp, 28
    mov edi, eax
L4:
    mov ecx, dword ptr [esp + 20]
    mov esi, dword ptr [esp + 16]
    mov eax, dword ptr [esp + 28]
    mov edx, dword ptr [eax + 32]
    inc ecx
    add esi, 68
    cmp ecx, edx
    mov dword ptr [esp + 20], ecx
    mov dword ptr [esp + 16], esi
    jl L1
    mov eax, edi
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 8
    ret
FUN_10009bc0 ENDP
END
