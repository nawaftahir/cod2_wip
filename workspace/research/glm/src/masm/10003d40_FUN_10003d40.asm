.686
.MODEL FLAT, C
EXTRN g_101AE29C:DWORD
EXTRN g_101AE4A0:DWORD
.CODE
FUN_10003d40 PROC
L0:
    mov eax, 048000000h
    push esi
    mov esi, dword ptr [esp + 8]
    mov dword ptr [esi], eax
    mov dword ptr [esi + 4], eax
    mov dword ptr [esi + 8], eax
    mov eax, 0C8000000h
    mov dword ptr [esi + 12], eax
    mov dword ptr [esi + 16], eax
    mov dword ptr [esi + 20], eax
    mov eax, dword ptr [esi + 40]
    test eax, eax
    push edi
    jne L9
    mov eax, dword ptr [esi + 28]
    mov ecx, dword ptr [g_101AE29C]
    lea eax, [eax + eax*2]
    lea eax, [ecx + eax*4]
    mov ecx, dword ptr [esi + 24]
    xor edx, edx
    test ecx, ecx
    jle L8
    lea edi, [eax + 8]
    jmp L1
    lea ecx, [ecx]
L1:
    mov ecx, dword ptr [edi]
    fld dword ptr [esi]
    fcomp dword ptr [ecx + 4]
    fnstsw ax
    test ah, 65
    jne L2
    mov eax, dword ptr [ecx + 4]
    mov dword ptr [esi], eax
L2:
    fld dword ptr [esi + 12]
    fcomp dword ptr [ecx + 16]
    fnstsw ax
    test ah, 5
    jp L3
    mov eax, dword ptr [ecx + 16]
    mov dword ptr [esi + 12], eax
L3:
    fld dword ptr [esi + 4]
    fcomp dword ptr [ecx + 8]
    fnstsw ax
    test ah, 65
    jne L4
    mov eax, dword ptr [ecx + 8]
    mov dword ptr [esi + 4], eax
L4:
    fld dword ptr [esi + 16]
    fcomp dword ptr [ecx + 20]
    fnstsw ax
    test ah, 5
    jp L5
    mov eax, dword ptr [ecx + 20]
    mov dword ptr [esi + 16], eax
L5:
    fld dword ptr [esi + 8]
    fcomp dword ptr [ecx + 12]
    fnstsw ax
    test ah, 65
    jne L6
    mov eax, dword ptr [ecx + 12]
    mov dword ptr [esi + 8], eax
L6:
    fld dword ptr [esi + 20]
    fcomp dword ptr [ecx + 24]
    fnstsw ax
    test ah, 5
    jp L7
    mov ecx, dword ptr [ecx + 24]
    mov dword ptr [esi + 20], ecx
L7:
    mov eax, dword ptr [esi + 24]
    inc edx
    add edi, 12
    cmp edx, eax
    jl L1
L8:
    mov eax, dword ptr [esp + 16]
    pop edi
    pop esi
    ret
L9:
    mov edx, dword ptr [esp + 16]
    lea ecx, [edx + edx*2]
    push ebx
    mov ebx, dword ptr [g_101AE4A0]
    shl ecx, 4
    add ecx, ebx
    add edx, eax
    xor ebx, ebx
    test eax, eax
    mov dword ptr [esi + 44], ecx
    jle L17
    xor edi, edi
L10:
    push edx
    mov edx, dword ptr [esi + 44]
    add edx, edi
    push edx
    call L0
    fld dword ptr [esi]
    mov edx, eax
    mov eax, dword ptr [esi + 44]
    fcomp dword ptr [edi + eax]
    lea ecx, [edi + eax]
    add esp, 8
    fnstsw ax
    test ah, 65
    jne L11
    mov eax, dword ptr [ecx]
    mov dword ptr [esi], eax
L11:
    fld dword ptr [esi + 12]
    fcomp dword ptr [ecx + 12]
    fnstsw ax
    test ah, 5
    jp L12
    mov eax, dword ptr [ecx + 12]
    mov dword ptr [esi + 12], eax
L12:
    fld dword ptr [esi + 4]
    fcomp dword ptr [ecx + 4]
    fnstsw ax
    test ah, 65
    jne L13
    mov eax, dword ptr [ecx + 4]
    mov dword ptr [esi + 4], eax
L13:
    fld dword ptr [esi + 16]
    fcomp dword ptr [ecx + 16]
    fnstsw ax
    test ah, 5
    jp L14
    mov eax, dword ptr [ecx + 16]
    mov dword ptr [esi + 16], eax
L14:
    fld dword ptr [esi + 8]
    fcomp dword ptr [ecx + 8]
    fnstsw ax
    test ah, 65
    jne L15
    mov eax, dword ptr [ecx + 8]
    mov dword ptr [esi + 8], eax
L15:
    fld dword ptr [esi + 20]
    fcomp dword ptr [ecx + 20]
    fnstsw ax
    test ah, 5
    jp L16
    mov ecx, dword ptr [ecx + 20]
    mov dword ptr [esi + 20], ecx
L16:
    mov eax, dword ptr [esi + 40]
    inc ebx
    add edi, 48
    cmp ebx, eax
    jl L10
L17:
    pop ebx
    pop edi
FUN_10003d40 ENDP
END
