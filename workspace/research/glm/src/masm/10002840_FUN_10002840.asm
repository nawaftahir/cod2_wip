.686
.MODEL FLAT, C
EXTRN g_101AE298:DWORD
EXTRN g_101AE29C:DWORD
.CODE
FUN_10002840 PROC
    push ecx
    xor eax, eax
    mov dword ptr [esi], eax
    mov dword ptr [esi + 4], eax
    mov dword ptr [esi + 8], eax
    mov dword ptr [edx], eax
    mov dword ptr [edx + 4], eax
    mov dword ptr [edx + 8], eax
    mov ecx, dword ptr [g_101AE298]
    push ebx
    xor bl, bl
    cmp ecx, eax
    mov dword ptr [esp + 4], eax
    jle L8
    push ebp
    push edi
    xor edi, edi
    lea esp, [esp]
L0:
    test bl, bl
    mov eax, dword ptr [g_101AE29C]
    mov ecx, dword ptr [edi + eax + 8]
    jne L1
    lea eax, [ecx + 4]
    mov ebp, dword ptr [eax]
    mov ebx, esi
    mov dword ptr [ebx], ebp
    mov ebp, dword ptr [eax + 4]
    mov dword ptr [ebx + 4], ebp
    mov eax, dword ptr [eax + 8]
    mov dword ptr [ebx + 8], eax
    lea eax, [ecx + 16]
    mov ebp, dword ptr [eax]
    mov ebx, edx
    mov dword ptr [ebx], ebp
    mov ebp, dword ptr [eax + 4]
    mov dword ptr [ebx + 4], ebp
    mov eax, dword ptr [eax + 8]
    mov dword ptr [ebx + 8], eax
    mov bl, 1
L1:
    fld dword ptr [esi]
    fcomp dword ptr [ecx + 4]
    fnstsw ax
    test ah, 65
    jne L2
    mov eax, dword ptr [ecx + 4]
    mov dword ptr [esi], eax
L2:
    fld dword ptr [edx]
    fcomp dword ptr [ecx + 16]
    fnstsw ax
    test ah, 5
    jp L3
    mov eax, dword ptr [ecx + 16]
    mov dword ptr [edx], eax
L3:
    fld dword ptr [esi + 4]
    fcomp dword ptr [ecx + 8]
    fnstsw ax
    test ah, 65
    jne L4
    mov eax, dword ptr [ecx + 8]
    mov dword ptr [esi + 4], eax
L4:
    fld dword ptr [edx + 4]
    fcomp dword ptr [ecx + 20]
    fnstsw ax
    test ah, 5
    jp L5
    mov eax, dword ptr [ecx + 20]
    mov dword ptr [edx + 4], eax
L5:
    fld dword ptr [esi + 8]
    fcomp dword ptr [ecx + 12]
    fnstsw ax
    test ah, 65
    jne L6
    mov eax, dword ptr [ecx + 12]
    mov dword ptr [esi + 8], eax
L6:
    fld dword ptr [edx + 8]
    fcomp dword ptr [ecx + 24]
    fnstsw ax
    test ah, 5
    jp L7
    mov ecx, dword ptr [ecx + 24]
    mov dword ptr [edx + 8], ecx
L7:
    mov eax, dword ptr [esp + 12]
    mov ecx, dword ptr [g_101AE298]
    inc eax
    add edi, 12
    cmp eax, ecx
    mov dword ptr [esp + 12], eax
    jl L0
    pop edi
    pop ebp
L8:
    pop ebx
    pop ecx
    ret
FUN_10002840 ENDP
END
