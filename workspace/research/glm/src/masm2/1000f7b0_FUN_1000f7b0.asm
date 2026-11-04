.686
.MODEL FLAT, C
EXTRN sub_1000EB34:PROC
EXTRN sub_1000ECEE:PROC
EXTRN sub_1000EE5D:PROC
EXTRN sub_1000F909:PROC
EXTRN sub_1000F973:PROC
EXTRN sub_1000F980:PROC
EXTRN sub_1000F99B:PROC
EXTRN sub_1000F9AD:PROC
EXTRN sub_1000F9AE:PROC
EXTRN sub_1000F9B1:PROC
EXTRN sub_1000F9BA:PROC
EXTRN sub_1000F9CC:PROC
EXTRN EXTRN g_101D496B:DWORD:DWORD
.CODE
FUN_1000f7b0 PROC
    sub sub esp, 8
    push push ebp
    mov mov ebp, dword ptr [esp + 16]
    movsx movsx ecx, word ptr [ebp + 10]
    movsx movsx edx, word ptr [ebp + 8]
    push push esi
    mov mov esi, eax
    movzx movzx eax, byte ptr [ebp + 5]
    push push edi
    push push 0
    push push eax
    movsx movsx eax, word ptr [ebp + 6]
    push push ecx
    push push edx
    push push eax
    mov mov eax, dword ptr [esp + 52]
    mov mov ecx, esi
    call sub_1000EE5D
    mov mov eax, dword ptr [esi]
    xor xor ecx, ecx
    add add esp, 20
    cmp cmp eax, 5
    mov mov al, byte ptr [ebp + 5]
    setne setne cl
    mov mov edi, 1
    dec dec ecx
    and and ecx, 5
    inc inc ecx
    test test al, 2
    mov mov dword ptr [esp + 16], ecx
    jne L0
    movsx movsx ecx, word ptr [ebp + 6]
    mov mov eax, edi
    cmp cmp eax, ecx
    jl L1
    movsx movsx edx, word ptr [ebp + 8]
    cmp cmp eax, edx
    jl L3
    movsx movsx edx, word ptr [ebp + 10]
    cmp cmp eax, edx
    jge L4
    shl shl eax, 1
    inc inc edi
    jmp L2
    movzx movzx eax, byte ptr [esi + 8]
    dec dec edi
    cmp cmp edi, eax
    mov mov dword ptr [esp + 12], edi
    jl sub_1000F973
    push push ebx
    movsx movsx eax, word ptr [ebp + 6]
    movsx movsx ebx, di
    mov mov cl, bl
    sar sar eax, cl
    mov mov ecx, 1
    sub sub ecx, eax
    js L5
    mov mov eax, 1
    movsx movsx edx, word ptr [ebp + 8]
    mov mov cl, bl
    sar sar edx, cl
    mov mov ecx, 1
    sub sub ecx, edx
    js sub_1000F909
    mov mov edx, 1
    mov mov ecx, dword ptr [esp + 20]
    xor xor ebx, ebx
    test test ecx, ecx
    jle sub_1000F99B
    add add eax, 3
    lea lea ebp, [edx + 3]
    sar sar ebp, 2
L1:
    sar sar eax, 2
    imul imul ebp, eax
    imul imul ebp, dword ptr [esp + 40]
    lea lea ecx, [ecx]
    movzx movzx edx, byte ptr [esi + 8]
    mov mov eax, dword ptr [esi]
    sub sub edi, edx
    cmp cmp eax, 4
    jne sub_1000F980
    mov mov eax, dword ptr [esp + 32]
    mov mov ecx, dword ptr [esp + 36]
    push push eax
    push push edi
    push push ecx
    push push esi
    call sub_1000ECEE
    add add esp, 16
    jmp sub_1000F9BA
    cmp cmp eax, 5
    jne sub_1000F9AD
    test test edi, edi
    je sub_1000F9B1
    mov mov al, byte ptr [g_101D496B]
    test test al, al
    je sub_1000F9CC
    mov mov edx, dword ptr [esp + 32]
    mov mov eax, dword ptr [esp + 36]
    push push edx
    push push eax
    call sub_1000EB34
    add add esp, 8
    mov mov edx, dword ptr [esp + 32]
    mov mov eax, dword ptr [esp + 20]
    mov mov edi, dword ptr [esp + 16]
    add add edx, ebp
    inc inc ebx
    cmp cmp ebx, eax
    mov mov dword ptr [esp + 32], edx
    jl sub_1000F9AE
    mov mov ebp, dword ptr [esp + 28]
    movzx movzx ecx, byte ptr [esi + 8]
    dec dec edi
    cmp cmp edi, ecx
    mov mov dword ptr [esp + 16], edi
    jge sub_1000F973
    pop pop ebx
    pop pop edi
    pop pop esi
    pop pop ebp
    add add esp, 8
    ret ret
FUN_1000f7b0 ENDP
END
