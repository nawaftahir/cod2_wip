.686
.MODEL FLAT, C
EXTRN sub_1001E5B4:PROC
EXTRN sub_1001E5CA:PROC
EXTRN sub_1001E5CC:PROC
EXTRN sub_1001E5D8:PROC
EXTRN sub_100F6C95:PROC
EXTRN sub_100F6D52:PROC
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_101D49B0:DWORD:DWORD
EXTRN EXTRN g_101DA9C8:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_1001e540 PROC
    mov mov eax, dword ptr [g_101D49B0]
    test test eax, eax
    je sub_1001E5B4
    mov mov eax, dword ptr [g_101DA9C8]
    mov mov dword ptr [g_101D49B0], 0
    mov mov ecx, dword ptr [eax + 0217C78h]
    push push esi
    mov mov esi, dword ptr [ecx + 8]
    mov mov edx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [edx + 8]
    test test eax, eax
    je sub_1001E5CA
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je sub_1001E5D8
    push push 010191B04h
    push push 010193358h
    push push eax
    call sub_100F6D52
    mov mov eax, dword ptr [g_10764584]
    push push eax
    call sub_100F6C95
    add add esp, 16
    mov mov ecx, dword ptr [esi]
    push push esi
    call call dword ptr [ecx + 48]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_1001E5CC
    pop pop esi
    ret ret
FUN_1001e540 ENDP
END
