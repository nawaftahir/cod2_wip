.686
.MODEL FLAT, C
EXTRN sub_100F860D:PROC
EXTRN sub_100F88EF:PROC
EXTRN sub_100FB61C:PROC
EXTRN sub_100FD8C3:PROC
EXTRN sub_10100410:PROC
EXTRN sub_1010110C:PROC
EXTRN sub_10101136:PROC
EXTRN sub_101060BE:PROC
EXTRN sub_101080EA:PROC
EXTRN sub_1010814D:PROC
EXTRN fp_1010C054:DWORD
EXTRN fp_1010C13C:DWORD
EXTRN fp_1010C1A0:DWORD
EXTRN fp_1010C1A4:DWORD
EXTRN g_101AE198:DWORD
EXTRN g_101AE1A8:DWORD
EXTRN g_101AE1B0:DWORD
.CODE
___crtGetStringTypeA PROC
    push 28
    push 01017E2B0h
    call sub_100FB61C
    xor esi, esi
    cmp dword ptr [g_101AE1B0], esi
    jne L1
    lea eax, [ebp - 28]
    push eax
    xor edi, edi
    inc edi
    push edi
    push 01017C96Ch
    push edi
    call dword ptr [fp_1010C1A4]
    test eax, eax
    je L0
    mov dword ptr [g_101AE1B0], edi
    jmp L1
L0:
    call dword ptr [fp_1010C054]
    cmp eax, 120
    jne L1
    mov dword ptr [g_101AE1B0], 2
L1:
    mov eax, dword ptr [g_101AE1B0]
    cmp eax, 2
    je L7
    cmp eax, esi
    je L7
    cmp eax, 1
    jne L10
    mov dword ptr [ebp - 36], esi
    mov dword ptr [ebp - 32], esi
    cmp dword ptr [ebp + 24], esi
    jne L2
    mov eax, dword ptr [g_101AE1A8]
    mov dword ptr [ebp + 24], eax
L2:
    push esi
    push esi
    push dword ptr [ebp + 16]
    push dword ptr [ebp + 12]
    xor eax, eax
    cmp dword ptr [ebp + 32], esi
    setne al
    lea eax, [eax*8 + 1]
    push eax
    push dword ptr [ebp + 24]
    call dword ptr [fp_1010C13C]
    mov edi, eax
    mov dword ptr [ebp - 40], edi
    test edi, edi
    je L10
    and dword ptr [ebp - 4], 0
    lea ebx, [edi + edi]
    mov eax, ebx
    add eax, 3
    and eax, 0FFFFFFFCh
    call sub_100F88EF
    mov dword ptr [ebp - 24], esp
    mov esi, esp
    mov dword ptr [ebp - 44], esi
    push ebx
    push 0
    push esi
    call sub_10100410
    add esp, 12
    or dword ptr [ebp - 4], 0FFFFFFFFh
    jmp L3
    xor eax, eax
    inc eax
    ret
    mov esp, dword ptr [ebp - 24]
    call sub_101060BE
    xor esi, esi
    or dword ptr [ebp - 4], 0FFFFFFFFh
    mov edi, dword ptr [ebp - 40]
L3:
    test esi, esi
    jne L4
    push edi
    push 2
    call sub_100FD8C3
    pop ecx
    pop ecx
    mov esi, eax
    test esi, esi
    je L10
    mov dword ptr [ebp - 32], 1
L4:
    push edi
    push esi
    push dword ptr [ebp + 16]
    push dword ptr [ebp + 12]
    push 1
    push dword ptr [ebp + 24]
    call dword ptr [fp_1010C13C]
    test eax, eax
    je L5
    push dword ptr [ebp + 20]
    push eax
    push esi
    push dword ptr [ebp + 8]
    call dword ptr [fp_1010C1A4]
    mov dword ptr [ebp - 36], eax
L5:
    cmp dword ptr [ebp - 32], 0
    je L6
    push esi
    call sub_100F860D
    pop ecx
L6:
    mov eax, dword ptr [ebp - 36]
    jmp sub_1010110C
L7:
    mov ebx, dword ptr [ebp + 28]
    cmp ebx, esi
    jne L8
    mov ebx, dword ptr [g_101AE198]
L8:
    mov edi, dword ptr [ebp + 24]
    test edi, edi
    jne L9
    mov edi, dword ptr [g_101AE1A8]
L9:
    push ebx
    call sub_101080EA
    pop ecx
    cmp eax, -1
    jne L11
L10:
    xor eax, eax
    jmp sub_10101136
L11:
    cmp eax, edi
    je L12
    push 0
    push 0
    lea ecx, [ebp + 16]
    push ecx
    push dword ptr [ebp + 12]
    push eax
    push edi
    call sub_1010814D
    add esp, 24
    mov esi, eax
    test esi, esi
    je L10
    mov dword ptr [ebp + 12], esi
L12:
    push dword ptr [ebp + 20]
    push dword ptr [ebp + 16]
    push dword ptr [ebp + 12]
    push dword ptr [ebp + 8]
    push ebx
    call dword ptr [fp_1010C1A0]
    mov edi, eax
___crtGetStringTypeA ENDP
END
