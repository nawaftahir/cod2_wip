.686
.MODEL FLAT, C
EXTRN sub_1000CA70:PROC
EXTRN sub_1000CA79:PROC
EXTRN sub_1000CACC:PROC
EXTRN sub_1000CAD8:PROC
EXTRN sub_1000CADD:PROC
EXTRN sub_1000F08A:PROC
EXTRN EXTRN g_101D4C6C:DWORD:DWORD
EXTRN EXTRN g_101D4C70:DWORD:DWORD
.CODE
FUN_1000c9d0 PROC
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 12]
    push push esi
    push push edi
    mov mov ebx, eax
    xor xor esi, esi
    lea lea esp, [esp]
    mov mov eax, esi
    dec dec eax
    mov mov eax, dword ptr [g_101D4C6C]
    jne L0
    mov mov eax, 0280h
    mov mov edx, dword ptr [g_101D4C70]
    mov mov ecx, esi
    dec dec ecx
    jne L1
    mov mov edx, 01E0h
    mov mov ecx, dword ptr [esp + 24]
    sar sar eax, cl
    mov mov edi, 1
    sub sub edi, eax
    mov mov edi, 1
    jns L2
    mov mov edi, eax
    sar sar edx, cl
    mov mov ecx, 1
    mov mov eax, edx
    sub sub ecx, eax
    js sub_1000CA79
    mov mov eax, 1
    movzx movzx edx, di
    push push edx
    movzx movzx eax, ax
    push push 3
    mov mov edx, 1
    call sub_1000F08A
    add add dword ptr [ebp + esi*4 + 16], eax
    movzx movzx ecx, byte ptr [ebp + 12]
    add add esp, 8
    test test ecx, ecx
    jl sub_1000CACC
    cmp cmp ecx, 1
    jle sub_1000CAD8
    cmp cmp ecx, 4
    je sub_1000CADD
    add add dword ptr [esi*4 + 0101D0A74h], eax
    inc inc esi
    cmp cmp esi, 2
    jl sub_1000CA70
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    ret ret
FUN_1000c9d0 ENDP
END
