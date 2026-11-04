.686
.MODEL FLAT, C
EXTRN sub_10002951:PROC
EXTRN sub_1000295B:PROC
EXTRN sub_10002961:PROC
EXTRN sub_10002976:PROC
EXTRN sub_1000299C:PROC
EXTRN sub_100029C2:PROC
EXTRN sub_100029E8:PROC
EXTRN EXTRN g_101AE298:DWORD:DWORD
EXTRN EXTRN g_101AE29C:DWORD:DWORD
.CODE
FUN_10002840 PROC
    push push ecx
    xor xor eax, eax
    mov mov dword ptr [esi], eax
    mov mov dword ptr [esi + 4], eax
    mov mov dword ptr [esi + 8], eax
    mov mov dword ptr [edx], eax
    mov mov dword ptr [edx + 4], eax
    mov mov dword ptr [edx + 8], eax
    mov mov ecx, dword ptr [g_101AE298]
    push push ebx
    xor xor bl, bl
    cmp cmp ecx, eax
    mov mov dword ptr [esp + 4], eax
    jle sub_1000295B
    push push ebp
    push push edi
    xor xor edi, edi
    lea lea esp, [esp]
    test test bl, bl
    mov mov eax, dword ptr [g_101AE29C]
    mov mov ecx, dword ptr [edi + eax + 8]
    jne L0
    lea lea eax, [ecx + 4]
    mov mov ebp, dword ptr [eax]
    mov mov ebx, esi
    mov mov dword ptr [ebx], ebp
    mov mov ebp, dword ptr [eax + 4]
    mov mov dword ptr [ebx + 4], ebp
    mov mov eax, dword ptr [eax + 8]
    mov mov dword ptr [ebx + 8], eax
    lea lea eax, [ecx + 16]
    mov mov ebp, dword ptr [eax]
    mov mov ebx, edx
    mov mov dword ptr [ebx], ebp
    mov mov ebp, dword ptr [eax + 4]
    mov mov dword ptr [ebx + 4], ebp
    mov mov eax, dword ptr [eax + 8]
    mov mov dword ptr [ebx + 8], eax
    mov mov bl, 1
    fld fld dword ptr [esi]
    fcomp fcomp dword ptr [ecx + 4]
    fnstsw fnstsw ax
    test test ah, 65
    jne L1
    mov mov eax, dword ptr [ecx + 4]
    mov mov dword ptr [esi], eax
    fld fld dword ptr [edx]
    fcomp fcomp dword ptr [ecx + 16]
    fnstsw fnstsw ax
    test test ah, 5
    jp sub_10002951
    mov mov eax, dword ptr [ecx + 16]
    mov mov dword ptr [edx], eax
    fld fld dword ptr [esi + 4]
    fcomp fcomp dword ptr [ecx + 8]
    fnstsw fnstsw ax
    test test ah, 65
    jne sub_10002976
    mov mov eax, dword ptr [ecx + 8]
    mov mov dword ptr [esi + 4], eax
    fld fld dword ptr [edx + 4]
    fcomp fcomp dword ptr [ecx + 20]
    fnstsw fnstsw ax
L0:
    test test ah, 5
    jp sub_1000299C
    mov mov eax, dword ptr [ecx + 20]
    mov mov dword ptr [edx + 4], eax
    fld fld dword ptr [esi + 8]
    fcomp fcomp dword ptr [ecx + 12]
    fnstsw fnstsw ax
    test test ah, 65
    jne sub_100029C2
    mov mov eax, dword ptr [ecx + 12]
    mov mov dword ptr [esi + 8], eax
    fld fld dword ptr [edx + 8]
    fcomp fcomp dword ptr [ecx + 24]
    fnstsw fnstsw ax
    test test ah, 5
    jp sub_100029E8
    mov mov ecx, dword ptr [ecx + 24]
    mov mov dword ptr [edx + 8], ecx
    mov mov eax, dword ptr [esp + 12]
    mov mov ecx, dword ptr [g_101AE298]
    inc inc eax
    add add edi, 12
    cmp cmp eax, ecx
    mov mov dword ptr [esp + 12], eax
    jl sub_10002961
    pop pop edi
    pop pop ebp
    pop pop ebx
    pop pop ecx
    ret ret
FUN_10002840 ENDP
END
