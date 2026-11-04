.686
.MODEL FLAT, C
EXTRN sub_1000F1DA:PROC
EXTRN sub_1003E8E6:PROC
EXTRN sub_100F6CE6:PROC
EXTRN sub_100F6DA0:PROC
EXTRN g_101CE7EC:DWORD
EXTRN g_101D1BF8:DWORD
EXTRN g_1072DEBC:DWORD
EXTRN g_10764584:DWORD
EXTRN g_1076671C:DWORD
EXTRN g_10766720:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_1002fe70 PROC
    sub esp, 24
    push ebx
    push ebp
    push esi
    push edi
    xor ecx, ecx
    xor edi, edi
    test al, 2
    je L0
    mov edi, 2
L0:
    test al, 4
    je L1
    or edi, 4
L1:
    test al, 1
    je L2
    or edi, 1
L2:
    mov eax, dword ptr [g_1076671C]
    mov dword ptr [esp + 24], ecx
    mov dword ptr [esp + 28], ecx
    mov ecx, dword ptr [g_10766720]
    lea esi, [esp + 24]
    mov dword ptr [esp + 32], eax
    mov dword ptr [esp + 36], ecx
    call sub_1003E8E6
    mov edx, dword ptr [esp + 44]
    lea esi, [esp + 20]
    mov byte ptr [g_1072DEBC], 1
    call sub_1000F1DA
    movzx esi, byte ptr [esp + 52]
    mov ebp, dword ptr [esp + 48]
    mov ebx, dword ptr [esp + 20]
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
    push 010197F40h
    push 010193358h
    push eax
    call sub_100F6DA0
    mov eax, dword ptr [g_10764584]
    add esp, 12
    push eax
    call sub_100F6CE6
    add esp, 4
L4:
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push esi
    push ebp
    push ebx
    push edi
    push 0
    push 0
    push eax
    call dword ptr [ecx + 0xac]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L3
    pop edi
FUN_1002fe70 ENDP
END
