.686
.MODEL FLAT, C
EXTRN sub_1001D760:PROC
EXTRN sub_1001F614:PROC
EXTRN sub_1001F61F:PROC
EXTRN sub_1001F62B:PROC
.CODE
FUN_1001f5b0 PROC
    mov mov eax, dword ptr [esp + 4]
    push push ebx
    movzx movzx ebx, byte ptr [eax + 29]
    push push esi
    xor xor esi, esi
    test test ebx, ebx
    push push edi
    mov mov edi, dword ptr [eax + 8]
    jle sub_1001F614
    push push ebp
    mov mov ebp, dword ptr [esp + 24]
    lea lea esp, [esp]
    mov mov ecx, esi
    and and ecx, 31
    mov mov edx, 1
    shl shl edx, cl
    mov mov ecx, esi
    sar sar ecx, 5
    test test dword ptr [eax + ecx*4 + 12], edx
    je sub_1001F62B
    mov mov eax, ebp
    mov mov ecx, edi
    call sub_1001D760
    mov mov eax, dword ptr [esp + 20]
    inc inc esi
    add add ebp, 64
    add add edi, 32
    cmp cmp esi, ebx
    jl sub_1001F61F
    pop pop ebp
    pop pop edi
    pop pop esi
    pop pop ebx
    ret ret
FUN_1001f5b0 ENDP
END
