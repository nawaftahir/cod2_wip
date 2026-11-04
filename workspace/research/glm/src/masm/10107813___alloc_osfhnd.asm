.686
.MODEL FLAT, C
EXTRN sub_100FB61C:PROC
EXTRN sub_100FBFF4:PROC
EXTRN sub_100FC090:PROC
EXTRN sub_100FC0A4:PROC
EXTRN sub_100FC0F0:PROC
EXTRN sub_100FC579:PROC
EXTRN sub_10101141:PROC
EXTRN sub_101078A9:PROC
EXTRN sub_10107A29:PROC
EXTRN sub_10107AF4:PROC
EXTRN fp_1010C030:DWORD
EXTRN fp_1010C03C:DWORD
EXTRN g_1076AC9C:DWORD
.CODE
__alloc_osfhnd PROC
    push 20
    push 010182220h
    call sub_100FB61C
    or dword ptr [ebp - 28], 0FFFFFFFFh
    push 11
    call sub_100FBFF4
    pop ecx
    test eax, eax
    je L2
    push 11
    call sub_100FC0A4
    pop ecx
    xor edi, edi
    mov dword ptr [ebp - 4], edi
L0:
    mov dword ptr [ebp - 36], edi
    cmp edi, 64
    jge L13
    mov esi, dword ptr [edi*4 + 01076ACA0h]
    test esi, esi
    je L10
L1:
    mov dword ptr [ebp - 32], esi
    mov eax, dword ptr [edi*4 + 01076ACA0h]
    add eax, 000000480h
    cmp esi, eax
    jae L9
    test byte ptr [esi + 4], 1
    jne L6
    xor ebx, ebx
    cmp dword ptr [esi + 8], ebx
    jne L5
    push 10
    call sub_100FC0F0
    pop ecx
    mov dword ptr [ebp - 4], 1
    cmp dword ptr [esi + 8], ebx
    jne L4
    push 000000FA0h
    lea eax, [esi + 12]
    push eax
    call sub_10107AF4
    pop ecx
    pop ecx
    test eax, eax
    jne L3
    push -1
    lea eax, [ebp - 16]
    push eax
    call sub_10101141
    pop ecx
    pop ecx
L2:
    or eax, 0FFFFFFFFh
    jmp sub_10107A29
L3:
    inc dword ptr [esi + 8]
L4:
    mov dword ptr [ebp - 4], ebx
    call L7
L5:
    lea ebx, [esi + 12]
    push ebx
    call dword ptr [fp_1010C030]
    test byte ptr [esi + 4], 1
    je L8
    push ebx
    call dword ptr [fp_1010C03C]
L6:
    add esi, 36
    jmp L1
    mov edi, dword ptr [ebp - 36]
    mov esi, dword ptr [ebp - 32]
L7:
    push 10
    call sub_100FC090
    pop ecx
    ret
L8:
    or dword ptr [esi], 0FFFFFFFFh
    mov eax, esi
    sub eax, dword ptr [edi*4 + 01076ACA0h]
    cdq
    push 36
    pop ecx
    idiv ecx
    mov ecx, edi
    shl ecx, 5
    add eax, ecx
    mov dword ptr [ebp - 28], eax
L9:
    cmp dword ptr [ebp - 28], -1
    jne L13
    inc edi
    jmp L0
L10:
    mov esi, 000000480h
    push esi
    call sub_100FC579
    pop ecx
    mov dword ptr [ebp - 32], eax
    test eax, eax
    je L13
    lea ecx, [edi*4 + 01076ACA0h]
    mov dword ptr [ecx], eax
    add dword ptr [g_1076AC9C], 32
L11:
    mov edx, dword ptr [ecx]
    add edx, esi
    cmp eax, edx
    jae L12
    mov byte ptr [eax + 4], 0
    or dword ptr [eax], 0FFFFFFFFh
    mov byte ptr [eax + 5], 10
    and dword ptr [eax + 8], 0
    add eax, 36
    mov dword ptr [ebp - 32], eax
    jmp L11
L12:
    shl edi, 5
    mov dword ptr [ebp - 28], edi
    push edi
    call sub_101078A9
    pop ecx
    test eax, eax
    jne L13
    or dword ptr [ebp - 28], 0FFFFFFFFh
__alloc_osfhnd ENDP
END
