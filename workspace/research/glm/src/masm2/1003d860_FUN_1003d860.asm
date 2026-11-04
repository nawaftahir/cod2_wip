.686
.MODEL FLAT, C
EXTRN sub_1003D946:PROC
EXTRN sub_1003D954:PROC
EXTRN sub_1003D955:PROC
EXTRN sub_100F6CC3:PROC
EXTRN sub_100F6D80:PROC
EXTRN EXTRN g_101CE6F0:DWORD:DWORD
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_101D495C:DWORD:DWORD
EXTRN EXTRN g_101D4960:DWORD:DWORD
EXTRN EXTRN g_101D4C88:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_1003d860 PROC
    mov mov eax, dword ptr [g_101CE6F0]
    mov mov eax, dword ptr [eax + 8]
    mov mov ecx, dword ptr [g_101D4960]
    cmp cmp eax, ecx
    mov mov dword ptr [g_101D495C], eax
    jle L0
    mov mov eax, ecx
    mov mov dword ptr [g_101D495C], eax
    cmp cmp eax, 1
    jg L1
    xor xor eax, eax
    mov mov dword ptr [g_101D495C], eax
    push push esi
    mov mov ecx, 1
    sub sub ecx, eax
    push push edi
    mov mov edi, 1
    jns L2
    mov mov edi, eax
    mov mov eax, dword ptr [g_101D4C88]
    xor xor esi, esi
    test test eax, eax
    jle sub_1003D955
    jmp L3
    lea lea esp, [esp]
    mov mov edx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [edx + 8]
    test test eax, eax
    je sub_1003D946
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je sub_1003D954
    push push 010199718h
    push push 010193358h
    push push eax
L2:
    call sub_100F6D80
    mov mov eax, dword ptr [g_10764584]
    push push eax
    call sub_100F6CC3
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push edi
    push push 10
    push push esi
    push push eax
    call call dword ptr [ecx + 0114h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_1003D954
    mov mov eax, dword ptr [g_101D4C88]
    inc inc esi
FUN_1003d860 ENDP
END
