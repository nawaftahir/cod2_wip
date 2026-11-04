.686
.MODEL FLAT, C
EXTRN sub_100F6C96:PROC
EXTRN sub_100F6D03:PROC
EXTRN sub_100F6D53:PROC
EXTRN sub_100F6D68:PROC
EXTRN sub_100F6DBF:PROC
EXTRN sub_100F6E25:PROC
EXTRN g_101CE708:DWORD
EXTRN g_101CE7EC:DWORD
EXTRN g_101D1BF8:DWORD
EXTRN g_10730550:DWORD
EXTRN g_10764584:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_1003e4b0 PROC
    mov eax, dword ptr [g_10730550]
    mov ecx, dword ptr [g_101CE708]
    dec eax
    mov dword ptr [g_10730550], eax
    cmp dword ptr [ecx + 8], 2
    jne L7
    jmp L1
L0:
    mov eax, dword ptr [g_10730550]
L1:
    mov edx, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [edx + 8]
    test ecx, ecx
    je L2
    mov ecx, dword ptr [g_10764584]
    test ecx, ecx
    setne dl
    test dl, dl
    je L2
    push 010199298h
    push 010193358h
    push ecx
    call sub_100F6D53
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100F6C96
    mov eax, dword ptr [g_10730550]
    add esp, 16
L2:
    mov ecx, dword ptr [g_101D1BF8]
    imul eax, eax, 000000CD0h
    mov edx, dword ptr [ecx]
    add eax, 01072DEF0h
    push eax
    push 000000100h
    push ecx
    call dword ptr [edx + 0xb0]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L0
    lea ebx, [ebx]
L3:
    mov eax, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L4
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L4
    push 010199228h
    push 010193358h
    push eax
    call sub_100F6DBF
    mov ecx, dword ptr [g_10764584]
    push ecx
    call sub_100F6D03
    add esp, 16
L4:
    mov ecx, dword ptr [g_10730550]
    mov eax, dword ptr [g_101D1BF8]
    imul ecx, ecx, 000000CD0h
    mov edx, dword ptr [eax]
    add ecx, 01072E110h
    push ecx
    push 2
    push eax
    call dword ptr [edx + 0xb0]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L3
L5:
    mov edx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L6
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L6
    push 0101991A8h
    push 010193358h
    push eax
    call sub_100F6E25
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100F6D68
    add esp, 16
L6:
    mov edx, dword ptr [g_10730550]
    mov eax, dword ptr [g_101D1BF8]
    imul edx, edx, 000000CD0h
    mov ecx, dword ptr [eax]
    add edx, 01072E220h
    push edx
    push 3
    push eax
    call dword ptr [ecx + 0xb0]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L5
L7:
    ret
FUN_1003e4b0 ENDP
END
