.686
.MODEL FLAT, C
EXTRN sub_100F6C84:PROC
EXTRN sub_100F6D40:PROC
EXTRN g_101CE7EC:DWORD
EXTRN g_101D1BF8:DWORD
EXTRN g_10764584:DWORD
EXTRN g_1076674C:DWORD
EXTRN g_1076675C:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_1003ecb0 PROC
    mov eax, dword ptr [g_1076674C]
    mov dword ptr [g_1076675C], eax
    mov dword ptr [g_1076674C], esi
L0:
    mov ecx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [ecx + 8]
    test eax, eax
    je L1
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L1
    push 01019903Ch
    push 010193358h
    push eax
    call sub_100F6D40
    mov edx, dword ptr [g_10764584]
    push edx
    call sub_100F6C84
    add esp, 16
L1:
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push esi
    push eax
    call dword ptr [ecx + 0x1a0]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L0
    mov dword ptr [g_1076675C], 0
    ret
FUN_1003ecb0 ENDP
END
