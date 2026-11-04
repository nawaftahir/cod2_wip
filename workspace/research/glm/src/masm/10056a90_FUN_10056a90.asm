.686
.MODEL FLAT, C
EXTRN sub_100567D1:PROC
EXTRN sub_100567D9:PROC
.CODE
FUN_10056a90 PROC
    push ecx
    mov ecx, dword ptr [esp + 20]
    mov eax, dword ptr [esp + 16]
    cmp eax, ecx
    push edi
    mov edi, dword ptr [esp + 16]
    jge L14
    push ebx
    push ebp
    push esi
    mov esi, eax
    lea edx, [eax + eax]
    shl esi, 5
    mov dword ptr [esp + 16], edx
    lea esi, [esi + edi + 12]
    jmp L1
L0:
    mov edi, dword ptr [esp + 28]
    nop
L1:
    xor ebx, ebx
    cmp edx, ecx
    jg L4
    xor ecx, ecx
    test edx, edx
    jle L7
    lea edx, [edi + 28]
    mov ebp, eax
L2:
    mov edi, dword ptr [edx]
    cmp edi, ebx
    jle L3
    cmp dword ptr [edx - 4], 0
    jle L3
    lea ecx, [edx - 28]
    mov ebx, edi
L3:
    add edx, 32
    dec ebp
    jne L2
    jmp L7
L4:
    xor ecx, ecx
    test edx, edx
    jle L7
    lea edx, [edi + 24]
    mov ebp, eax
L5:
    mov edi, dword ptr [edx]
    cmp edi, ebx
    jle L6
    lea ecx, [edx - 24]
    mov ebx, edi
L6:
    add edx, 32
    dec ebp
    jne L5
L7:
    test ecx, ecx
    je L13
    mov eax, dword ptr [ecx + 4]
    mov dword ptr [esi - 8], eax
    mov edx, dword ptr [ecx + 12]
    mov dword ptr [esi], edx
    mov eax, dword ptr [ecx + 20]
    mov dword ptr [esi + 8], eax
    mov edx, dword ptr [ecx]
    mov dword ptr [esi - 12], edx
    mov eax, dword ptr [ecx + 8]
    mov dword ptr [esi - 4], eax
    mov edx, dword ptr [ecx + 16]
    lea ebx, [esi - 12]
    mov dword ptr [esi + 4], edx
    mov eax, dword ptr [ecx]
    mov edi, dword ptr [ecx + 4]
    mov edx, dword ptr [ecx + 16]
    mov ebp, dword ptr [ecx + 8]
    sub edi, eax
    mov eax, dword ptr [ecx + 20]
    sub eax, edx
    mov edx, dword ptr [ecx + 12]
    sub edx, ebp
    lea edx, [edx + edx*2]
    shl eax, 4
    shl edx, 2
    shl edi, 3
    cmp eax, edx
    mov ebp, 1
    jle L8
    mov edx, eax
    mov ebp, 2
L8:
    cmp edi, edx
    jle L9
    xor ebp, ebp
L9:
    sub ebp, 0
    je L11
    dec ebp
    je L10
    dec ebp
    jne L12
    mov eax, dword ptr [ecx + 20]
    mov edx, dword ptr [ecx + 16]
    add eax, edx
    cdq
    sub eax, edx
    sar eax, 1
    mov dword ptr [ecx + 20], eax
    inc eax
    mov dword ptr [esi + 4], eax
    jmp L12
L10:
    mov eax, dword ptr [ecx + 12]
    mov edx, dword ptr [ecx + 8]
    add eax, edx
    cdq
    sub eax, edx
    sar eax, 1
    mov dword ptr [ecx + 12], eax
    inc eax
    mov dword ptr [esi - 4], eax
    jmp L12
L11:
    mov eax, dword ptr [ecx + 4]
    mov edx, dword ptr [ecx]
    add eax, edx
    cdq
    sub eax, edx
    sar eax, 1
    mov dword ptr [ecx + 4], eax
    inc eax
    mov dword ptr [ebx], eax
L12:
    mov edi, dword ptr [esp + 24]
    push ecx
    mov ecx, edi
    call sub_100567D1
    push ebx
    mov ecx, edi
    call sub_100567D9
    mov eax, dword ptr [esp + 40]
    mov edx, dword ptr [esp + 24]
    mov ecx, dword ptr [esp + 44]
    add esp, 8
    inc eax
    add edx, 2
    add esi, 32
    cmp eax, ecx
    mov dword ptr [esp + 32], eax
    mov dword ptr [esp + 16], edx
    jl L0
L13:
    pop esi
    pop ebp
    pop ebx
L14:
    pop edi
    pop ecx
    ret
FUN_10056a90 ENDP
END
