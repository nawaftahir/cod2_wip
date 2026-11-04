.686
.MODEL FLAT, C
EXTRN sub_10003F7A:PROC
EXTRN sub_10003F9E:PROC
EXTRN sub_10003FC3:PROC
EXTRN sub_10003FC4:PROC
EXTRN sub_10003FC5:PROC
EXTRN sub_10003FEA:PROC
EXTRN sub_10004010:PROC
EXTRN sub_10004036:PROC
EXTRN EXTRN g_101AE29C:DWORD:DWORD
EXTRN EXTRN g_101AE4A0:DWORD:DWORD
.CODE
FUN_10003d40 PROC
    mov mov eax, 048000000h
    push push esi
    mov mov esi, dword ptr [esp + 8]
    mov mov dword ptr [esi], eax
    mov mov dword ptr [esi + 4], eax
    mov mov dword ptr [esi + 8], eax
    mov mov eax, 0C8000000h
    mov mov dword ptr [esi + 12], eax
    mov mov dword ptr [esi + 16], eax
    mov mov dword ptr [esi + 20], eax
    mov mov eax, dword ptr [esi + 40]
    test test eax, eax
    push push edi
    jne L3
    mov mov eax, dword ptr [esi + 28]
    mov mov ecx, dword ptr [g_101AE29C]
    lea lea eax, [eax + eax*2]
    lea lea eax, [ecx + eax*4]
    mov mov ecx, dword ptr [esi + 24]
    xor xor edx, edx
    test test ecx, ecx
    jle L6
    lea lea edi, [eax + 8]
    jmp L0
    lea lea ecx, [ecx]
    mov mov ecx, dword ptr [edi]
    fld fld dword ptr [esi]
    fcomp fcomp dword ptr [ecx + 4]
    fnstsw fnstsw ax
    test test ah, 65
    jne L1
    mov mov eax, dword ptr [ecx + 4]
    mov mov dword ptr [esi], eax
    fld fld dword ptr [esi + 12]
    fcomp fcomp dword ptr [ecx + 16]
    fnstsw fnstsw ax
    test test ah, 5
    jp L2
    mov mov eax, dword ptr [ecx + 16]
    mov mov dword ptr [esi + 12], eax
    fld fld dword ptr [esi + 4]
    fcomp fcomp dword ptr [ecx + 8]
    fnstsw fnstsw ax
    test test ah, 65
    jne L5
    mov mov eax, dword ptr [ecx + 8]
    mov mov dword ptr [esi + 4], eax
    fld fld dword ptr [esi + 16]
    fcomp fcomp dword ptr [ecx + 20]
    fnstsw fnstsw ax
    test test ah, 5
    jp L8
    mov mov eax, dword ptr [ecx + 20]
    mov mov dword ptr [esi + 16], eax
    fld fld dword ptr [esi + 8]
    fcomp fcomp dword ptr [ecx + 12]
    fnstsw fnstsw ax
    test test ah, 65
    jne L9
    mov mov eax, dword ptr [ecx + 12]
    mov mov dword ptr [esi + 8], eax
    fld fld dword ptr [esi + 20]
    fcomp fcomp dword ptr [ecx + 24]
    fnstsw fnstsw ax
    test test ah, 5
    jp L10
    mov mov ecx, dword ptr [ecx + 24]
    mov mov dword ptr [esi + 20], ecx
    mov mov eax, dword ptr [esi + 24]
    inc inc edx
    add add edi, 12
    cmp cmp edx, eax
    jl L7
    mov mov eax, dword ptr [esp + 16]
    pop pop edi
    pop pop esi
    ret ret
    mov mov edx, dword ptr [esp + 16]
    lea lea ecx, [edx + edx*2]
    push push ebx
    mov mov ebx, dword ptr [g_101AE4A0]
    shl shl ecx, 4
    add add ecx, ebx
    add add edx, eax
    xor xor ebx, ebx
    test test eax, eax
    mov mov dword ptr [esi + 44], ecx
    jle sub_10003FC3
    xor xor edi, edi
    push push edx
    mov mov edx, dword ptr [esi + 44]
    add add edx, edi
    push push edx
    call L4
L4:
    fld fld dword ptr [esi]
    mov mov edx, eax
    mov mov eax, dword ptr [esi + 44]
    fcomp fcomp dword ptr [edi + eax]
    lea lea ecx, [edi + eax]
    add add esp, 8
    fnstsw fnstsw ax
    test test ah, 65
    jne sub_10003F7A
    mov mov eax, dword ptr [ecx]
L7:
    mov mov dword ptr [esi], eax
    fld fld dword ptr [esi + 12]
    fcomp fcomp dword ptr [ecx + 12]
    fnstsw fnstsw ax
    test test ah, 5
    jp sub_10003F9E
    mov mov eax, dword ptr [ecx + 12]
    mov mov dword ptr [esi + 12], eax
L8:
    fld fld dword ptr [esi + 4]
    fcomp fcomp dword ptr [ecx + 4]
    fnstsw fnstsw ax
    test test ah, 65
    jne sub_10003FC4
    mov mov eax, dword ptr [ecx + 4]
    mov mov dword ptr [esi + 4], eax
    fld fld dword ptr [esi + 16]
    fcomp fcomp dword ptr [ecx + 16]
    fnstsw fnstsw ax
    test test ah, 5
    jp sub_10003FEA
    mov mov eax, dword ptr [ecx + 16]
    mov mov dword ptr [esi + 16], eax
L9:
    fld fld dword ptr [esi + 8]
    fcomp fcomp dword ptr [ecx + 8]
    fnstsw fnstsw ax
    test test ah, 65
    jne sub_10004010
    mov mov eax, dword ptr [ecx + 8]
    mov mov dword ptr [esi + 8], eax
    fld fld dword ptr [esi + 20]
    fcomp fcomp dword ptr [ecx + 20]
    fnstsw fnstsw ax
    test test ah, 5
    jp sub_10004036
    mov mov ecx, dword ptr [ecx + 20]
    mov mov dword ptr [esi + 20], ecx
L10:
    mov mov eax, dword ptr [esi + 40]
    inc inc ebx
    add add edi, 48
    cmp cmp ebx, eax
    jl sub_10003FC5
    pop pop ebx
    pop pop edi
FUN_10003d40 ENDP
END
