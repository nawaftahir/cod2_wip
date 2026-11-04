.686
.MODEL FLAT, C
EXTRN sub_10026846:PROC
EXTRN sub_10026848:PROC
EXTRN EXTRN g_101D4928:DWORD:DWORD
.CODE
FUN_100267e0 PROC
    mov mov dx, word ptr [g_101D4928]
    movzx movzx eax, dx
    push push ebp
    xor xor ebp, ebp
    test test eax, eax
    jle sub_10026848
    push push edi
    xor xor edi, edi
    test test eax, eax
    jle sub_10026846
    imul imul eax, ebp
    add add eax, edi
    shl shl eax, 2
    mov mov dl, byte ptr [esi + eax + 2]
    mov mov byte ptr [ecx + eax + 20], dl
    mov mov dl, byte ptr [esi + eax + 1]
    mov mov byte ptr [ecx + eax + 19], dl
    mov mov dl, byte ptr [eax + esi]
    mov mov byte ptr [eax + ecx + 18], dl
    mov mov dl, byte ptr [esi + eax + 3]
    mov mov byte ptr [ecx + eax + 21], dl
    mov mov dx, word ptr [g_101D4928]
    movzx movzx eax, dx
    inc inc edi
    cmp cmp edi, eax
    jl sub_10026846
    movzx movzx eax, dx
    inc inc ebp
    cmp cmp ebp, eax
    jl sub_10026848
    pop pop edi
    pop pop ebp
    ret ret
FUN_100267e0 ENDP
END
