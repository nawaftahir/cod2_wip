.686
.MODEL FLAT, C
EXTRN sub_10038603:PROC
EXTRN sub_10038605:PROC
EXTRN sub_10038613:PROC
EXTRN sub_100F6C84:PROC
EXTRN sub_100F6D40:PROC
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
EXTRN EXTRN g_107667C0:DWORD:DWORD
EXTRN EXTRN g_107667C4:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_10038590 PROC
    mov mov eax, dword ptr [g_107667C0]
    test test eax, eax
    jne L0
    cmp cmp dword ptr [g_107667C4], esi
    je sub_10038613
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je L1
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je sub_10038605
    push push 010198F10h
    push push 010193358h
    push push eax
    call sub_100F6D40
    mov mov ecx, dword ptr [g_10764584]
    push push ecx
    call sub_100F6C84
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov edx, dword ptr [eax]
    push push esi
    push push eax
    call call dword ptr [edx + 0164h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_10038603
    mov mov dword ptr [g_107667C4], esi
    mov mov dword ptr [g_107667C0], 0
    ret ret
FUN_10038590 ENDP
END
