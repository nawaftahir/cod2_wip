.686
.MODEL FLAT, C
EXTRN sub_100F85EF:PROC
EXTRN sub_100F88D1:PROC
EXTRN sub_100FB61C:PROC
EXTRN sub_100FC537:PROC
EXTRN sub_10106094:PROC
EXTRN sub_10109D75:PROC
EXTRN sub_10109E0A:PROC
EXTRN fp_1010C044:DWORD
EXTRN fp_1010C054:DWORD
EXTRN fp_1010C0A8:DWORD
EXTRN g_101AE1A8:DWORD
EXTRN g_101AE264:DWORD
.CODE
___crtGetLocaleInfoA PROC
    push 24
    push 010182570h
    call sub_100FB61C
    xor esi, esi
    cmp dword ptr [g_101AE264], esi
    jne L1
    push esi
    push esi
    xor edi, edi
    inc edi
    push edi
    push esi
    call dword ptr [fp_1010C0A8]
    test eax, eax
    je L0
    mov dword ptr [g_101AE264], edi
    jmp L1
L0:
    call dword ptr [fp_1010C054]
    cmp eax, 120
    jne L1
    mov dword ptr [g_101AE264], 2
L1:
    mov eax, dword ptr [g_101AE264]
    cmp eax, 2
    je L11
    cmp eax, esi
    je L11
    cmp eax, 1
    jne L3
    mov dword ptr [ebp - 28], esi
    mov dword ptr [ebp - 32], esi
    cmp dword ptr [ebp + 24], esi
    jne L2
    mov eax, dword ptr [g_101AE1A8]
    mov dword ptr [ebp + 24], eax
L2:
    push esi
    push esi
    push dword ptr [ebp + 12]
    push dword ptr [ebp + 8]
    call dword ptr [fp_1010C0A8]
    mov ebx, eax
    mov dword ptr [ebp - 36], ebx
    cmp ebx, esi
    jne L4
L3:
    xor eax, eax
    jmp sub_10109D75
L4:
    mov dword ptr [ebp - 4], esi
    lea eax, [ebx + ebx]
    add eax, 3
    and eax, 0FFFFFFFCh
    call sub_100F88D1
    mov dword ptr [ebp - 24], esp
    mov edi, esp
    mov dword ptr [ebp - 40], edi
    or dword ptr [ebp - 4], 0FFFFFFFFh
    jmp L5
    xor eax, eax
    inc eax
    ret
    mov esp, dword ptr [ebp - 24]
    call sub_10106094
    xor esi, esi
    xor edi, edi
    or dword ptr [ebp - 4], 0FFFFFFFFh
    mov ebx, dword ptr [ebp - 36]
L5:
    cmp edi, esi
    jne L6
    lea eax, [ebx + ebx]
    push eax
    call sub_100FC537
    pop ecx
    mov edi, eax
    cmp edi, esi
    je L3
    mov dword ptr [ebp - 32], 1
L6:
    push ebx
    push edi
    push dword ptr [ebp + 12]
    push dword ptr [ebp + 8]
    call dword ptr [fp_1010C0A8]
    test eax, eax
    je L9
    push esi
    push esi
    cmp dword ptr [ebp + 20], esi
    jne L7
    push esi
    push esi
    jmp L8
L7:
    push dword ptr [ebp + 20]
    push dword ptr [ebp + 16]
L8:
    push -1
    push edi
    push esi
    push dword ptr [ebp + 24]
    call dword ptr [fp_1010C044]
    mov dword ptr [ebp - 28], eax
L9:
    cmp dword ptr [ebp - 32], esi
    je L10
    push edi
    call sub_100F85EF
    pop ecx
L10:
    mov eax, dword ptr [ebp - 28]
    jmp sub_10109E0A
L11:
    push dword ptr [ebp + 20]
___crtGetLocaleInfoA ENDP
END
