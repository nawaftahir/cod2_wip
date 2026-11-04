.686
.MODEL FLAT, C
EXTRN sub_1003D4B5:PROC
EXTRN sub_1003D4BB:PROC
EXTRN sub_1003D4C3:PROC
EXTRN sub_100F6C83:PROC
EXTRN sub_100F6D3F:PROC
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
EXTRN EXTRN g_107667CC:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_1003d450 PROC
    cmp cmp dword ptr [g_107667CC], esi
    je sub_1003D4BB
    mov mov dword ptr [g_107667CC], esi
    mov mov edi, edi
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je sub_1003D4B5
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je sub_1003D4C3
    push push 0101999BCh
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
    push push 60
    push push eax
    call call dword ptr [edx + 0E4h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_1003D4C3
    ret ret
FUN_1003d450 ENDP
END
