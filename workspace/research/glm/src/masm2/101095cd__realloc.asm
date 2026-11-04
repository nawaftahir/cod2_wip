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
EXTRN sub_1010976E:PROC
EXTRN sub_10109781:PROC
EXTRN sub_10109797:PROC
EXTRN sub_101097A2:PROC
EXTRN sub_101097A8:PROC
EXTRN sub_101097BF:PROC
EXTRN sub_101097CA:PROC
EXTRN sub_10109814:PROC
EXTRN sub_1010982B:PROC
EXTRN sub_1010984E:PROC
EXTRN sub_101098BB:PROC
EXTRN sub_101098C3:PROC
EXTRN sub_101098C8:PROC
EXTRN sub_101098D2:PROC
EXTRN sub_101098D3:PROC
EXTRN sub_10109906:PROC
EXTRN sub_1010990E:PROC
EXTRN EXTRN fp_1010C130:DWORD:DWORD
EXTRN EXTRN fp_1010C1AC:DWORD:DWORD
EXTRN EXTRN g_101AE238:DWORD:DWORD
EXTRN EXTRN g_1076AC70:DWORD:DWORD
EXTRN EXTRN g_1076AC94:DWORD:DWORD
EXTRN EXTRN g_1076AC98:DWORD:DWORD
.CODE
_realloc PROC
    push push 20
    push push 010182520h
    call sub_100FB61C
    mov mov edi, dword ptr [ebp + 8]
    xor xor ebx, ebx
    cmp cmp edi, ebx
    jne L0
    push push dword ptr [ebp + 12]
    call sub_100FC481
    pop pop ecx
    jmp sub_10109797
    mov mov esi, dword ptr [ebp + 12]
    cmp cmp esi, ebx
    jne L1
    push push edi
    call sub_100F8500
    pop pop ecx
    jmp sub_101097A8
    cmp cmp dword ptr [g_1076AC98], 3
    jne sub_10109781
    mov mov dword ptr [ebp - 28], ebx
    cmp cmp esi, -32
    ja L8
    push push 4
    call sub_100FC0D3
    pop pop ecx
    mov mov dword ptr [ebp - 4], ebx
    push push edi
    call sub_1010120B
L1:
    pop pop ecx
    mov mov dword ptr [ebp - 32], eax
    cmp cmp eax, ebx
    je L7
    cmp cmp esi, dword ptr [g_1076AC70]
    ja L3
    push push esi
    push push edi
    push push eax
    call sub_10101727
    add add esp, 12
    test test eax, eax
    je L2
    mov mov dword ptr [ebp - 28], edi
    jmp L5
    push push esi
    call sub_10101E5D
    pop pop ecx
    mov mov dword ptr [ebp - 28], eax
    cmp cmp eax, ebx
    je L6
    mov mov eax, dword ptr [edi - 4]
    dec dec eax
    mov mov dword ptr [ebp - 36], eax
    cmp cmp eax, esi
    jb L4
    mov mov eax, esi
    push push eax
    push push edi
    push push dword ptr [ebp - 28]
    call sub_100FCE9D
    push push edi
    call sub_1010125E
    mov mov dword ptr [ebp - 32], eax
    push push edi
    push push eax
    call sub_10101293
    add add esp, 24
    cmp cmp dword ptr [ebp - 28], ebx
    jne sub_101097A2
    cmp cmp esi, ebx
    jne L9
    xor xor esi, esi
    inc inc esi
    mov mov dword ptr [ebp + 12], esi
    add add esi, 15
    and and esi, -16
    mov mov dword ptr [ebp + 12], esi
    push push esi
    push push ebx
    push push dword ptr [g_1076AC94]
    call dword ptr [fp_1010C130]
    mov mov dword ptr [ebp - 28], eax
    cmp cmp eax, ebx
    je sub_101097CA
    mov mov eax, dword ptr [edi - 4]
    dec dec eax
    mov mov dword ptr [ebp - 36], eax
    cmp cmp eax, esi
    jb sub_101097BF
    mov mov eax, esi
    push push eax
    push push edi
    push push dword ptr [ebp - 28]
    call sub_100FCEF4
    push push edi
    push push dword ptr [ebp - 32]
    call sub_101012E3
    add add esp, 20
    or or dword ptr [ebp - 4], -1
    call sub_1010984E
    cmp cmp dword ptr [ebp - 32], ebx
    jne sub_1010982B
    cmp cmp esi, ebx
    jne sub_10109814
    xor xor esi, esi
    inc inc esi
    add add esi, 15
    and and esi, -16
    mov mov dword ptr [ebp + 12], esi
    push push esi
    push push edi
    push push ebx
    push push dword ptr [g_1076AC94]
    call dword ptr [fp_1010C1AC]
    mov mov dword ptr [ebp - 28], eax
    mov mov eax, dword ptr [ebp - 28]
    cmp cmp eax, ebx
    jne sub_101098BB
    cmp cmp dword ptr [g_101AE238], ebx
    je sub_101098C3
    push push esi
    call sub_10108001
    pop pop ecx
L6:
    test test eax, eax
    jne sub_1010976E
    jmp sub_101098D2
    xor xor ebx, ebx
    mov mov esi, dword ptr [ebp + 12]
    mov mov edi, dword ptr [ebp + 8]
    push push 4
    call sub_100FC11F
    pop pop ecx
    ret ret
    xor xor eax, eax
    cmp cmp esi, -32
    ja sub_101098D3
    cmp cmp esi, ebx
    jne sub_101098C8
L7:
    xor xor esi, esi
    inc inc esi
    push push esi
    push push edi
    push push ebx
    push push dword ptr [g_1076AC94]
    call dword ptr [fp_1010C1AC]
    cmp cmp eax, ebx
    jne sub_10109906
    cmp cmp dword ptr [g_101AE238], ebx
L9:
    je sub_1010990E
    push push esi
_realloc ENDP
END
