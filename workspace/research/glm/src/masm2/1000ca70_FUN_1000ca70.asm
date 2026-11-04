.686
.MODEL FLAT, C
EXTRN sub_1000CB42:PROC
EXTRN sub_1000CB53:PROC
EXTRN sub_1000CB67:PROC
EXTRN sub_1000CBAE:PROC
EXTRN sub_1000CBBA:PROC
EXTRN sub_1000CBBF:PROC
EXTRN sub_1000F0A9:PROC
.CODE
FUN_1000ca70 PROC
    sub sub esp, 8
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 20]
    push push esi
    mov mov ebx, eax
    mov mov eax, dword ptr [esp + 28]
    push push edi
    xor xor edi, edi
    and and eax, 1
    lea lea ecx, [ebp + 16]
    mov mov dword ptr [esp + 20], eax
    mov mov dword ptr [esp + 16], ecx
    jmp L0
    mov mov eax, dword ptr [esp + 20]
    test test eax, eax
    je L1
    mov mov esi, dword ptr [esp + 36]
    mov mov eax, dword ptr [esp + 40]
    mov mov edx, dword ptr [esp + 44]
    jmp L3
    movzx movzx ecx, byte ptr [edi + ebp + 8]
    mov mov eax, dword ptr [esp + 36]
    sar sar eax, cl
    mov mov edx, 1
    mov mov esi, 1
    sub sub edx, eax
    jns L2
    mov mov esi, eax
    mov mov edx, dword ptr [esp + 40]
    sar sar edx, cl
    mov mov eax, 1
    sub sub eax, edx
    mov mov eax, 1
    jns sub_1000CB42
    mov mov eax, edx
    mov mov edx, dword ptr [esp + 44]
    sar sar edx, cl
    mov mov ecx, 1
    sub sub ecx, edx
    js sub_1000CB67
    mov mov edx, 1
    mov mov ecx, dword ptr [esp + 32]
    push push esi
    push push ecx
    call sub_1000F0A9
    mov mov edx, dword ptr [esp + 24]
    mov mov dword ptr [edx], eax
    movzx movzx ecx, byte ptr [ebp + 12]
    add add esp, 8
    test test ecx, ecx
    jl sub_1000CBAE
    cmp cmp ecx, 1
    jle sub_1000CBBA
    cmp cmp ecx, 4
    je sub_1000CBBF
    add add dword ptr [edi*4 + 0101D0A74h], eax
    mov mov ecx, dword ptr [esp + 16]
    inc inc edi
    add add ecx, 4
    cmp cmp edi, 2
    mov mov dword ptr [esp + 16], ecx
    jl sub_1000CB53
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 8
    ret ret
FUN_1000ca70 ENDP
END
