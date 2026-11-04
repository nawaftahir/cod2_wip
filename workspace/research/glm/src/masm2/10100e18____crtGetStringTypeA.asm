.686
.MODEL FLAT, C
EXTRN sub_100F860D:PROC
EXTRN sub_100F88EF:PROC
EXTRN sub_100FB61C:PROC
EXTRN sub_100FD8C3:PROC
EXTRN sub_10100410:PROC
EXTRN sub_10100FDF:PROC
EXTRN sub_10100FEB:PROC
EXTRN sub_10101013:PROC
EXTRN sub_1010102C:PROC
EXTRN sub_10101069:PROC
EXTRN sub_10101083:PROC
EXTRN sub_1010108D:PROC
EXTRN sub_101010B2:PROC
EXTRN sub_101010CC:PROC
EXTRN sub_101010EE:PROC
EXTRN sub_1010110C:PROC
EXTRN sub_1010110D:PROC
EXTRN sub_10101118:PROC
EXTRN sub_10101136:PROC
EXTRN sub_101060BE:PROC
EXTRN sub_101080EA:PROC
EXTRN sub_1010814D:PROC
EXTRN EXTRN fp_1010C054:DWORD:DWORD
EXTRN EXTRN fp_1010C13C:DWORD:DWORD
EXTRN EXTRN fp_1010C1A0:DWORD:DWORD
EXTRN EXTRN fp_1010C1A4:DWORD:DWORD
EXTRN EXTRN g_101AE198:DWORD:DWORD
EXTRN EXTRN g_101AE1A8:DWORD:DWORD
EXTRN EXTRN g_101AE1B0:DWORD:DWORD
.CODE
___crtGetStringTypeA PROC
    push push 28
    push push 01017E2B0h
    call sub_100FB61C
    xor xor esi, esi
    cmp cmp dword ptr [g_101AE1B0], esi
    jne L0
    lea lea eax, [ebp - 28]
    push push eax
    xor xor edi, edi
    inc inc edi
    push push edi
    push push 01017C96Ch
    push push edi
    call dword ptr [fp_1010C1A4]
    test test eax, eax
    je L1
    mov mov dword ptr [g_101AE1B0], edi
    jmp L2
    call dword ptr [fp_1010C054]
    cmp cmp eax, 120
    jne L3
    mov mov dword ptr [g_101AE1B0], 2
    mov mov eax, dword ptr [g_101AE1B0]
    cmp cmp eax, 2
    je L5
    cmp cmp eax, esi
    je L6
L0:
    cmp cmp eax, 1
L1:
    jne sub_10100FEB
    mov mov dword ptr [ebp - 36], esi
    mov mov dword ptr [ebp - 32], esi
    cmp cmp dword ptr [ebp + 24], esi
    jne L4
    mov mov eax, dword ptr [g_101AE1A8]
    mov mov dword ptr [ebp + 24], eax
    push push esi
    push push esi
    push push dword ptr [ebp + 16]
    push push dword ptr [ebp + 12]
    xor xor eax, eax
    cmp cmp dword ptr [ebp + 32], esi
    setne setne al
    lea lea eax, [eax*8 + 1]
    push push eax
    push push dword ptr [ebp + 24]
    call dword ptr [fp_1010C13C]
    mov mov edi, eax
    mov mov dword ptr [ebp - 40], edi
    test test edi, edi
    je sub_1010102C
    and and dword ptr [ebp - 4], 0
    lea lea ebx, [edi + edi]
    mov mov eax, ebx
    add add eax, 3
    and and eax, -4
    call sub_100F88EF
    mov mov dword ptr [ebp - 24], esp
    mov mov esi, esp
    mov mov dword ptr [ebp - 44], esi
    push push ebx
    push push 0
    push push esi
    call sub_10100410
    add add esp, 12
    or or dword ptr [ebp - 4], -1
    jmp sub_10100FDF
    xor xor eax, eax
    inc inc eax
    ret ret
    mov mov esp, dword ptr [ebp - 24]
    call sub_101060BE
    xor xor esi, esi
    or or dword ptr [ebp - 4], -1
    mov mov edi, dword ptr [ebp - 40]
    test test esi, esi
    jne sub_10101013
L4:
    push push edi
    push push 2
    call sub_100FD8C3
    pop pop ecx
    pop pop ecx
    mov mov esi, eax
    test test esi, esi
    je sub_10101083
    mov mov dword ptr [ebp - 32], 1
    push push edi
    push push esi
    push push dword ptr [ebp + 16]
    push push dword ptr [ebp + 12]
    push push 1
    push push dword ptr [ebp + 24]
    call dword ptr [fp_1010C13C]
    test test eax, eax
    je sub_10101069
    push push dword ptr [ebp + 20]
    push push eax
    push push esi
    push push dword ptr [ebp + 8]
    call dword ptr [fp_1010C1A4]
    mov mov dword ptr [ebp - 36], eax
    cmp cmp dword ptr [ebp - 32], 0
    je sub_1010108D
    push push esi
    call sub_100F860D
    pop pop ecx
    mov mov eax, dword ptr [ebp - 36]
    jmp sub_1010110C
    mov mov ebx, dword ptr [ebp + 28]
    cmp cmp ebx, esi
    jne sub_101010B2
    mov mov ebx, dword ptr [g_101AE198]
    mov mov edi, dword ptr [ebp + 24]
    test test edi, edi
    jne sub_101010CC
    mov mov edi, dword ptr [g_101AE1A8]
    push push ebx
    call sub_101080EA
    pop pop ecx
    cmp cmp eax, -1
    jne sub_101010EE
    xor xor eax, eax
    jmp sub_10101136
    cmp cmp eax, edi
    je sub_10101118
    push push 0
    push push 0
    lea lea ecx, [ebp + 16]
    push push ecx
    push push dword ptr [ebp + 12]
    push push eax
    push push edi
    call sub_1010814D
    add add esp, 24
    mov mov esi, eax
    test test esi, esi
    je sub_1010110D
    mov mov dword ptr [ebp + 12], esi
    push push dword ptr [ebp + 20]
    push push dword ptr [ebp + 16]
    push push dword ptr [ebp + 12]
    push push dword ptr [ebp + 8]
    push push ebx
L5:
    call dword ptr [fp_1010C1A0]
    mov mov edi, eax
___crtGetStringTypeA ENDP
END
