.686
.MODEL FLAT, C
EXTRN sub_10013930:PROC
EXTRN sub_100EFE93:PROC
EXTRN g_101D1BF8:DWORD
EXTRN g_101D496B:DWORD
.CODE
FUN_1000cf90 PROC
    push ebx
    mov ebx, ecx
    mov word ptr [esi + 24], ax
    mov word ptr [esi + 26], ax
    mov word ptr [esi + 28], 1
    mov dword ptr [esi], 5
    mov cl, byte ptr [g_101D496B]
    test cl, cl
    push ebp
    mov ebp, dword ptr [esp + 12]
    push edi
    jne L0
    mov ebx, 1
L0:
    mov ecx, dword ptr [g_101D1BF8]
    mov edx, dword ptr [ecx]
    push 0
    lea edi, [esi + 4]
    push edi
    mov edi, dword ptr [esp + 28]
    push edi
    push ebp
    push 0
    movzx eax, ax
    push ebx
    push eax
    push ecx
    call dword ptr [edx + 0x64]
    mov edi, eax
    test edi, edi
    jge L1
    push edi
    call sub_100EFE93
    movzx ecx, word ptr [esi + 24]
    mov edx, dword ptr [esi + 32]
    push eax
    push edi
    push ebp
    push ebx
    push ecx
    push edx
    push 010193560h
    push 1
    call sub_10013930
    add esp, 32
L1:
    pop edi
    pop ebp
    pop ebx
    ret
FUN_1000cf90 ENDP
END
