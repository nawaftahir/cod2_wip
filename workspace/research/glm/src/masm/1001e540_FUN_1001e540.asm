.686
.MODEL FLAT, C
EXTRN sub_100F6C95:PROC
EXTRN sub_100F6D52:PROC
EXTRN g_101CE7EC:DWORD
EXTRN g_101D49B0:DWORD
EXTRN g_101DA9C8:DWORD
EXTRN g_10764584:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_1001e540 PROC
    mov eax, dword ptr [g_101D49B0]
    test eax, eax
    je L2
    mov eax, dword ptr [g_101DA9C8]
    mov dword ptr [g_101D49B0], 0
    mov ecx, dword ptr [eax + 000217C78h]
    push esi
    mov esi, dword ptr [ecx + 8]
L0:
    mov edx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L1
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L1
    push 010191B04h
    push 010193358h
    push eax
    call sub_100F6D52
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100F6C95
    add esp, 16
L1:
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx + 0x30]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L0
    pop esi
L2:
    ret
FUN_1001e540 ENDP
END
