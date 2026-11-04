.686
.MODEL FLAT, C
EXTRN sub_100F8500:PROC
EXTRN sub_100FB61C:PROC
EXTRN sub_100FC0D3:PROC
EXTRN sub_100FC11F:PROC
EXTRN sub_100FC481:PROC
EXTRN sub_100FCE9D:PROC
EXTRN sub_100FCEF4:PROC
EXTRN sub_1010120B:PROC
EXTRN sub_1010125E:PROC
EXTRN sub_10101293:PROC
EXTRN sub_101012E3:PROC
EXTRN sub_10101727:PROC
EXTRN sub_10101E5D:PROC
EXTRN sub_10108001:PROC
EXTRN sub_10109797:PROC
EXTRN sub_101097A8:PROC
EXTRN sub_101098BB:PROC
EXTRN sub_101098C3:PROC
EXTRN sub_101098D2:PROC
EXTRN sub_10109906:PROC
EXTRN sub_1010990E:PROC
EXTRN fp_1010C130:DWORD
EXTRN fp_1010C1AC:DWORD
EXTRN g_101AE238:DWORD
EXTRN g_1076AC70:DWORD
EXTRN g_1076AC94:DWORD
EXTRN g_1076AC98:DWORD
.CODE
_realloc PROC
    push 20
    push 010182520h
    call sub_100FB61C
    mov edi, dword ptr [ebp + 8]
    xor ebx, ebx
    cmp edi, ebx
    jne L0
    push dword ptr [ebp + 12]
    call sub_100FC481
    pop ecx
    jmp sub_10109797
L0:
    mov esi, dword ptr [ebp + 12]
    cmp esi, ebx
    jne L1
    push edi
    call sub_100F8500
    pop ecx
    jmp sub_101097A8
L1:
    cmp dword ptr [g_1076AC98], 3
    jne L12
L2:
    mov dword ptr [ebp - 28], ebx
    cmp esi, -32
    ja L10
    push 4
    call sub_100FC0D3
    pop ecx
    mov dword ptr [ebp - 4], ebx
    push edi
    call sub_1010120B
    pop ecx
    mov dword ptr [ebp - 32], eax
    cmp eax, ebx
    je L8
    cmp esi, dword ptr [g_1076AC70]
    ja L5
    push esi
    push edi
    push eax
    call sub_10101727
    add esp, 12
    test eax, eax
    je L3
    mov dword ptr [ebp - 28], edi
    jmp L5
L3:
    push esi
    call sub_10101E5D
    pop ecx
    mov dword ptr [ebp - 28], eax
    cmp eax, ebx
    je L5
    mov eax, dword ptr [edi - 4]
    dec eax
    mov dword ptr [ebp - 36], eax
    cmp eax, esi
    jb L4
    mov eax, esi
L4:
    push eax
    push edi
    push dword ptr [ebp - 28]
    call sub_100FCE9D
    push edi
    call sub_1010125E
    mov dword ptr [ebp - 32], eax
    push edi
    push eax
    call sub_10101293
    add esp, 24
L5:
    cmp dword ptr [ebp - 28], ebx
    jne L8
    cmp esi, ebx
    jne L6
    xor esi, esi
    inc esi
    mov dword ptr [ebp + 12], esi
L6:
    add esi, 15
    and esi, 0FFFFFFF0h
    mov dword ptr [ebp + 12], esi
    push esi
    push ebx
    push dword ptr [g_1076AC94]
    call dword ptr [fp_1010C130]
    mov dword ptr [ebp - 28], eax
    cmp eax, ebx
    je L8
    mov eax, dword ptr [edi - 4]
    dec eax
    mov dword ptr [ebp - 36], eax
    cmp eax, esi
    jb L7
    mov eax, esi
L7:
    push eax
    push edi
    push dword ptr [ebp - 28]
    call sub_100FCEF4
    push edi
    push dword ptr [ebp - 32]
    call sub_101012E3
    add esp, 20
L8:
    or dword ptr [ebp - 4], 0FFFFFFFFh
    call L11
    cmp dword ptr [ebp - 32], ebx
    jne L10
    cmp esi, ebx
    jne L9
    xor esi, esi
    inc esi
L9:
    add esi, 15
    and esi, 0FFFFFFF0h
    mov dword ptr [ebp + 12], esi
    push esi
    push edi
    push ebx
    push dword ptr [g_1076AC94]
    call dword ptr [fp_1010C1AC]
    mov dword ptr [ebp - 28], eax
L10:
    mov eax, dword ptr [ebp - 28]
    cmp eax, ebx
    jne sub_101098BB
    cmp dword ptr [g_101AE238], ebx
    je sub_101098C3
    push esi
    call sub_10108001
    pop ecx
    test eax, eax
    jne L2
    jmp sub_101098D2
    xor ebx, ebx
    mov esi, dword ptr [ebp + 12]
    mov edi, dword ptr [ebp + 8]
L11:
    push 4
    call sub_100FC11F
    pop ecx
    ret
L12:
    xor eax, eax
    cmp esi, -32
    ja L14
    cmp esi, ebx
    jne L13
    xor esi, esi
    inc esi
L13:
    push esi
    push edi
    push ebx
    push dword ptr [g_1076AC94]
    call dword ptr [fp_1010C1AC]
L14:
    cmp eax, ebx
    jne sub_10109906
    cmp dword ptr [g_101AE238], ebx
    je sub_1010990E
    push esi
_realloc ENDP
END
