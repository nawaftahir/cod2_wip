.686
.MODEL FLAT, C
EXTRN sub_100F8663:PROC
EXTRN sub_100F88E6:PROC
EXTRN sub_100FA27A:PROC
EXTRN sub_100FB61C:PROC
EXTRN sub_100FD8BE:PROC
EXTRN sub_100FD937:PROC
EXTRN sub_10100409:PROC
EXTRN sub_101060B7:PROC
EXTRN sub_10108286:PROC
EXTRN sub_1010832D:PROC
EXTRN fp_1010C044:DWORD
EXTRN fp_1010C13C:DWORD
EXTRN g_1010C188:DWORD
EXTRN g_101A50D0:DWORD
.CODE
___convertcp PROC
    push 56
    push 0101822B0h
    call sub_100FB61C
    mov eax, dword ptr [g_101A50D0]
    mov dword ptr [ebp - 28], eax
    xor edi, edi
    mov dword ptr [ebp - 52], edi
    mov dword ptr [ebp - 68], edi
    mov eax, dword ptr [ebp + 20]
    mov ebx, dword ptr [eax]
    mov dword ptr [ebp - 64], ebx
    mov dword ptr [ebp - 60], edi
    mov eax, dword ptr [ebp + 8]
    cmp eax, dword ptr [ebp + 12]
    je L13
    lea ecx, [ebp - 48]
    push ecx
    push eax
    mov esi, dword ptr [g_1010C188]
    call esi
    test eax, eax
    je L0
    cmp dword ptr [ebp - 48], 1
    jne L0
    lea eax, [ebp - 48]
    push eax
    push dword ptr [ebp + 12]
    call esi
    test eax, eax
    je L0
    cmp dword ptr [ebp - 48], 1
    jne L0
    mov dword ptr [ebp - 60], 1
L0:
    cmp dword ptr [ebp - 60], edi
    je L3
    cmp ebx, -1
    je L1
    mov esi, ebx
    jmp L2
L1:
    push dword ptr [ebp + 16]
    call sub_100FA27A
    pop ecx
    mov esi, eax
    inc esi
L2:
    mov dword ptr [ebp - 56], esi
    jmp L4
L3:
    mov esi, dword ptr [ebp - 56]
L4:
    cmp dword ptr [ebp - 60], edi
    jne L5
    push edi
    push edi
    push ebx
    push dword ptr [ebp + 16]
    push 1
    push dword ptr [ebp + 8]
    call dword ptr [fp_1010C13C]
    mov esi, eax
    mov dword ptr [ebp - 56], esi
    cmp esi, edi
    je L7
L5:
    mov dword ptr [ebp - 4], edi
    lea eax, [esi + esi]
    add eax, 3
    and eax, 0FFFFFFFCh
    call sub_100F88E6
    mov dword ptr [ebp - 24], esp
    mov ebx, esp
    mov dword ptr [ebp - 72], ebx
    lea eax, [esi + esi]
    push eax
    push edi
    push ebx
    call sub_10100409
    add esp, 12
    or dword ptr [ebp - 4], 0FFFFFFFFh
    jmp L6
    xor eax, eax
    inc eax
    ret
    mov esp, dword ptr [ebp - 24]
    call sub_101060B7
    xor edi, edi
    xor ebx, ebx
    or dword ptr [ebp - 4], 0FFFFFFFFh
    mov esi, dword ptr [ebp - 56]
L6:
    cmp ebx, edi
    jne L9
    push esi
    push 2
    call sub_100FD8BE
    pop ecx
    pop ecx
    mov ebx, eax
    cmp ebx, edi
    jne L8
L7:
    xor eax, eax
    jmp sub_10108286
L8:
    mov dword ptr [ebp - 68], 1
L9:
    push esi
    push ebx
    push dword ptr [ebp - 64]
    push dword ptr [ebp + 16]
    push 1
    push dword ptr [ebp + 8]
    call dword ptr [fp_1010C13C]
    test eax, eax
    je L14
    cmp dword ptr [ebp + 24], edi
    je L10
    push edi
    push edi
    push dword ptr [ebp + 28]
    push dword ptr [ebp + 24]
    push esi
    push ebx
    push edi
    push dword ptr [ebp + 12]
    call dword ptr [fp_1010C044]
    test eax, eax
    je L14
    mov eax, dword ptr [ebp + 24]
    mov dword ptr [ebp - 52], eax
    jmp L14
L10:
    cmp dword ptr [ebp - 60], edi
    jne L11
    push edi
    push edi
    push edi
    push edi
    push esi
    push ebx
    push edi
    push dword ptr [ebp + 12]
    call dword ptr [fp_1010C044]
    mov esi, eax
    cmp esi, edi
    je L14
L11:
    push esi
    push 1
    call sub_100FD937
    pop ecx
    pop ecx
    mov dword ptr [ebp - 52], eax
    cmp eax, edi
    je L14
    push edi
    push edi
    push esi
    push eax
    push esi
    push ebx
    push edi
    push dword ptr [ebp + 12]
    call dword ptr [fp_1010C044]
    cmp eax, edi
    jne L12
    push dword ptr [ebp - 52]
    call sub_100F8663
    pop ecx
    mov dword ptr [ebp - 52], edi
    jmp L14
L12:
    cmp dword ptr [ebp - 64], -1
    je L14
    mov ecx, dword ptr [ebp + 20]
    mov dword ptr [ecx], eax
    jmp L14
L13:
    mov ebx, dword ptr [ebp - 72]
L14:
    cmp dword ptr [ebp - 68], edi
    je sub_1010832D
    push ebx
___convertcp ENDP
END
