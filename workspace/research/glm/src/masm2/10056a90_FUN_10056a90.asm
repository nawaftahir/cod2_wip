.686
.MODEL FLAT, C
EXTRN sub_100567D1:PROC
EXTRN sub_100567D9:PROC
EXTRN sub_10056C08:PROC
EXTRN sub_10056C1A:PROC
EXTRN sub_10056C35:PROC
EXTRN sub_10056C46:PROC
EXTRN sub_10056C6D:PROC
EXTRN sub_10056C71:PROC
EXTRN sub_10056C84:PROC
EXTRN sub_10056C9C:PROC
EXTRN sub_10056CB2:PROC
EXTRN sub_10056CC8:PROC
.CODE
FUN_10056a90 PROC
    push push ecx
    mov mov ecx, dword ptr [esp + 20]
    mov mov eax, dword ptr [esp + 16]
    cmp cmp eax, ecx
    push push edi
    mov mov edi, dword ptr [esp + 16]
    jge sub_10056C08
    push push ebx
    push push ebp
    push push esi
    mov mov esi, eax
    lea lea edx, [eax + eax]
    shl shl esi, 5
    mov mov dword ptr [esp + 16], edx
    lea lea esi, [esi + edi + 12]
    jmp L0
    mov mov edi, dword ptr [esp + 28]
    nop nop
    xor xor ebx, ebx
    cmp cmp edx, ecx
    jg L1
    xor xor ecx, ecx
    test test edx, edx
    jle L4
    lea lea edx, [edi + 28]
    mov mov ebp, eax
    mov mov edi, dword ptr [edx]
    cmp cmp edi, ebx
    jle L2
    cmp cmp dword ptr [edx - 4], 0
    jle L3
    lea lea ecx, [edx - 28]
    mov mov ebx, edi
    add add edx, 32
    dec dec ebp
    jne L2
    jmp L5
    xor xor ecx, ecx
    test test edx, edx
    jle L6
    lea lea edx, [edi + 24]
    mov mov ebp, eax
    mov mov edi, dword ptr [edx]
    cmp cmp edi, ebx
    jle L7
    lea lea ecx, [edx - 24]
    mov mov ebx, edi
    add add edx, 32
    dec dec ebp
    jne L7
    test test ecx, ecx
    je sub_10056C6D
    mov mov eax, dword ptr [ecx + 4]
    mov mov dword ptr [esi - 8], eax
    mov mov edx, dword ptr [ecx + 12]
    mov mov dword ptr [esi], edx
    mov mov eax, dword ptr [ecx + 20]
    mov mov dword ptr [esi + 8], eax
    mov mov edx, dword ptr [ecx]
    mov mov dword ptr [esi - 12], edx
    mov mov eax, dword ptr [ecx + 8]
    mov mov dword ptr [esi - 4], eax
    mov mov edx, dword ptr [ecx + 16]
    lea lea ebx, [esi - 12]
    mov mov dword ptr [esi + 4], edx
    mov mov eax, dword ptr [ecx]
    mov mov edi, dword ptr [ecx + 4]
    mov mov edx, dword ptr [ecx + 16]
    mov mov ebp, dword ptr [ecx + 8]
    sub sub edi, eax
    mov mov eax, dword ptr [ecx + 20]
    sub sub eax, edx
    mov mov edx, dword ptr [ecx + 12]
    sub sub edx, ebp
    lea lea edx, [edx + edx*2]
    shl shl eax, 4
    shl shl edx, 2
    shl shl edi, 3
    cmp cmp eax, edx
    mov mov ebp, 1
    jle sub_10056C35
    mov mov edx, eax
    mov mov ebp, 2
L6:
    cmp cmp edi, edx
    jle sub_10056C46
    xor xor ebp, ebp
    sub sub ebp, 0
    je sub_10056C84
    dec dec ebp
    je sub_10056C71
    dec dec ebp
    jne sub_10056C9C
    mov mov eax, dword ptr [ecx + 20]
    mov mov edx, dword ptr [ecx + 16]
    add add eax, edx
    cdq cdq
    sub sub eax, edx
    sar sar eax, 1
    mov mov dword ptr [ecx + 20], eax
    inc inc eax
    mov mov dword ptr [esi + 4], eax
    jmp sub_10056CB2
    mov mov eax, dword ptr [ecx + 12]
    mov mov edx, dword ptr [ecx + 8]
    add add eax, edx
    cdq cdq
    sub sub eax, edx
    sar sar eax, 1
    mov mov dword ptr [ecx + 12], eax
    inc inc eax
    mov mov dword ptr [esi - 4], eax
    jmp sub_10056CC8
    mov mov eax, dword ptr [ecx + 4]
    mov mov edx, dword ptr [ecx]
    add add eax, edx
    cdq cdq
    sub sub eax, edx
    sar sar eax, 1
    mov mov dword ptr [ecx + 4], eax
    inc inc eax
    mov mov dword ptr [ebx], eax
    mov mov edi, dword ptr [esp + 24]
    push push ecx
    mov mov ecx, edi
    call sub_100567D1
    push push ebx
    mov mov ecx, edi
    call sub_100567D9
    mov mov eax, dword ptr [esp + 40]
    mov mov edx, dword ptr [esp + 24]
    mov mov ecx, dword ptr [esp + 44]
    add add esp, 8
    inc inc eax
    add add edx, 2
    add add esi, 32
    cmp cmp eax, ecx
    mov mov dword ptr [esp + 32], eax
    mov mov dword ptr [esp + 16], edx
    jl sub_10056C1A
    pop pop esi
    pop pop ebp
    pop pop ebx
    pop pop edi
    pop pop ecx
    ret ret
FUN_10056a90 ENDP
END
