.686
.MODEL FLAT, C
EXTRN sub_10038581:PROC
EXTRN sub_10038583:PROC
EXTRN sub_10038589:PROC
EXTRN sub_100F6C83:PROC
EXTRN sub_100F6D3F:PROC
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
EXTRN EXTRN g_107667C0:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_10038510 PROC
    cmp cmp dword ptr [g_107667C0], esi
    je sub_10038589
    jmp L0
    lea lea ebx, [ebx]
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
L0:
    je L1
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je sub_10038583
    push push 010198F2Ch
    push push 010193358h
    push push eax
    call sub_100F6D3F
    mov mov ecx, dword ptr [g_10764584]
    push push ecx
    call sub_100F6C83
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov edx, dword ptr [eax]
    push push esi
    push push eax
    call call dword ptr [edx + 015Ch]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_10038581
    mov mov dword ptr [g_107667C0], esi
FUN_10038510 ENDP
END
