.686
.MODEL FLAT, C
EXTRN sub_1003A70D:PROC
EXTRN sub_1003A83B:PROC
EXTRN sub_1003E9D5:PROC
EXTRN sub_100F6D02:PROC
EXTRN sub_100F6DBB:PROC
EXTRN g_101CE7EC:DWORD
EXTRN g_1072D9BC:DWORD
EXTRN g_1072D9C0:DWORD
EXTRN g_1072D9D0:DWORD
EXTRN g_1072D9D4:DWORD
EXTRN g_1072D9E0:DWORD
EXTRN g_1072DEBC:DWORD
EXTRN g_10730554:DWORD
EXTRN g_10730558:DWORD
EXTRN g_10764584:DWORD
EXTRN g_10766748:DWORD
.CODE
FUN_1003a8d0 PROC
    mov eax, dword ptr [g_1072D9BC]
    mov ecx, dword ptr [eax + 56]
    mov edx, dword ptr [g_1072D9C0]
    push esi
    mov esi, dword ptr [ecx + edx*4 + 4]
    test esi, esi
    je L2
    mov al, byte ptr [g_1072DEBC]
    test al, al
    je L0
    call sub_1003E9D5
L0:
    mov al, byte ptr [g_10766748]
    test al, al
    jne L2
    mov ax, word ptr [esi + 4]
    test al, 1
    mov ecx, 14
    je L1
    cmp dword ptr [g_10730554], ecx
    je L2
L1:
    test al, 2
    je L3
    cmp dword ptr [g_10730558], ecx
    jne L3
L2:
    mov dword ptr [g_1072D9E0], 0
    mov dword ptr [g_1072D9D0], 0
    mov dword ptr [g_1072D9D4], 0
    pop esi
    ret
L3:
    mov eax, dword ptr [g_1072D9E0]
    test eax, eax
    je L4
    call sub_1003A70D
L4:
    mov eax, dword ptr [g_1072D9D0]
    test eax, eax
    je L5
    call sub_1003A83B
L5:
    mov eax, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L6
    mov ecx, dword ptr [g_10764584]
    test ecx, ecx
    setne al
    test al, al
    je L6
    push 010198910h
    push 010193358h
    push ecx
    call sub_100F6DBB
    mov ecx, dword ptr [g_10764584]
    add esp, 12
    push ecx
    call sub_100F6D02
    add esp, 4
L6:
    pop esi
    ret
FUN_1003a8d0 ENDP
END
