.686
.MODEL FLAT, C
EXTRN sub_10015585:PROC
EXTRN sub_1001573F:PROC
EXTRN sub_1001574C:PROC
EXTRN sub_10015757:PROC
EXTRN sub_1001576B:PROC
EXTRN sub_1001577C:PROC
EXTRN sub_1001578D:PROC
EXTRN sub_1001579E:PROC
EXTRN sub_100157AF:PROC
EXTRN sub_100157C4:PROC
EXTRN sub_100157C7:PROC
EXTRN sub_100157CC:PROC
EXTRN sub_100157D3:PROC
EXTRN sub_100157DB:PROC
EXTRN sub_100157E7:PROC
EXTRN sub_100157F4:PROC
EXTRN sub_10015801:PROC
EXTRN sub_1001580E:PROC
EXTRN sub_1001581B:PROC
EXTRN sub_1001588A:PROC
EXTRN EXTRN g_101D1B9C:DWORD:DWORD
EXTRN EXTRN g_101D4D20:DWORD:DWORD
.CODE
FUN_100155a0 PROC
    push push ecx
    mov mov eax, dword ptr [g_101D4D20]
    push push edi
    mov mov edi, dword ptr [esp + 12]
    cmp cmp dword ptr [edi], eax
    je sub_1001574C
    mov mov ecx, dword ptr [edi + 40]
    mov mov dword ptr [edi], eax
    xor xor eax, eax
    test test ecx, ecx
    push push esi
    mov mov dword ptr [esp + 8], eax
    jle L1
    push push ebx
    push push ebp
    lea lea esp, [esp]
    mov mov ecx, dword ptr [edi + 44]
    mov mov ebp, dword ptr [ecx + eax*4]
    mov mov edx, dword ptr [g_101D1B9C]
    mov mov eax, dword ptr [edx + 0F0h]
    mov mov esi, dword ptr [esp + 28]
    shl shl ebp, 5
    fld fld dword ptr [ebp + eax + 12]
    add add ebp, eax
    fcomp fcomp dword ptr [esi]
    fnstsw fnstsw ax
    test test ah, 5
    jnp sub_10015757
    fld fld dword ptr [ebp]
    mov mov ecx, dword ptr [esp + 32]
    fcomp fcomp dword ptr [ecx]
    fnstsw fnstsw ax
    test test ah, 65
    je sub_1001576B
    fld fld dword ptr [ebp + 16]
    fcomp fcomp dword ptr [esi + 4]
    fnstsw fnstsw ax
    test test ah, 5
    jnp sub_1001577C
    fld fld dword ptr [ebp + 4]
    fcomp fcomp dword ptr [ecx + 4]
    fnstsw fnstsw ax
    test test ah, 65
    je sub_1001578D
    fld fld dword ptr [ebp + 20]
    fcomp fcomp dword ptr [esi + 8]
    fnstsw fnstsw ax
    test test ah, 5
    jnp sub_1001579E
    fld fld dword ptr [ebp + 8]
    fcomp fcomp dword ptr [ecx + 8]
    fnstsw fnstsw ax
    test test ah, 65
    je sub_100157AF
    mov mov eax, dword ptr [ebp + 28]
    mov mov edx, dword ptr [edx + 20]
    lea lea eax, [eax + eax*2]
    lea lea edi, [edx + eax*4]
    mov mov eax, dword ptr [ebp + 24]
    xor xor ebx, ebx
    test test eax, eax
    jle sub_100157C4
    lea lea ecx, [ecx]
    mov mov eax, dword ptr [esp + 40]
    mov mov edx, dword ptr [esp + 44]
    cmp cmp dword ptr [edx], eax
    jge sub_100157D3
    mov mov eax, dword ptr [edi]
    test test byte ptr [eax + 12], 4
    jne sub_100157CC
    mov mov edx, dword ptr [edi + 8]
    fld fld dword ptr [edx + 16]
    fcomp fcomp dword ptr [esi]
    fnstsw fnstsw ax
    test test ah, 5
    jnp sub_100157DB
    fld fld dword ptr [edx + 4]
    fcomp fcomp dword ptr [ecx]
    fnstsw fnstsw ax
    test test ah, 65
    je sub_100157E7
    fld fld dword ptr [edx + 20]
    fcomp fcomp dword ptr [esi + 4]
    fnstsw fnstsw ax
    test test ah, 5
    jnp sub_100157F4
    fld fld dword ptr [edx + 8]
    fcomp fcomp dword ptr [ecx + 4]
    fnstsw fnstsw ax
    test test ah, 65
    je sub_10015801
    fld fld dword ptr [edx + 24]
    fcomp fcomp dword ptr [esi + 8]
    fnstsw fnstsw ax
    test test ah, 5
    jnp sub_1001580E
    fld fld dword ptr [edx + 12]
    fcomp fcomp dword ptr [ecx + 8]
    fnstsw fnstsw ax
    test test ah, 65
    je sub_1001581B
    mov mov ecx, dword ptr [esp + 44]
    mov mov esi, dword ptr [esp + 36]
    call L0
    mov mov esi, dword ptr [esp + 28]
    mov mov ecx, dword ptr [esp + 32]
    mov mov eax, dword ptr [ebp + 24]
    inc inc ebx
    add add edi, 12
    cmp cmp ebx, eax
    jl sub_100157C7
    mov mov edi, dword ptr [esp + 24]
    mov mov eax, dword ptr [esp + 16]
    mov mov ecx, dword ptr [edi + 40]
    inc inc eax
    cmp cmp eax, ecx
    mov mov dword ptr [esp + 16], eax
    jl sub_1001573F
    pop pop ebp
    pop pop ebx
    jmp sub_1001588A
    mov mov esi, dword ptr [esp + 20]
    mov mov ecx, dword ptr [esp + 36]
    mov mov edx, dword ptr [esp + 32]
    mov mov eax, dword ptr [esp + 28]
    push push ecx
    mov mov ecx, dword ptr [esp + 28]
    push push edx
    mov mov edx, dword ptr [edi + 28]
    push push eax
    push push ecx
    push push esi
    push push edx
    call sub_10015585
    add add esp, 24
    pop pop esi
    pop pop edi
L1:
    pop pop ecx
    ret ret
FUN_100155a0 ENDP
END
