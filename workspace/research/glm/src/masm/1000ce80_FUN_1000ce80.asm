.686
.MODEL FLAT, C
EXTRN sub_1001392B:PROC
EXTRN sub_100EFE88:PROC
EXTRN g_101D1BF8:DWORD
.CODE
FUN_1000ce80 PROC
    push ebp
    push edi
    push 0
    lea ebp, [esi + 4]
    push ebp
    mov ebp, dword ptr [esp + 28]
    push ebp
    mov ebp, dword ptr [esp + 28]
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 32]
    mov word ptr [esi + 26], ax
    mov word ptr [esi + 24], cx
    push ebp
    movzx eax, ax
    movzx ecx, cx
    push eax
    mov word ptr [esi + 28], 1
    mov dword ptr [esi], 3
    mov edx, dword ptr [g_101D1BF8]
    mov edi, dword ptr [edx]
    push ecx
    push edx
    call dword ptr [edi + 0x5c]
    mov edi, eax
    test edi, edi
    jge L0
    push edi
    call sub_100EFE88
    movzx edx, word ptr [esi + 26]
    mov ecx, dword ptr [esi + 32]
    push eax
    movzx eax, word ptr [esi + 24]
    push edi
    push ebx
    push 0
    push edx
    push eax
    push ecx
    push 0101935D4h
    push 1
    call sub_1001392B
    add esp, 36
L0:
    pop edi
    pop ebp
    ret
FUN_1000ce80 ENDP
END
