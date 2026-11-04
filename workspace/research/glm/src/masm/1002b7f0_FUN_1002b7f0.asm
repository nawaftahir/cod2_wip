.686
.MODEL FLAT, C
EXTRN sub_1002AD19:PROC
EXTRN sub_1002B73E:PROC
EXTRN sub_1002B848:PROC
EXTRN g_101D492C:DWORD
EXTRN g_106A3130:DWORD
EXTRN g_106A3134:DWORD
.CODE
FUN_1002b7f0 PROC
    mov al, byte ptr [g_101D492C]
    sub esp, 12
    test al, al
    push ebp
    mov ebp, dword ptr [esp + 24]
    push esi
    push edi
    jne L2
    mov ax, word ptr [ebx + 2]
    cmp ax, 000000200h
    jg L2
    movsx eax, ax
    cmp eax, 32
    mov edi, 5
    jle L1
    lea ebx, [ebx]
L0:
    inc edi
    mov edx, 1
    mov ecx, edi
    shl edx, cl
    cmp eax, edx
    jg L0
L1:
    push edi
    mov eax, 010696D00h
    call sub_1002AD19
    mov esi, eax
    add esp, 4
    test esi, esi
    jne L3
L2:
    xor eax, eax
    pop edi
    pop esi
    pop ebp
    add esp, 12
    ret
L3:
    mov edx, dword ptr [esp + 28]
    mov ecx, edi
    mov eax, 1
    shl eax, cl
    mov ecx, dword ptr [g_106A3130]
    push 0101DAA00h
    mov dword ptr [esp + 16], esi
    add ecx, eax
    mov eax, dword ptr [g_106A3134]
    mov dword ptr [g_106A3130], ecx
    movsx ecx, word ptr [ebx + 2]
    add eax, ecx
    mov dword ptr [g_106A3134], eax
    mov eax, dword ptr [esp + 40]
    lea ecx, [esp + 16]
    push ecx
    mov dword ptr [esi + 12], edx
    mov dword ptr [esi + 8], ebx
    mov dword ptr [esi + 4], ebp
    mov dword ptr [esp + 24], ebp
    mov dword ptr [esp + 28], eax
    call sub_1002B73E
    add esp, 8
    mov eax, esi
    call sub_1002B848
    pop edi
    mov eax, esi
    pop esi
    pop ebp
    add esp, 12
    ret
FUN_1002b7f0 ENDP
END
