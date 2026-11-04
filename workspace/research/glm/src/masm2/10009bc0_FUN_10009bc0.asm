.686
.MODEL FLAT, C
EXTRN sub_10007EB2:PROC
EXTRN sub_100097AB:PROC
EXTRN sub_10009B37:PROC
EXTRN sub_10009CFD:PROC
EXTRN sub_10009D02:PROC
EXTRN sub_10009D0B:PROC
EXTRN sub_10009D12:PROC
EXTRN sub_10009D49:PROC
EXTRN sub_10009D5E:PROC
EXTRN sub_10009D67:PROC
EXTRN sub_10009D86:PROC
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_101CE5D0:DWORD:DWORD
EXTRN EXTRN g_101CE5D4:DWORD:DWORD
EXTRN EXTRN g_101CE5D8:DWORD:DWORD
EXTRN EXTRN g_101CE5DC:DWORD:DWORD
.CODE
FUN_10009bc0 PROC
    sub sub esp, 8
    mov mov eax, dword ptr [esp + 12]
    mov mov edx, dword ptr [eax + 32]
    xor xor ecx, ecx
    cmp cmp edx, ecx
    mov mov dword ptr [esp + 4], ecx
    jle sub_10009CFD
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 40]
    push push esi
    push push edi
    mov mov edi, dword ptr [esp + 52]
    mov mov dword ptr [esp + 16], ecx
    jmp L0
    lea lea ebx, [ebx]
    mov mov ebx, dword ptr [eax + 36]
    add add ebx, dword ptr [esp + 16]
    xor xor eax, eax
    test test edi, edi
    jle L1
    mov mov ecx, dword ptr [ebx + 28]
    cmp cmp ecx, dword ptr [ebp + eax*4]
    je sub_10009D02
    inc inc eax
    cmp cmp eax, edi
    jl L2
    mov mov al, byte ptr [ebx + 1]
    test test al, al
    jne sub_10009D12
L0:
    fld fld dword ptr [g_101CE5D4]
    fmul fmul dword ptr [ebx + 12]
    fld fld dword ptr [g_101CE5D8]
    fmul fmul dword ptr [ebx + 16]
    faddp faddp st(1)
    fld fld dword ptr [g_101CE5DC]
    fmul fmul dword ptr [ebx + 20]
    faddp faddp st(1)
    fld fld dword ptr [g_101CE5D0]
    fmul fmul dword ptr [ebx + 8]
    faddp faddp st(1)
    fcomp fcomp dword ptr [g_1019BC84]
    fnstsw fnstsw ax
L1:
    test test ah, 65
L2:
    je sub_10009D49
    mov mov esi, dword ptr [esp + 40]
    mov mov edx, dword ptr [esp + 36]
    mov mov ecx, esi
    mov mov eax, ebx
    call sub_10007EB2
    test test al, al
    jne sub_10009D5E
    call sub_100097AB
    test test al, al
    jne sub_10009D67
    mov mov eax, dword ptr [esp + 36]
    mov mov ecx, dword ptr [esp + 32]
    push push 0
    push push esi
    mov mov esi, dword ptr [esp + 52]
    push push eax
    push push ecx
    mov mov eax, ebx
    call sub_10009B37
    add add esp, 16
    test test eax, eax
    je sub_10009D86
    mov mov edx, dword ptr [ebx + 28]
    mov mov ecx, dword ptr [esp + 40]
    mov mov dword ptr [ebp + edi*4], edx
    mov mov edx, dword ptr [esp + 36]
    inc inc edi
    push push edi
    push push ebp
    mov mov eax, esi
    push push eax
    mov mov eax, dword ptr [esp + 44]
    push push ecx
    mov mov ecx, dword ptr [ebx + 28]
    push push edx
    push push eax
    push push ecx
    call L3
L3:
    add add esp, 28
    mov mov edi, eax
    mov mov ecx, dword ptr [esp + 20]
    mov mov esi, dword ptr [esp + 16]
    mov mov eax, dword ptr [esp + 28]
    mov mov edx, dword ptr [eax + 32]
    inc inc ecx
    add add esi, 68
    cmp cmp ecx, edx
    mov mov dword ptr [esp + 20], ecx
    mov mov dword ptr [esp + 16], esi
    jl sub_10009D0B
    mov mov eax, edi
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 8
    ret ret
FUN_10009bc0 ENDP
END
