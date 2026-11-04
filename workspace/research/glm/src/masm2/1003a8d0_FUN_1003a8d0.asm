.686
.MODEL FLAT, C
EXTRN sub_1003A70D:PROC
EXTRN sub_1003A83B:PROC
EXTRN sub_1003A9C5:PROC
EXTRN sub_1003A9E1:PROC
EXTRN sub_1003AA2F:PROC
EXTRN sub_1003AA3E:PROC
EXTRN sub_1003E9D5:PROC
EXTRN sub_100F6D02:PROC
EXTRN sub_100F6DBB:PROC
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_1072D9BC:DWORD:DWORD
EXTRN EXTRN g_1072D9C0:DWORD:DWORD
EXTRN EXTRN g_1072D9D0:DWORD:DWORD
EXTRN EXTRN g_1072D9D4:DWORD:DWORD
EXTRN EXTRN g_1072D9E0:DWORD:DWORD
EXTRN EXTRN g_1072DEBC:DWORD:DWORD
EXTRN EXTRN g_10730554:DWORD:DWORD
EXTRN EXTRN g_10730558:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
EXTRN EXTRN g_10766748:DWORD:DWORD
.CODE
FUN_1003a8d0 PROC
    mov mov eax, dword ptr [g_1072D9BC]
    mov mov ecx, dword ptr [eax + 56]
    mov mov edx, dword ptr [g_1072D9C0]
    push push esi
    mov mov esi, dword ptr [ecx + edx*4 + 4]
    test test esi, esi
    je L1
    mov mov al, byte ptr [g_1072DEBC]
    test test al, al
    je L0
    call sub_1003E9D5
    mov mov al, byte ptr [g_10766748]
    test test al, al
    jne L2
    mov mov ax, word ptr [esi + 4]
    test test al, 1
    mov mov ecx, 14
    je L3
    cmp cmp dword ptr [g_10730554], ecx
    je L4
    test test al, 2
L0:
    je L5
    cmp cmp dword ptr [g_10730558], ecx
    jne L6
    mov mov dword ptr [g_1072D9E0], 0
    mov mov dword ptr [g_1072D9D0], 0
    mov mov dword ptr [g_1072D9D4], 0
    pop pop esi
    ret ret
    mov mov eax, dword ptr [g_1072D9E0]
    test test eax, eax
    je sub_1003A9C5
    call sub_1003A70D
L2:
    mov mov eax, dword ptr [g_1072D9D0]
    test test eax, eax
    je sub_1003A9E1
    call sub_1003A83B
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je sub_1003AA2F
    mov mov ecx, dword ptr [g_10764584]
    test test ecx, ecx
    setne setne al
    test test al, al
    je sub_1003AA3E
    push push 010198910h
    push push 010193358h
    push push ecx
    call sub_100F6DBB
L5:
    mov mov ecx, dword ptr [g_10764584]
    add add esp, 12
    push push ecx
    call sub_100F6D02
    add add esp, 4
    pop pop esi
    ret ret
FUN_1003a8d0 ENDP
END
