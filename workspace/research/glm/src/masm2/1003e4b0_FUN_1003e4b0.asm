.686
.MODEL FLAT, C
EXTRN sub_1003E615:PROC
EXTRN sub_1003E623:PROC
EXTRN sub_1003E625:PROC
EXTRN sub_1003E635:PROC
EXTRN sub_1003E6E0:PROC
EXTRN sub_1003E6EE:PROC
EXTRN sub_1003E6FF:PROC
EXTRN sub_100F6C96:PROC
EXTRN sub_100F6D03:PROC
EXTRN sub_100F6D53:PROC
EXTRN sub_100F6D68:PROC
EXTRN sub_100F6DBF:PROC
EXTRN sub_100F6E25:PROC
EXTRN EXTRN g_101CE708:DWORD:DWORD
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_10730550:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_1003e4b0 PROC
    mov mov eax, dword ptr [g_10730550]
    mov mov ecx, dword ptr [g_101CE708]
    dec dec eax
    mov mov dword ptr [g_10730550], eax
    cmp cmp dword ptr [ecx + 8], 2
    jne sub_1003E625
    jmp L0
    mov mov eax, dword ptr [g_10730550]
    mov mov edx, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [edx + 8]
    test test ecx, ecx
    je L1
    mov mov ecx, dword ptr [g_10764584]
    test test ecx, ecx
    setne setne dl
    test test dl, dl
    je L2
    push push 010199298h
    push push 010193358h
    push push ecx
    call sub_100F6D53
    mov mov eax, dword ptr [g_10764584]
    push push eax
    call sub_100F6C96
    mov mov eax, dword ptr [g_10730550]
    add add esp, 16
    mov mov ecx, dword ptr [g_101D1BF8]
    imul imul eax, eax, 0CD0h
    mov mov edx, dword ptr [ecx]
    add add eax, 01072DEF0h
    push push eax
    push push 0100h
    push push ecx
    call call dword ptr [edx + 0B0h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne L3
    lea lea ebx, [ebx]
L1:
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je sub_1003E615
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je sub_1003E623
    push push 010199228h
    push push 010193358h
    push push eax
    call sub_100F6DBF
    mov mov ecx, dword ptr [g_10764584]
    push push ecx
    call sub_100F6D03
    add add esp, 16
    mov mov ecx, dword ptr [g_10730550]
    mov mov eax, dword ptr [g_101D1BF8]
    imul imul ecx, ecx, 0CD0h
    mov mov edx, dword ptr [eax]
    add add ecx, 01072E110h
    push push ecx
    push push 2
    push push eax
    call call dword ptr [edx + 0B0h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_1003E635
    mov mov edx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [edx + 8]
    test test eax, eax
    je sub_1003E6E0
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je sub_1003E6EE
    push push 0101991A8h
    push push 010193358h
    push push eax
    call sub_100F6E25
    mov mov eax, dword ptr [g_10764584]
    push push eax
    call sub_100F6D68
    add add esp, 16
    mov mov edx, dword ptr [g_10730550]
    mov mov eax, dword ptr [g_101D1BF8]
    imul imul edx, edx, 0CD0h
    mov mov ecx, dword ptr [eax]
    add add edx, 01072E220h
    push push edx
    push push 3
    push push eax
    call call dword ptr [ecx + 0B0h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_1003E6FF
    ret ret
FUN_1003e4b0 ENDP
END
