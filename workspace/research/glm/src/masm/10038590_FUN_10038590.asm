.686
.MODEL FLAT, C
EXTRN sub_100F6C84:PROC
EXTRN sub_100F6D40:PROC
EXTRN g_101CE7EC:DWORD
EXTRN g_101D1BF8:DWORD
EXTRN g_10764584:DWORD
EXTRN g_107667C0:DWORD
EXTRN g_107667C4:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_10038590 PROC
    mov eax, dword ptr [g_107667C0]
    test eax, eax
    jne L0
    cmp dword ptr [g_107667C4], esi
    je L2
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
    push 010198F10h
    push 010193358h
    push eax
    call sub_100F6D40
    mov ecx, dword ptr [g_10764584]
    push ecx
    call sub_100F6C84
    add esp, 16
L1:
    mov eax, dword ptr [g_101D1BF8]
    mov edx, dword ptr [eax]
    push esi
    push eax
    call dword ptr [edx + 0x164]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L0
    mov dword ptr [g_107667C4], esi
    mov dword ptr [g_107667C0], 0
L2:
    ret
FUN_10038590 ENDP
END
