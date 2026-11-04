.686
.MODEL FLAT, C
EXTRN sub_10018C26:PROC
EXTRN sub_10018C2E:PROC
EXTRN sub_10018C31:PROC
EXTRN sub_10018C32:PROC
EXTRN sub_10018C41:PROC
EXTRN sub_10018C45:PROC
EXTRN EXTRN g_101D496C:DWORD:DWORD
EXTRN EXTRN g_101D496D:DWORD:DWORD
.CODE
FUN_10018b50 PROC
    mov mov al, byte ptr [g_101D496D]
    push push ebx
    xor xor ebx, ebx
    cmp cmp al, bl
    push push esi
    jne L0
    mov mov esi, dword ptr [edi + 28]
    mov mov eax, dword ptr [edi + 20]
    or or esi, 07FF0000h
    and and eax, 0F812FFFFh
    mov mov dword ptr [edi + 28], esi
    or or eax, 0120000h
    pop pop esi
    mov mov dword ptr [edi + 4], ebx
    mov mov dword ptr [edi + 8], ebx
    mov mov dword ptr [edi + 12], ebx
    mov mov dword ptr [edi + 16], ebx
    mov mov dword ptr [edi], 1
    mov mov dword ptr [edi + 20], eax
    pop pop ebx
    ret ret
    cmp cmp byte ptr [g_101D496C], bl
    jne sub_10018C26
    mov mov eax, dword ptr [edi]
    push push ebp
    xor xor ebp, ebp
L0:
    cmp cmp eax, ebx
    jle sub_10018C2E
    lea lea edx, [edi + 20]
    mov mov esi, dword ptr [edx + 8]
    test test esi, 07000000h
    je sub_10018C32
    mov mov eax, dword ptr [edx]
    mov mov ecx, eax
    sar sar ecx, 24
    and and ecx, 7
    cmp cmp ecx, 1
    je sub_10018C41
    cmp cmp ecx, ebx
    je sub_10018C45
    or or esi, 07FF0000h
    and and eax, 0F911FFFFh
    or or eax, 01110000h
    mov mov dword ptr [edx + 8], esi
    mov mov dword ptr [edx], eax
    mov mov eax, dword ptr [edi]
    inc inc ebp
    add add edx, 32
    cmp cmp ebp, eax
    jl sub_10018C31
    pop pop ebp
    pop pop esi
    pop pop ebx
    ret ret
FUN_10018b50 ENDP
END
