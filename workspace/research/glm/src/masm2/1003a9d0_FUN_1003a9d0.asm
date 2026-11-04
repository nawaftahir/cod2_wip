.686
.MODEL FLAT, C
EXTRN sub_1002E956:PROC
EXTRN sub_1002FEF6:PROC
EXTRN sub_1003AC38:PROC
EXTRN sub_1003AC3D:PROC
EXTRN sub_1003AC46:PROC
EXTRN sub_1003ACD8:PROC
EXTRN sub_1003ACE3:PROC
EXTRN sub_1003ACE6:PROC
EXTRN sub_1003AD7F:PROC
EXTRN sub_1003AD88:PROC
EXTRN sub_1003ADB6:PROC
EXTRN sub_100F6C96:PROC
EXTRN sub_100F6D06:PROC
EXTRN sub_100F6D4F:PROC
EXTRN sub_100F6D86:PROC
EXTRN sub_100F6DBF:PROC
EXTRN sub_100F6DD6:PROC
EXTRN sub_100F6E3F:PROC
EXTRN sub_100F6E8F:PROC
EXTRN EXTRN g_1010C0E0:DWORD:DWORD
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_101D1B38:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
EXTRN EXTRN g_107645B4:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_1003a9d0 PROC
    sub sub esp, 8
    push push ebx
    push push esi
    mov mov esi, dword ptr [g_107645B4]
    test test esi, esi
    push push edi
L0:
    jne L1
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    add add esp, 8
    ret ret
    lea lea esp, [esp]
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je L2
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je L4
    push push 010197ED8h
    push push 010193358h
    push push eax
    call sub_100F6D4F
    mov mov ecx, dword ptr [g_10764584]
    add add esp, 12
    push push ecx
    call sub_100F6C96
    add add esp, 4
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov edx, dword ptr [eax]
    push push eax
    call call dword ptr [edx + 0A4h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne L3
    push push 0
    push push 03F800000h
    push push 010191488h
    mov mov al, 2
    call sub_1002FEF6
    add add esp, 12
    lea lea esp, [esp]
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je L5
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je L7
    push push 010198FCCh
    push push 010193358h
    push push eax
    call sub_100F6DBF
    mov mov ecx, dword ptr [g_10764584]
    add add esp, 12
    push push ecx
    call sub_100F6D06
    add add esp, 4
    mov mov edx, dword ptr [esi]
    push push 2
    push push esi
    call call dword ptr [edx + 24]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne L6
    mov mov eax, dword ptr [g_101D1B38]
    push push 03F800000h
    push push 03F800000h
    push push 0
    push push 0
    push push 041800000h
    push push 041800000h
    push push 0
    push push 0
    or or ebx, -1
    call sub_1002E956
    add add esp, 32
    call L0
    mov mov edi, edi
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je sub_1003AC38
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je sub_1003AC46
    push push 010198FA8h
    push push 010193358h
    push push eax
    call sub_100F6E3F
    mov mov ecx, dword ptr [g_10764584]
    add add esp, 12
    push push ecx
    call sub_100F6D86
    add add esp, 4
    mov mov edx, dword ptr [esi]
    push push 1
    push push esi
    call call dword ptr [edx + 24]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_1003AC3D
    lea lea ecx, [ecx]
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
L5:
    test test ecx, ecx
    je sub_1003ACD8
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
L7:
    test test cl, cl
    je sub_1003ACE6
    push push 010197EC0h
    push push 010193358h
    push push eax
    call sub_100F6E8F
    mov mov ecx, dword ptr [g_10764584]
    add add esp, 12
    push push ecx
    call sub_100F6DD6
    add add esp, 4
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov edx, dword ptr [eax]
    push push eax
    call call dword ptr [edx + 0A8h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_1003ACE3
    mov mov eax, dword ptr [esi]
    push push 1
    push push 4
    lea lea ecx, [esp + 24]
    push push ecx
    push push esi
    call call dword ptr [eax + 28]
    cmp cmp eax, 1
    jne sub_1003AD7F
    mov mov edi, dword ptr [g_1010C0E0]
    lea lea ecx, [ecx]
    push push 0
    call call edi
    mov mov edx, dword ptr [esi]
    push push 1
    push push 4
    lea lea eax, [esp + 24]
    push push eax
    push push esi
    call call dword ptr [edx + 28]
    cmp cmp eax, 1
    je sub_1003AD88
    test test eax, eax
    mov mov eax, 0100h
    jne sub_1003ADB6
    mov mov eax, dword ptr [esp + 16]
FUN_1003a9d0 ENDP
END
