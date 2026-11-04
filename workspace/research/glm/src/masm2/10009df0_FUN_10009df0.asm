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
EXTRN sub_1000A087:PROC
EXTRN sub_1000A088:PROC
EXTRN sub_1000A095:PROC
EXTRN sub_1000A0BF:PROC
EXTRN sub_1000A0C4:PROC
EXTRN sub_1000A0DB:PROC
EXTRN sub_1000A0E8:PROC
EXTRN sub_1000A0F5:PROC
EXTRN sub_1000A14E:PROC
EXTRN sub_1000A170:PROC
EXTRN sub_1000A17C:PROC
EXTRN sub_1000A187:PROC
EXTRN sub_1000A19E:PROC
EXTRN sub_1000A1A7:PROC
EXTRN sub_1000A217:PROC
EXTRN sub_1000A21B:PROC
EXTRN sub_1005D978:PROC
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_1019BF38:DWORD:DWORD
EXTRN EXTRN g_101CE5D0:DWORD:DWORD
EXTRN EXTRN g_101CE5D4:DWORD:DWORD
EXTRN EXTRN g_101CE5D8:DWORD:DWORD
EXTRN EXTRN g_101CE5DC:DWORD:DWORD
EXTRN EXTRN g_101CE5EC:DWORD:DWORD
.CODE
FUN_10009df0 PROC
    sub sub esp, 12
    push push ebx
    mov mov ebx, dword ptr [esp + 32]
    push push ebp
    mov mov ebp, dword ptr [esp + 40]
    push push esi
    mov mov esi, dword ptr [esp + 28]
    push push edi
    push push ebp
    push push ebx
    push push esi
    call sub_10007ABB
    add add esp, 12
    push push ebp
    push push ebx
    push push esi
    call sub_100092D6
    mov mov al, byte ptr [g_101CE5EC]
    add add esp, 12
    test test al, al
    je L0
    mov mov edi, ebp
    mov mov ecx, esi
    call sub_100096CB
    mov mov edx, dword ptr [esp + 36]
    xor xor edi, edi
    cmp cmp edx, edi
    mov mov eax, edx
    je L1
    mov mov cl, 1
    lea lea esp, [esp]
    mov mov byte ptr [eax + 1], cl
    mov mov eax, dword ptr [eax + 4]
    cmp cmp eax, edi
    jne L2
    cmp cmp dword ptr [esp + 52], edi
    jne L3
    mov mov edx, dword ptr [esp + 40]
    push push esi
    mov mov edi, ebp
    call sub_10009D5C
    mov mov eax, dword ptr [esp + 40]
    xor xor ecx, ecx
    add add esp, 4
    cmp cmp eax, ecx
    je sub_1000A088
    lea lea ecx, [ecx]
    mov mov byte ptr [eax + 1], cl
    mov mov eax, dword ptr [eax + 4]
    cmp cmp eax, ecx
    jne L4
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 12
    ret ret
    cmp cmp dword ptr [esi + 32], edi
    mov mov dword ptr [esp + 24], edi
    jle sub_1000A095
    mov mov dword ptr [esp + 20], edi
    mov mov ebx, dword ptr [esi + 36]
    mov mov ecx, dword ptr [esp + 20]
L2:
    mov mov al, byte ptr [ebx + ecx + 1]
    add add ebx, ecx
    test test al, al
    jne sub_1000A087
    fld fld dword ptr [g_101CE5D4]
    lea lea esi, [ebx + 8]
    fmul fmul dword ptr [esi + 4]
    fld fld dword ptr [g_101CE5D8]
    fmul fmul dword ptr [esi + 8]
    faddp faddp st(1)
    fld fld dword ptr [g_101CE5DC]
    fmul fmul dword ptr [esi + 12]
    faddp faddp st(1)
    fld fld dword ptr [g_101CE5D0]
    fmul fmul dword ptr [esi]
    faddp faddp st(1)
    fcomp fcomp dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 65
    je sub_1000A0C4
    mov mov edi, dword ptr [esp + 44]
    mov mov ecx, ebp
    mov mov edx, edi
    mov mov eax, ebx
    call sub_10007F14
    test test al, al
    jne sub_1000A0DB
    call sub_10009811
    test test al, al
    jne sub_1000A0E8
    fld fld dword ptr [g_1019BC84]
    fld fld dword ptr [g_101CE5DC]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp sub_1000A0BF
    fld fld dword ptr [g_101CE5D4]
    fmul fmul dword ptr [esi + 4]
    fld fld dword ptr [g_101CE5D8]
    fmul fmul dword ptr [esi + 8]
    faddp faddp st(1)
    fld fld dword ptr [g_101CE5DC]
    fmul fmul dword ptr [esi + 12]
    faddp faddp st(1)
    fld fld dword ptr [g_101CE5D0]
    fmul fmul dword ptr [esi]
    faddp faddp st(1)
    fcomp fcomp dword ptr [g_1019BF38]
    fnstsw fnstsw ax
    test test ah, 65
    jne sub_1000A0F5
    movzx movzx eax, byte ptr [ebx + 36]
    mov mov edi, dword ptr [ebx + 32]
    push push 0101CE5D0h
    push push eax
    mov mov ecx, esi
    call sub_1005D978
    add add esp, 8
    test test eax, eax
    je sub_1000A14E
    mov mov ecx, dword ptr [esp + 52]
    mov mov edx, dword ptr [esp + 44]
    mov mov eax, dword ptr [ebx + 28]
    push push ecx
    push push ebp
    push push edx
    push push esi
    push push ebx
    push push eax
    mov mov dword ptr [ebx + 4], 0
    call L5
L5:
    add add esp, 24
    jmp sub_1000A170
    mov mov ecx, dword ptr [esp + 40]
    push push ecx
    mov mov edx, edi
    mov mov ecx, ebp
    mov mov edi, ebx
    call sub_10009CE1
    add add esp, 4
    test test al, al
    je sub_1000A187
    cmp cmp byte ptr [ebx], 0
    jne sub_1000A17C
    mov mov edx, dword ptr [esp + 36]
    push push ebx
    mov mov dword ptr [ebx + 4], edx
    call sub_1000993A
    add add esp, 4
    jmp sub_1000A19E
    mov mov eax, dword ptr [esp + 36]
    cmp cmp dword ptr [ebx + 4], eax
    je sub_1000A1A7
    mov mov dword ptr [ebx + 4], 0
    mov mov eax, dword ptr [esp + 24]
    mov mov edx, dword ptr [esp + 20]
    mov mov esi, dword ptr [esp + 32]
    mov mov ecx, dword ptr [esi + 32]
    inc inc eax
    add add edx, 68
    cmp cmp eax, ecx
    mov mov dword ptr [esp + 24], eax
    mov mov dword ptr [esp + 20], edx
    jl sub_1000A095
    mov mov edx, dword ptr [esp + 36]
    test test edx, edx
    mov mov eax, edx
    je sub_1000A217
    lea lea esp, [esp]
    mov mov byte ptr [eax + 1], 0
    mov mov eax, dword ptr [eax + 4]
    test test eax, eax
    jne sub_1000A21B
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 12
    ret ret
FUN_10009df0 ENDP
END
