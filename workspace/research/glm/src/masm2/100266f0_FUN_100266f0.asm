.686
.MODEL FLAT, C
EXTRN sub_1002675D:PROC
EXTRN sub_10026761:PROC
EXTRN sub_10026763:PROC
EXTRN EXTRN g_101D4928:DWORD:DWORD
.CODE
FUN_100266f0 PROC
    mov mov ax, word ptr [g_101D4928]
    movzx movzx edx, ax
    mov mov ecx, edx
    push push ebx
    shr shr ecx, 1
    xor xor ebx, ebx
    test test ecx, ecx
    jle sub_10026763
    push push ebp
    push push esi
    xor xor esi, esi
    test test edx, edx
    jle sub_1002675D
    lea lea esp, [esp]
    mov mov ecx, edx
    imul imul ecx, ebx
    add add ecx, esi
    mov mov eax, edx
    sub sub eax, ebx
    shl shl ecx, 2
    dec dec eax
    imul imul eax, edx
    mov mov edx, dword ptr [ecx + edi]
    add add eax, esi
    shl shl eax, 2
    mov mov ebp, dword ptr [eax + edi]
    mov mov dword ptr [ecx + edi], ebp
    mov mov dword ptr [eax + edi], edx
    mov mov ax, word ptr [g_101D4928]
    movzx movzx edx, ax
    inc inc esi
    cmp cmp esi, edx
    jl sub_10026761
    movzx movzx edx, ax
    mov mov ecx, edx
    inc inc ebx
    shr shr ecx, 1
    cmp cmp ebx, ecx
    jl sub_10026763
    pop pop esi
    pop pop ebp
    pop pop ebx
    ret ret
FUN_100266f0 ENDP
END
