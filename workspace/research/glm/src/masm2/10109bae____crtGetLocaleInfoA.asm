.686
.MODEL FLAT, C
EXTRN sub_100F85EF:PROC
EXTRN sub_100F88D1:PROC
EXTRN sub_100FB61C:PROC
EXTRN sub_100FC537:PROC
EXTRN sub_10106094:PROC
EXTRN sub_10109D11:PROC
EXTRN sub_10109D23:PROC
EXTRN sub_10109D25:PROC
EXTRN sub_10109D2D:PROC
EXTRN sub_10109D59:PROC
EXTRN sub_10109D75:PROC
EXTRN sub_10109DA6:PROC
EXTRN sub_10109DB0:PROC
EXTRN sub_10109DB5:PROC
EXTRN sub_10109DE7:PROC
EXTRN sub_10109E0A:PROC
EXTRN EXTRN fp_1010C044:DWORD:DWORD
EXTRN EXTRN fp_1010C054:DWORD:DWORD
EXTRN EXTRN fp_1010C0A8:DWORD:DWORD
EXTRN EXTRN g_101AE1A8:DWORD:DWORD
EXTRN EXTRN g_101AE264:DWORD:DWORD
.CODE
___crtGetLocaleInfoA PROC
    push push 24
    push push 010182570h
    call sub_100FB61C
    xor xor esi, esi
    cmp cmp dword ptr [g_101AE264], esi
    jne L1
    push push esi
    push push esi
    xor xor edi, edi
    inc inc edi
    push push edi
    push push esi
    call dword ptr [fp_1010C0A8]
    test test eax, eax
    je L0
    mov mov dword ptr [g_101AE264], edi
    jmp L2
    call dword ptr [fp_1010C054]
    cmp cmp eax, 120
    jne L3
    mov mov dword ptr [g_101AE264], 2
    mov mov eax, dword ptr [g_101AE264]
    cmp cmp eax, 2
    je sub_10109D25
    cmp cmp eax, esi
    je sub_10109D2D
L1:
    cmp cmp eax, 1
    jne L5
    mov mov dword ptr [ebp - 28], esi
    mov mov dword ptr [ebp - 32], esi
    cmp cmp dword ptr [ebp + 24], esi
    jne L4
    mov mov eax, dword ptr [g_101AE1A8]
    mov mov dword ptr [ebp + 24], eax
    push push esi
L2:
    push push esi
    push push dword ptr [ebp + 12]
    push push dword ptr [ebp + 8]
    call dword ptr [fp_1010C0A8]
    mov mov ebx, eax
    mov mov dword ptr [ebp - 36], ebx
    cmp cmp ebx, esi
    jne L6
    xor xor eax, eax
    jmp sub_10109D75
    mov mov dword ptr [ebp - 4], esi
    lea lea eax, [ebx + ebx]
    add add eax, 3
    and and eax, -4
    call sub_100F88D1
    mov mov dword ptr [ebp - 24], esp
    mov mov edi, esp
    mov mov dword ptr [ebp - 40], edi
    or or dword ptr [ebp - 4], -1
    jmp sub_10109D23
    xor xor eax, eax
    inc inc eax
    ret ret
    mov mov esp, dword ptr [ebp - 24]
    call sub_10106094
    xor xor esi, esi
    xor xor edi, edi
    or or dword ptr [ebp - 4], -1
    mov mov ebx, dword ptr [ebp - 36]
    cmp cmp edi, esi
    jne sub_10109D59
    lea lea eax, [ebx + ebx]
    push push eax
    call sub_100FC537
    pop pop ecx
    mov mov edi, eax
    cmp cmp edi, esi
    je sub_10109D11
    mov mov dword ptr [ebp - 32], 1
    push push ebx
    push push edi
    push push dword ptr [ebp + 12]
    push push dword ptr [ebp + 8]
    call dword ptr [fp_1010C0A8]
    test test eax, eax
    je sub_10109DB5
    push push esi
    push push esi
    cmp cmp dword ptr [ebp + 20], esi
    jne sub_10109DA6
    push push esi
    push push esi
    jmp sub_10109DB0
    push push dword ptr [ebp + 20]
    push push dword ptr [ebp + 16]
    push push -1
    push push edi
    push push esi
    push push dword ptr [ebp + 24]
    call dword ptr [fp_1010C044]
    mov mov dword ptr [ebp - 28], eax
    cmp cmp dword ptr [ebp - 32], esi
    je sub_10109DE7
L6:
    push push edi
    call sub_100F85EF
    pop pop ecx
    mov mov eax, dword ptr [ebp - 28]
    jmp sub_10109E0A
    push push dword ptr [ebp + 20]
___crtGetLocaleInfoA ENDP
END
