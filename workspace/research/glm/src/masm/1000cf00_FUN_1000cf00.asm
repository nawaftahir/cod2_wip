.686
.MODEL FLAT, C
EXTRN sub_1001393B:PROC
EXTRN sub_100EFE8F:PROC
EXTRN g_101D1BF8:DWORD
.CODE
FUN_1000cf00 PROC
    push ebx
    push ebp
    push edi
    push 0
    lea ebp, [esi + 4]
    push ebp
    mov ebp, dword ptr [esp + 36]
    push ebp
    mov ebp, dword ptr [esp + 36]
    push ebp
    mov ebp, dword ptr [esp + 36]
    push ebp
    mov ebp, dword ptr [esp + 36]
    mov word ptr [esi + 28], ax
    mov word ptr [esi + 26], cx
    push ebp
    movzx eax, ax
    mov word ptr [esi + 24], dx
    push eax
    movzx ecx, cx
    movzx edx, dx
    push ecx
    mov dword ptr [esi], 4
    mov edi, dword ptr [g_101D1BF8]
    mov ebx, dword ptr [edi]
    push edx
    push edi
    call dword ptr [ebx + 0x60]
    mov edi, eax
    test edi, edi
    jge L0
    push edi
    call sub_100EFE8F
    movzx ecx, word ptr [esi + 28]
    movzx edx, word ptr [esi + 26]
    push eax
    mov eax, dword ptr [esp + 28]
    push edi
    push eax
    movzx eax, word ptr [esi + 24]
    push 0
    push ecx
    mov ecx, dword ptr [esi + 32]
    push edx
    push eax
    push ecx
    push 010193598h
    push 1
    call sub_1001393B
    add esp, 40
L0:
    pop edi
    pop ebp
    pop ebx
    ret
FUN_1000cf00 ENDP
END
