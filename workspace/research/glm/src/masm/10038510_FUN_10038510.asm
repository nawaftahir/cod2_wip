.686
.MODEL FLAT, C
EXTRN sub_10038589:PROC
EXTRN sub_100F6C83:PROC
EXTRN sub_100F6D3F:PROC
EXTRN g_101CE7EC:DWORD
EXTRN g_101D1BF8:DWORD
EXTRN g_10764584:DWORD
EXTRN g_107667C0:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_10038510 PROC
    cmp dword ptr [g_107667C0], esi
    je sub_10038589
    jmp L0
    lea ebx, [ebx]
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
    push 010198F2Ch
    push 010193358h
    push eax
    call sub_100F6D3F
    mov ecx, dword ptr [g_10764584]
    push ecx
    call sub_100F6C83
    add esp, 16
L1:
    mov eax, dword ptr [g_101D1BF8]
    mov edx, dword ptr [eax]
    push esi
    push eax
    call dword ptr [edx + 0x15c]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L0
    mov dword ptr [g_107667C0], esi
FUN_10038510 ENDP
END
