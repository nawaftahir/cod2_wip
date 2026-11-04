.686
.MODEL FLAT, C
EXTRN sub_1002B9A6:PROC
EXTRN sub_1002B9B4:PROC
EXTRN sub_1002B9BE:PROC
EXTRN sub_100F6C93:PROC
EXTRN sub_100F6D50:PROC
EXTRN EXTRN g_101CE708:DWORD:DWORD
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_1002b920 PROC
    mov mov ecx, dword ptr [g_101CE708]
    mov mov edx, dword ptr [ecx + 8]
    xor xor eax, eax
    cmp cmp edx, 2
    setne setne al
    push push esi
    dec dec eax
    and and eax, -28
    add add eax, 64
    shl shl eax, 16
    mov mov esi, eax
    mov mov edi, edi
    mov mov edx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [edx + 8]
    test test eax, eax
    je sub_1002B9A6
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je sub_1002B9B4
    push push 010197480h
    push push 010193358h
    push push eax
    call sub_100F6D50
    mov mov eax, dword ptr [g_10764584]
    push push eax
    call sub_100F6C93
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push 0
    push push 0101D49B4h
    push push 0
    push push 0
    push push 0208h
    push push esi
    push push eax
    call call dword ptr [ecx + 104]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_1002B9BE
    pop pop esi
    ret ret
FUN_1002b920 ENDP
END
