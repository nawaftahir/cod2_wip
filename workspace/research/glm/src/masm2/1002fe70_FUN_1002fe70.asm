.686
.MODEL FLAT, C
EXTRN sub_1000F1DA:PROC
EXTRN sub_1002FF49:PROC
EXTRN sub_1002FF99:PROC
EXTRN sub_1002FFA7:PROC
EXTRN sub_1002FFAB:PROC
EXTRN sub_1003E8E6:PROC
EXTRN sub_100F6CE6:PROC
EXTRN sub_100F6DA0:PROC
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_1072DEBC:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
EXTRN EXTRN g_1076671C:DWORD:DWORD
EXTRN EXTRN g_10766720:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_1002fe70 PROC
    sub sub esp, 24
    push push ebx
    push push ebp
    push push esi
    push push edi
    xor xor ecx, ecx
    xor xor edi, edi
    test test al, 2
    je L0
    mov mov edi, 2
    test test al, 4
    je L1
    or or edi, 4
    test test al, 1
    je L2
    or or edi, 1
    mov mov eax, dword ptr [g_1076671C]
    mov mov dword ptr [esp + 24], ecx
    mov mov dword ptr [esp + 28], ecx
    mov mov ecx, dword ptr [g_10766720]
    lea lea esi, [esp + 24]
    mov mov dword ptr [esp + 32], eax
    mov mov dword ptr [esp + 36], ecx
L2:
    call sub_1003E8E6
    mov mov edx, dword ptr [esp + 44]
    lea lea esi, [esp + 20]
    mov mov byte ptr [g_1072DEBC], 1
    call sub_1000F1DA
    movzx movzx esi, byte ptr [esp + 52]
    mov mov ebp, dword ptr [esp + 48]
    mov mov ebx, dword ptr [esp + 20]
    jmp sub_1002FF49
    lea lea esp, [esp]
    mov mov edx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [edx + 8]
    test test eax, eax
    je sub_1002FF99
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je sub_1002FFA7
    push push 010197F40h
    push push 010193358h
    push push eax
    call sub_100F6DA0
    mov mov eax, dword ptr [g_10764584]
    add add esp, 12
    push push eax
    call sub_100F6CE6
    add add esp, 4
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push esi
    push push ebp
    push push ebx
    push push edi
    push push 0
    push push 0
    push push eax
    call call dword ptr [ecx + 0ACh]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_1002FFAB
    pop pop edi
FUN_1002fe70 ENDP
END
