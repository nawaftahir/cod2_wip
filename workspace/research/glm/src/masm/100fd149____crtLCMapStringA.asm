.686
.MODEL FLAT, C
EXTRN sub_100F8712:PROC
EXTRN sub_100F8720:PROC
EXTRN sub_100F8918:PROC
EXTRN sub_100F89E6:PROC
EXTRN sub_100F8B14:PROC
EXTRN sub_100FB61C:PROC
EXTRN sub_100FC583:PROC
EXTRN sub_100FC651:PROC
EXTRN sub_100FC77D:PROC
EXTRN sub_100FD754:PROC
EXTRN sub_100FD76D:PROC
EXTRN sub_100FD78E:PROC
EXTRN sub_100FD797:PROC
EXTRN sub_100FD819:PROC
EXTRN sub_10100634:PROC
EXTRN sub_1010066A:PROC
EXTRN sub_101060DB:PROC
EXTRN sub_101061A9:PROC
EXTRN sub_101062DE:PROC
EXTRN sub_10108209:PROC
EXTRN sub_10108277:PROC
EXTRN sub_10108335:PROC
EXTRN fp_1010C044:DWORD
EXTRN fp_1010C054:DWORD
EXTRN fp_1010C138:DWORD
EXTRN fp_1010C13C:DWORD
EXTRN fp_1010C140:DWORD
EXTRN g_101AE004:DWORD
EXTRN g_101AE198:DWORD
EXTRN g_101AE1A8:DWORD
.CODE
___crtLCMapStringA PROC
    push 56
    push 01017C970h
    call sub_100FB61C
    xor ebx, ebx
    cmp dword ptr [g_101AE004], ebx
    jne L1
    push ebx
    push ebx
    xor esi, esi
    inc esi
    push esi
    push 01017C96Ch
    push 000000100h
    push ebx
    call dword ptr [fp_1010C140]
    test eax, eax
    je L0
    mov dword ptr [g_101AE004], esi
    jmp L1
L0:
    call dword ptr [fp_1010C054]
    cmp eax, 120
    jne L1
    mov dword ptr [g_101AE004], 2
L1:
    cmp dword ptr [ebp + 20], ebx
    jle L4
    mov ecx, dword ptr [ebp + 20]
    mov eax, dword ptr [ebp + 16]
L2:
    dec ecx
    cmp byte ptr [eax], bl
    je L3
    inc eax
    cmp ecx, ebx
    jne L2
    or ecx, 0FFFFFFFFh
L3:
    or eax, 0FFFFFFFFh
    sub eax, ecx
    add dword ptr [ebp + 20], eax
L4:
    mov eax, dword ptr [g_101AE004]
    cmp eax, 2
    je L16
    cmp eax, ebx
    je L16
    cmp eax, 1
    jne L19
    xor edi, edi
    mov dword ptr [ebp - 44], edi
    mov dword ptr [ebp - 56], ebx
    mov dword ptr [ebp - 52], ebx
    cmp dword ptr [ebp + 32], ebx
    jne L5
    mov eax, dword ptr [g_101AE1A8]
    mov dword ptr [ebp + 32], eax
L5:
    push ebx
    push ebx
    push dword ptr [ebp + 20]
    push dword ptr [ebp + 16]
    xor eax, eax
    cmp dword ptr [ebp + 36], ebx
    setne al
    lea eax, [eax*8 + 1]
    push eax
    push dword ptr [ebp + 32]
    call dword ptr [fp_1010C13C]
    mov esi, eax
    mov dword ptr [ebp - 48], esi
    cmp esi, ebx
    je L19
    mov dword ptr [ebp - 4], 1
    lea eax, [esi + esi]
    add eax, 3
    and eax, 0FFFFFFFCh
    call sub_100F8918
    mov dword ptr [ebp - 24], esp
    mov eax, esp
    mov dword ptr [ebp - 28], eax
    or dword ptr [ebp - 4], 0FFFFFFFFh
    jmp L6
    xor eax, eax
    inc eax
    ret
    mov esp, dword ptr [ebp - 24]
    call sub_101060DB
    xor ebx, ebx
    mov dword ptr [ebp - 28], ebx
    or dword ptr [ebp - 4], 0FFFFFFFFh
    mov edi, dword ptr [ebp - 44]
    mov esi, dword ptr [ebp - 48]
L6:
    cmp dword ptr [ebp - 28], ebx
    jne L7
    lea eax, [esi + esi]
    push eax
    call sub_100FC583
    pop ecx
    mov dword ptr [ebp - 28], eax
    cmp eax, ebx
    je L19
    mov dword ptr [ebp - 56], 1
L7:
    push esi
    push dword ptr [ebp - 28]
    push dword ptr [ebp + 20]
    push dword ptr [ebp + 16]
    push 1
    push dword ptr [ebp + 32]
    call dword ptr [fp_1010C13C]
    test eax, eax
    je L13
    push ebx
    push ebx
    push esi
    push dword ptr [ebp - 28]
    push dword ptr [ebp + 12]
    push dword ptr [ebp + 8]
    call dword ptr [fp_1010C140]
    mov edi, eax
    mov dword ptr [ebp - 44], edi
    cmp edi, ebx
    je L13
    test byte ptr [ebp + 13], 4
    je L8
    cmp dword ptr [ebp + 28], ebx
    je L13
    cmp edi, dword ptr [ebp + 28]
    jg L13
    push dword ptr [ebp + 28]
    push dword ptr [ebp + 24]
    push esi
    push dword ptr [ebp - 28]
    push dword ptr [ebp + 12]
    push dword ptr [ebp + 8]
    call dword ptr [fp_1010C140]
    jmp L13
