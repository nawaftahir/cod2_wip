.686
.MODEL FLAT, C
EXTRN sub_1000CF34:PROC
EXTRN sub_1001392B:PROC
EXTRN sub_100EFE88:PROC
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
.CODE
FUN_1000ce80 PROC
    push push ebp
    push push edi
    push push 0
    lea lea ebp, [esi + 4]
    push push ebp
    mov mov ebp, dword ptr [esp + 28]
    push push ebp
    mov mov ebp, dword ptr [esp + 28]
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 32]
    mov mov word ptr [esi + 26], ax
    mov mov word ptr [esi + 24], cx
    push push ebp
    movzx movzx eax, ax
    movzx movzx ecx, cx
    push push eax
    mov mov word ptr [esi + 28], 1
    mov mov dword ptr [esi], 3
    mov mov edx, dword ptr [g_101D1BF8]
    mov mov edi, dword ptr [edx]
    push push ecx
    push push edx
    call call dword ptr [edi + 92]
    mov mov edi, eax
    test test edi, edi
    jge sub_1000CF34
    push push edi
    call sub_100EFE88
    movzx movzx edx, word ptr [esi + 26]
    mov mov ecx, dword ptr [esi + 32]
    push push eax
    movzx movzx eax, word ptr [esi + 24]
    push push edi
    push push ebx
    push push 0
    push push edx
    push push eax
    push push ecx
    push push 0101935D4h
    push push 1
    call sub_1001392B
    add add esp, 36
    pop pop edi
    pop pop ebp
    ret ret
FUN_1000ce80 ENDP
END
