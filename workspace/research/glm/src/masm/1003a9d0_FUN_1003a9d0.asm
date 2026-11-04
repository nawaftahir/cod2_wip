.686
.MODEL FLAT, C
EXTRN sub_1002E956:PROC
EXTRN sub_1002FEF6:PROC
EXTRN sub_1003A9DE:PROC
EXTRN sub_1003ADB6:PROC
EXTRN sub_100F6C96:PROC
EXTRN sub_100F6D06:PROC
EXTRN sub_100F6D4F:PROC
EXTRN sub_100F6D86:PROC
EXTRN sub_100F6DBF:PROC
EXTRN sub_100F6DD6:PROC
EXTRN sub_100F6E3F:PROC
EXTRN sub_100F6E8F:PROC
EXTRN g_1010C0E0:DWORD
EXTRN g_101CE7EC:DWORD
EXTRN g_101D1B38:DWORD
EXTRN g_101D1BF8:DWORD
EXTRN g_10764584:DWORD
EXTRN g_107645B4:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_1003a9d0 PROC
    sub esp, 8
    push ebx
    push esi
    mov esi, dword ptr [g_107645B4]
    test esi, esi
    push edi
    jne L0
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    add esp, 8
    ret
    lea esp, [esp]
L0:
    mov eax, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L1
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L1
    push 010197ED8h
    push 010193358h
    push eax
    call sub_100F6D4F
    mov ecx, dword ptr [g_10764584]
    add esp, 12
    push ecx
    call sub_100F6C96
    add esp, 4
L1:
    mov eax, dword ptr [g_101D1BF8]
    mov edx, dword ptr [eax]
    push eax
    call dword ptr [edx + 0xa4]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L0
    push 0
    push 03F800000h
    push 010191488h
    mov al, 2
    call sub_1002FEF6
    add esp, 12
    lea esp, [esp]
L2:
    mov eax, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L3
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L3
    push 010198FCCh
    push 010193358h
    push eax
    call sub_100F6DBF
    mov ecx, dword ptr [g_10764584]
    add esp, 12
    push ecx
    call sub_100F6D06
    add esp, 4
L3:
    mov edx, dword ptr [esi]
    push 2
    push esi
    call dword ptr [edx + 0x18]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L2
    mov eax, dword ptr [g_101D1B38]
    push 03F800000h
    push 03F800000h
    push 0
    push 0
    push 041800000h
    push 041800000h
    push 0
    push 0
    or ebx, 0FFFFFFFFh
    call sub_1002E956
    add esp, 32
    call sub_1003A9DE
    mov edi, edi
L4:
    mov eax, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L5
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L5
    push 010198FA8h
    push 010193358h
    push eax
    call sub_100F6E3F
    mov ecx, dword ptr [g_10764584]
    add esp, 12
    push ecx
    call sub_100F6D86
    add esp, 4
L5:
    mov edx, dword ptr [esi]
    push 1
    push esi
    call dword ptr [edx + 0x18]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L4
    lea ecx, [ecx]
L6:
    mov eax, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L7
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L7
    push 010197EC0h
    push 010193358h
    push eax
    call sub_100F6E8F
    mov ecx, dword ptr [g_10764584]
    add esp, 12
    push ecx
    call sub_100F6DD6
    add esp, 4
L7:
    mov eax, dword ptr [g_101D1BF8]
    mov edx, dword ptr [eax]
    push eax
    call dword ptr [edx + 0xa8]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L6
    mov eax, dword ptr [esi]
    push 1
    push 4
    lea ecx, [esp + 24]
    push ecx
    push esi
    call dword ptr [eax + 0x1c]
    cmp eax, 1
    jne L9
    mov edi, dword ptr [g_1010C0E0]
    lea ecx, [ecx]
L8:
    push 0
    call edi
    mov edx, dword ptr [esi]
    push 1
    push 4
    lea eax, [esp + 24]
    push eax
    push esi
    call dword ptr [edx + 0x1c]
    cmp eax, 1
    je L8
L9:
    test eax, eax
    mov eax, 000000100h
    jne sub_1003ADB6
    mov eax, dword ptr [esp + 16]
FUN_1003a9d0 ENDP
END
