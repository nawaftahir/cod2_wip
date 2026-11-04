.686
.MODEL FLAT, C
EXTRN sub_1002661D:PROC
EXTRN sub_100268B3:PROC
EXTRN sub_100268B5:PROC
EXTRN sub_100268B7:PROC
EXTRN EXTRN g_101D4928:DWORD:DWORD
.CODE
FUN_10026840 PROC
    mov mov cx, word ptr [g_101D4928]
    movzx movzx eax, cx
    push push edi
    xor xor edi, edi
    test test eax, eax
    jle sub_100268B3
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 24]
    push push esi
    xor xor esi, esi
    test test eax, eax
    jle sub_100268B5
    mov mov edi, edi
    imul imul eax, edi
    add add eax, esi
    lea lea ebx, [eax*4 + 18]
    mov mov eax, dword ptr [esp + 24]
    push push ebp
    push push eax
    mov mov eax, dword ptr [esp + 28]
    push push edi
    push push esi
    call sub_1002661D
    mov mov ecx, dword ptr [esp + 48]
    mov mov byte ptr [ecx + ebx + 3], al
    mov mov cx, word ptr [g_101D4928]
    add add esp, 16
    movzx movzx eax, cx
    inc inc esi
    cmp cmp esi, eax
    jl sub_100268B7
    movzx movzx eax, cx
    inc inc edi
    cmp cmp edi, eax
    jl sub_100268B7
    pop pop esi
    pop pop ebp
    pop pop ebx
    pop pop edi
    ret ret
FUN_10026840 ENDP
END
