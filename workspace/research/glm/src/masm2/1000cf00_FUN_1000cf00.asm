.686
.MODEL FLAT, C
EXTRN sub_1000CFCB:PROC
EXTRN sub_1001393B:PROC
EXTRN sub_100EFE8F:PROC
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
.CODE
FUN_1000cf00 PROC
    push push ebx
    push push ebp
    push push edi
    push push 0
    lea lea ebp, [esi + 4]
    push push ebp
    mov mov ebp, dword ptr [esp + 36]
    push push ebp
    mov mov ebp, dword ptr [esp + 36]
    push push ebp
    mov mov ebp, dword ptr [esp + 36]
    push push ebp
    mov mov ebp, dword ptr [esp + 36]
    mov mov word ptr [esi + 28], ax
    mov mov word ptr [esi + 26], cx
    push push ebp
    movzx movzx eax, ax
    mov mov word ptr [esi + 24], dx
    push push eax
    movzx movzx ecx, cx
    movzx movzx edx, dx
    push push ecx
    mov mov dword ptr [esi], 4
    mov mov edi, dword ptr [g_101D1BF8]
    mov mov ebx, dword ptr [edi]
    push push edx
    push push edi
    call call dword ptr [ebx + 96]
    mov mov edi, eax
    test test edi, edi
    jge sub_1000CFCB
    push push edi
    call sub_100EFE8F
    movzx movzx ecx, word ptr [esi + 28]
    movzx movzx edx, word ptr [esi + 26]
    push push eax
    mov mov eax, dword ptr [esp + 28]
    push push edi
    push push eax
    movzx movzx eax, word ptr [esi + 24]
    push push 0
    push push ecx
    mov mov ecx, dword ptr [esi + 32]
    push push edx
    push push eax
    push push ecx
    push push 010193598h
    push push 1
    call sub_1001393B
    add add esp, 40
    pop pop edi
    pop pop ebp
    pop pop ebx
    ret ret
FUN_1000cf00 ENDP
END
