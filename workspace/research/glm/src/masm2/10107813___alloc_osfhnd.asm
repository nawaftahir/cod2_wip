.686
.MODEL FLAT, C
EXTRN sub_100FB61C:PROC
EXTRN sub_100FBFF4:PROC
EXTRN sub_100FC090:PROC
EXTRN sub_100FC0A4:PROC
EXTRN sub_100FC0F0:PROC
EXTRN sub_100FC579:PROC
EXTRN sub_10101141:PROC
EXTRN sub_101079A0:PROC
EXTRN sub_101079AD:PROC
EXTRN sub_101079B9:PROC
EXTRN sub_10107A29:PROC
EXTRN sub_10107A78:PROC
EXTRN sub_10107A8C:PROC
EXTRN sub_10107A91:PROC
EXTRN sub_10107A94:PROC
EXTRN sub_10107AD1:PROC
EXTRN sub_10107AF4:PROC
EXTRN EXTRN fp_1010C030:DWORD:DWORD
EXTRN EXTRN fp_1010C03C:DWORD:DWORD
EXTRN EXTRN g_1076AC9C:DWORD:DWORD
.CODE
__alloc_osfhnd PROC
    push push 20
    push push 010182220h
    call sub_100FB61C
    or or dword ptr [ebp - 28], -1
    push push 11
    call sub_100FBFF4
    pop pop ecx
    test test eax, eax
    je L1
    push push 11
    call sub_100FC0A4
    pop pop ecx
    xor xor edi, edi
    mov mov dword ptr [ebp - 4], edi
    mov mov dword ptr [ebp - 36], edi
    cmp cmp edi, 64
    jge sub_101079AD
    mov mov esi, dword ptr [edi*4 + 01076ACA0h]
    test test esi, esi
    je L8
    mov mov dword ptr [ebp - 32], esi
    mov mov eax, dword ptr [edi*4 + 01076ACA0h]
    add add eax, 0480h
    cmp cmp esi, eax
    jae L9
    test test byte ptr [esi + 4], 1
    jne L5
    xor xor ebx, ebx
    cmp cmp dword ptr [esi + 8], ebx
    jne L3
    push push 10
    call sub_100FC0F0
    pop pop ecx
    mov mov dword ptr [ebp - 4], 1
    cmp cmp dword ptr [esi + 8], ebx
    jne L4
    push push 0FA0h
    lea lea eax, [esi + 12]
    push push eax
    call sub_10107AF4
    pop pop ecx
    pop pop ecx
    test test eax, eax
    jne L7
    push push -1
L0:
    lea lea eax, [ebp - 16]
    push push eax
    call sub_10101141
    pop pop ecx
    pop pop ecx
    or or eax, -1
    jmp sub_10107A29
    inc inc dword ptr [esi + 8]
    mov mov dword ptr [ebp - 4], ebx
    call sub_101079A0
    lea lea ebx, [esi + 12]
    push push ebx
    call dword ptr [fp_1010C030]
    test test byte ptr [esi + 4], 1
    je sub_101079B9
    push push ebx
    call dword ptr [fp_1010C03C]
    add add esi, 36
    jmp L2
    mov mov edi, dword ptr [ebp - 36]
    mov mov esi, dword ptr [ebp - 32]
    push push 10
    call sub_100FC090
    pop pop ecx
    ret ret
    or or dword ptr [esi], -1
    mov mov eax, esi
    sub sub eax, dword ptr [edi*4 + 01076ACA0h]
    cdq cdq
    push push 36
    pop pop ecx
    idiv idiv ecx
    mov mov ecx, edi
    shl shl ecx, 5
    add add eax, ecx
    mov mov dword ptr [ebp - 28], eax
    cmp cmp dword ptr [ebp - 28], -1
    jne sub_10107A78
    inc inc edi
    jmp L6
    mov mov esi, 0480h
    push push esi
    call sub_100FC579
    pop pop ecx
    mov mov dword ptr [ebp - 32], eax
    test test eax, eax
L2:
    je sub_10107A91
    lea lea ecx, [edi*4 + 01076ACA0h]
    mov mov dword ptr [ecx], eax
    add add dword ptr [g_1076AC9C], 32
    mov mov edx, dword ptr [ecx]
    add add edx, esi
    cmp cmp eax, edx
    jae sub_10107A94
    mov mov byte ptr [eax + 4], 0
    or or dword ptr [eax], -1
    mov mov byte ptr [eax + 5], 10
    and and dword ptr [eax + 8], 0
    add add eax, 36
    mov mov dword ptr [ebp - 32], eax
    jmp sub_10107A8C
    shl shl edi, 5
    mov mov dword ptr [ebp - 28], edi
L8:
    push push edi
    call L0
    pop pop ecx
    test test eax, eax
    jne sub_10107AD1
L9:
    or or dword ptr [ebp - 28], -1
__alloc_osfhnd ENDP
END
