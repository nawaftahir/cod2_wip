.686
.MODEL FLAT, C
EXTRN sub_1002AD19:PROC
EXTRN sub_1002B73E:PROC
EXTRN EXTRN g_101D492C:DWORD:DWORD
EXTRN EXTRN g_106A3130:DWORD:DWORD
EXTRN EXTRN g_106A3134:DWORD:DWORD
.CODE
FUN_1002b7f0 PROC
    mov mov al, byte ptr [g_101D492C]
    sub sub esp, 12
    test test al, al
    push push ebp
    mov mov ebp, dword ptr [esp + 24]
    push push esi
    push push edi
    jne L1
    mov mov ax, word ptr [ebx + 2]
    cmp cmp ax, 0200h
    jg L4
    movsx movsx eax, ax
    cmp cmp eax, 32
    mov mov edi, 5
    jle L2
    lea lea ebx, [ebx]
    inc inc edi
    mov mov edx, 1
    mov mov ecx, edi
    shl shl edx, cl
    cmp cmp eax, edx
    jg L3
    push push edi
    mov mov eax, 010696D00h
    call sub_1002AD19
    mov mov esi, eax
    add add esp, 4
    test test esi, esi
    jne L5
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebp
    add add esp, 12
    ret ret
    mov mov edx, dword ptr [esp + 28]
    mov mov ecx, edi
    mov mov eax, 1
    shl shl eax, cl
L2:
    mov mov ecx, dword ptr [g_106A3130]
L3:
    push push 0101DAA00h
    mov mov dword ptr [esp + 16], esi
    add add ecx, eax
    mov mov eax, dword ptr [g_106A3134]
    mov mov dword ptr [g_106A3130], ecx
    movsx movsx ecx, word ptr [ebx + 2]
    add add eax, ecx
    mov mov dword ptr [g_106A3134], eax
    mov mov eax, dword ptr [esp + 40]
    lea lea ecx, [esp + 16]
    push push ecx
    mov mov dword ptr [esi + 12], edx
    mov mov dword ptr [esi + 8], ebx
    mov mov dword ptr [esi + 4], ebp
    mov mov dword ptr [esp + 24], ebp
    mov mov dword ptr [esp + 28], eax
    call sub_1002B73E
    add add esp, 8
    mov mov eax, esi
    call L0
    pop pop edi
    mov mov eax, esi
    pop pop esi
    pop pop ebp
    add add esp, 12
    ret ret
FUN_1002b7f0 ENDP
END
