.686
.MODEL FLAT, C
EXTRN sub_100F88DA:PROC
EXTRN sub_100FB61C:PROC
EXTRN sub_100FC53F:PROC
EXTRN sub_1010609D:PROC
EXTRN sub_10109C09:PROC
EXTRN sub_10109C41:PROC
EXTRN fp_1010C054:DWORD
EXTRN fp_1010C0A8:DWORD
EXTRN fp_1010C13C:DWORD
EXTRN fp_1010C190:DWORD
EXTRN g_101AE1A8:DWORD
EXTRN g_101AE260:DWORD
.CODE
___crtGetLocaleInfoW PROC
    push 24
    push 010182560h
    call sub_100FB61C
    xor edi, edi
    xor ebx, ebx
    inc ebx
    cmp dword ptr [g_101AE260], edi
    jne L1
    push edi
    push edi
    push ebx
    push edi
    call dword ptr [fp_1010C0A8]
    test eax, eax
    je L0
    mov dword ptr [g_101AE260], ebx
    jmp L1
L0:
    call dword ptr [fp_1010C054]
    cmp eax, 120
    jne L1
    mov dword ptr [g_101AE260], 2
L1:
    mov eax, dword ptr [g_101AE260]
    cmp eax, ebx
    jne L2
    push dword ptr [ebp + 20]
    push dword ptr [ebp + 16]
    push dword ptr [ebp + 12]
    push dword ptr [ebp + 8]
    call dword ptr [fp_1010C0A8]
    jmp sub_10109C09
L2:
    cmp eax, 2
    je L3
    cmp eax, edi
    jne L5
L3:
    mov dword ptr [ebp - 28], edi
    mov dword ptr [ebp - 36], edi
    cmp dword ptr [ebp + 24], edi
    jne L4
    mov eax, dword ptr [g_101AE1A8]
    mov dword ptr [ebp + 24], eax
L4:
    push edi
    push edi
    push dword ptr [ebp + 12]
    push dword ptr [ebp + 8]
    call dword ptr [fp_1010C190]
    mov dword ptr [ebp - 32], eax
    cmp eax, edi
    jne L6
L5:
    xor eax, eax
    jmp sub_10109C41
L6:
    mov dword ptr [ebp - 4], edi
    add eax, 3
    and eax, 0FFFFFFFCh
    call sub_100F88DA
    mov dword ptr [ebp - 24], esp
    mov esi, esp
    mov dword ptr [ebp - 40], esi
    or dword ptr [ebp - 4], 0FFFFFFFFh
    jmp L7
    xor eax, eax
    inc eax
    ret
    mov esp, dword ptr [ebp - 24]
    call sub_1010609D
    xor edi, edi
    xor esi, esi
    or dword ptr [ebp - 4], 0FFFFFFFFh
    xor ebx, ebx
    inc ebx
L7:
    cmp esi, edi
    jne L8
    push dword ptr [ebp - 32]
    call sub_100FC53F
    pop ecx
    mov esi, eax
    cmp esi, edi
    je L5
    mov dword ptr [ebp - 36], ebx
L8:
    push dword ptr [ebp - 32]
    push esi
    push dword ptr [ebp + 12]
    push dword ptr [ebp + 8]
    call dword ptr [fp_1010C190]
    test eax, eax
    je L11
    cmp dword ptr [ebp + 20], edi
    jne L9
    push edi
    push edi
    jmp L10
L9:
    push dword ptr [ebp + 20]
    push dword ptr [ebp + 16]
L10:
    push -1
    push esi
    push ebx
    push dword ptr [ebp + 24]
    call dword ptr [fp_1010C13C]
    mov dword ptr [ebp - 28], eax
___crtGetLocaleInfoW ENDP
END
