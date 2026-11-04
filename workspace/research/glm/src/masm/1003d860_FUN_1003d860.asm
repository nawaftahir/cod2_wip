.686
.MODEL FLAT, C
EXTRN sub_1003D955:PROC
EXTRN sub_100F6CC3:PROC
EXTRN sub_100F6D80:PROC
EXTRN g_101CE6F0:DWORD
EXTRN g_101CE7EC:DWORD
EXTRN g_101D1BF8:DWORD
EXTRN g_101D495C:DWORD
EXTRN g_101D4960:DWORD
EXTRN g_101D4C88:DWORD
EXTRN g_10764584:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_1003d860 PROC
    mov eax, dword ptr [g_101CE6F0]
    mov eax, dword ptr [eax + 8]
    mov ecx, dword ptr [g_101D4960]
    cmp eax, ecx
    mov dword ptr [g_101D495C], eax
    jle L0
    mov eax, ecx
    mov dword ptr [g_101D495C], eax
L0:
    cmp eax, 1
    jg L1
    xor eax, eax
    mov dword ptr [g_101D495C], eax
L1:
    push esi
    mov ecx, 1
    sub ecx, eax
    push edi
    mov edi, 1
    jns L2
    mov edi, eax
L2:
    mov eax, dword ptr [g_101D4C88]
    xor esi, esi
    test eax, eax
    jle sub_1003D955
    jmp L3
    lea esp, [esp]
L3:
    mov edx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L4
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L4
    push 010199718h
    push 010193358h
    push eax
    call sub_100F6D80
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100F6CC3
    add esp, 16
L4:
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push edi
    push 10
    push esi
    push eax
    call dword ptr [ecx + 0x114]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L3
    mov eax, dword ptr [g_101D4C88]
    inc esi
FUN_1003d860 ENDP
END
