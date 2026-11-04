.686
.MODEL FLAT, C
EXTRN sub_100F88DA:PROC
EXTRN sub_100FB61C:PROC
EXTRN sub_100FC53F:PROC
EXTRN sub_1010609D:PROC
EXTRN sub_10109BAF:PROC
EXTRN sub_10109BF5:PROC
EXTRN sub_10109C05:PROC
EXTRN sub_10109C09:PROC
EXTRN sub_10109C36:PROC
EXTRN sub_10109C41:PROC
EXTRN sub_10109C7E:PROC
EXTRN sub_10109C88:PROC
EXTRN sub_10109C8F:PROC
EXTRN EXTRN fp_1010C054:DWORD:DWORD
EXTRN EXTRN fp_1010C0A8:DWORD:DWORD
EXTRN EXTRN fp_1010C13C:DWORD:DWORD
EXTRN EXTRN fp_1010C190:DWORD:DWORD
EXTRN EXTRN g_101AE1A8:DWORD:DWORD
EXTRN EXTRN g_101AE260:DWORD:DWORD
.CODE
___crtGetLocaleInfoW PROC
    push push 24
    push push 010182560h
    call sub_100FB61C
    xor xor edi, edi
    xor xor ebx, ebx
    inc inc ebx
    cmp cmp dword ptr [g_101AE260], edi
    jne L1
    push push edi
    push push edi
    push push ebx
    push push edi
    call dword ptr [fp_1010C0A8]
    test test eax, eax
    je L0
    mov mov dword ptr [g_101AE260], ebx
    jmp L2
    call dword ptr [fp_1010C054]
    cmp cmp eax, 120
    jne L3
    mov mov dword ptr [g_101AE260], 2
    mov mov eax, dword ptr [g_101AE260]
    cmp cmp eax, ebx
    jne L4
    push push dword ptr [ebp + 20]
    push push dword ptr [ebp + 16]
    push push dword ptr [ebp + 12]
L0:
    push push dword ptr [ebp + 8]
    call dword ptr [fp_1010C0A8]
    jmp sub_10109C09
    cmp cmp eax, 2
    je L5
    cmp cmp eax, edi
    jne L7
    mov mov dword ptr [ebp - 28], edi
    mov mov dword ptr [ebp - 36], edi
L2:
    cmp cmp dword ptr [ebp + 24], edi
    jne L6
    mov mov eax, dword ptr [g_101AE1A8]
    mov mov dword ptr [ebp + 24], eax
    push push edi
    push push edi
    push push dword ptr [ebp + 12]
    push push dword ptr [ebp + 8]
    call dword ptr [fp_1010C190]
    mov mov dword ptr [ebp - 32], eax
    cmp cmp eax, edi
    jne sub_10109BAF
    xor xor eax, eax
    jmp sub_10109C41
    mov mov dword ptr [ebp - 4], edi
    add add eax, 3
    and and eax, -4
    call sub_100F88DA
    mov mov dword ptr [ebp - 24], esp
    mov mov esi, esp
    mov mov dword ptr [ebp - 40], esi
    or or dword ptr [ebp - 4], -1
    jmp sub_10109C05
    xor xor eax, eax
    inc inc eax
    ret ret
    mov mov esp, dword ptr [ebp - 24]
    call sub_1010609D
    xor xor edi, edi
    xor xor esi, esi
    or or dword ptr [ebp - 4], -1
    xor xor ebx, ebx
    inc inc ebx
    cmp cmp esi, edi
    jne sub_10109C36
    push push dword ptr [ebp - 32]
L5:
    call sub_100FC53F
    pop pop ecx
    mov mov esi, eax
    cmp cmp esi, edi
    je sub_10109BF5
    mov mov dword ptr [ebp - 36], ebx
    push push dword ptr [ebp - 32]
    push push esi
    push push dword ptr [ebp + 12]
    push push dword ptr [ebp + 8]
    call dword ptr [fp_1010C190]
    test test eax, eax
    je sub_10109C8F
    cmp cmp dword ptr [ebp + 20], edi
    jne sub_10109C7E
    push push edi
    push push edi
    jmp sub_10109C88
L7:
    push push dword ptr [ebp + 20]
    push push dword ptr [ebp + 16]
    push push -1
    push push esi
    push push ebx
    push push dword ptr [ebp + 24]
    call dword ptr [fp_1010C13C]
    mov mov dword ptr [ebp - 28], eax
___crtGetLocaleInfoW ENDP
END