L8:
    mov dword ptr [ebp - 4], 2
    lea eax, [edi + edi]
    add eax, 3
    and eax, 0FFFFFFFCh
    call sub_100F89E6
    mov dword ptr [ebp - 24], esp
    mov eax, esp
    mov dword ptr [ebp - 32], eax
    or dword ptr [ebp - 4], 0FFFFFFFFh
    jmp L9
    xor eax, eax
    inc eax
    ret
    mov esp, dword ptr [ebp - 24]
    call sub_101061A9
    xor ebx, ebx
    mov dword ptr [ebp - 32], ebx
    or dword ptr [ebp - 4], 0FFFFFFFFh
    mov edi, dword ptr [ebp - 44]
    mov esi, dword ptr [ebp - 48]
L9:
    cmp dword ptr [ebp - 32], ebx
    jne L10
    lea eax, [edi + edi]
    push eax
    call sub_100FC651
    pop ecx
    mov dword ptr [ebp - 32], eax
    cmp eax, ebx
    je L13
    mov dword ptr [ebp - 52], 1
L10:
    push edi
    push dword ptr [ebp - 32]
    push esi
    push dword ptr [ebp - 28]
    push dword ptr [ebp + 12]
    push dword ptr [ebp + 8]
    call dword ptr [fp_1010C140]
    test eax, eax
    je L13
    push ebx
    push ebx
    cmp dword ptr [ebp + 28], ebx
    jne L11
    push ebx
    push ebx
    jmp L12
L11:
    push dword ptr [ebp + 28]
    push dword ptr [ebp + 24]
L12:
    push edi
    push dword ptr [ebp - 32]
    push ebx
    push dword ptr [ebp + 32]
    call dword ptr [fp_1010C044]
    mov edi, eax
L13:
    cmp dword ptr [ebp - 52], ebx
    je L14
    push dword ptr [ebp - 32]
    call sub_100F8712
    pop ecx
L14:
    cmp dword ptr [ebp - 56], ebx
    je L15
    push dword ptr [ebp - 28]
    call sub_100F8720
    pop ecx
L15:
    mov eax, edi
    jmp sub_100FD754
L16:
    mov dword ptr [ebp - 40], ebx
    xor edi, edi
    mov dword ptr [ebp - 60], ebx
    cmp dword ptr [ebp + 8], ebx
    jne L17
    mov eax, dword ptr [g_101AE198]
    mov dword ptr [ebp + 8], eax
L17:
    cmp dword ptr [ebp + 32], ebx
    jne L18
    mov eax, dword ptr [g_101AE1A8]
    mov dword ptr [ebp + 32], eax
L18:
    push dword ptr [ebp + 8]
    call sub_10108209
    pop ecx
    mov dword ptr [ebp - 64], eax
    cmp eax, -1
    jne L20
L19:
    xor eax, eax
    jmp sub_100FD78E
L20:
    cmp eax, dword ptr [ebp + 32]
    je sub_100FD76D
    push ebx
    push ebx
    lea ecx, [ebp + 20]
    push ecx
    push dword ptr [ebp + 16]
    push eax
    push dword ptr [ebp + 32]
    call sub_10108277
    add esp, 24
    mov dword ptr [ebp - 40], eax
    cmp eax, ebx
    je L19
    push ebx
    push ebx
    push dword ptr [ebp + 20]
    push eax
    push dword ptr [ebp + 12]
    push dword ptr [ebp + 8]
    call dword ptr [fp_1010C138]
    mov esi, eax
    mov dword ptr [ebp - 36], esi
    cmp esi, ebx
    je sub_100FD797
    mov dword ptr [ebp - 4], ebx
    add eax, 3
    and eax, 0FFFFFFFCh
    call sub_100F8B14
    mov dword ptr [ebp - 24], esp
    mov edi, esp
    mov dword ptr [ebp - 68], edi
    push esi
    push ebx
    push edi
    call sub_10100634
    add esp, 12
    jmp L21
    xor eax, eax
    inc eax
    ret
    mov esp, dword ptr [ebp - 24]
    call sub_101062DE
    xor ebx, ebx
    xor edi, edi
L21:
    or dword ptr [ebp - 4], 0FFFFFFFFh
    cmp edi, ebx
    jne L22
    push dword ptr [ebp - 36]
    call sub_100FC77D
    pop ecx
    mov edi, eax
    cmp edi, ebx
    je L23
    push dword ptr [ebp - 36]
    push ebx
    push edi
    call sub_1010066A
    add esp, 12
    mov dword ptr [ebp - 60], 1
L22:
    push dword ptr [ebp - 36]
    push edi
    push dword ptr [ebp + 20]
    push dword ptr [ebp - 40]
    push dword ptr [ebp + 12]
    push dword ptr [ebp + 8]
    call dword ptr [fp_1010C138]
    mov dword ptr [ebp - 36], eax
    cmp eax, ebx
    jne L24
L23:
    xor esi, esi
    jmp sub_100FD819
L24:
    push dword ptr [ebp + 28]
    push dword ptr [ebp + 24]
    lea eax, [ebp - 36]
    push eax
    push edi
    push dword ptr [ebp + 32]
    push dword ptr [ebp - 64]
    call sub_10108335
    add esp, 24
    mov esi, eax
    neg esi
    sbb esi, esi
    neg esi
___crtLCMapStringA ENDP
END
