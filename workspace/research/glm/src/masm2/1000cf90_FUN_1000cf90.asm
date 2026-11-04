.686
.MODEL FLAT, C
EXTRN sub_1000D054:PROC
EXTRN sub_10013930:PROC
EXTRN sub_100EFE93:PROC
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_101D496B:DWORD:DWORD
.CODE
FUN_1000cf90 PROC
    push push ebx
    mov mov ebx, ecx
    mov mov word ptr [esi + 24], ax
    mov mov word ptr [esi + 26], ax
    mov mov word ptr [esi + 28], 1
    mov mov dword ptr [esi], 5
    mov mov cl, byte ptr [g_101D496B]
    test test cl, cl
    push push ebp
    mov mov ebp, dword ptr [esp + 12]
    push push edi
    jne L0
    mov mov ebx, 1
    mov mov ecx, dword ptr [g_101D1BF8]
    mov mov edx, dword ptr [ecx]
    push push 0
    lea lea edi, [esi + 4]
    push push edi
    mov mov edi, dword ptr [esp + 28]
    push push edi
    push push ebp
    push push 0
    movzx movzx eax, ax
    push push ebx
    push push eax
    push push ecx
    call call dword ptr [edx + 100]
    mov mov edi, eax
    test test edi, edi
    jge sub_1000D054
    push push edi
    call sub_100EFE93
    movzx movzx ecx, word ptr [esi + 24]
    mov mov edx, dword ptr [esi + 32]
    push push eax
    push push edi
    push push ebp
    push push ebx
    push push ecx
    push push edx
    push push 010193560h
    push push 1
    call sub_10013930
    add add esp, 32
    pop pop edi
    pop pop ebp
    pop pop ebx
    ret ret
FUN_1000cf90 ENDP
END
