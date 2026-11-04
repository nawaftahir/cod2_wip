.686
.MODEL FLAT, C
EXTRN sub_10001968:PROC
EXTRN sub_1000198B:PROC
EXTRN sub_10001BDB:PROC
EXTRN sub_10001BE2:PROC
EXTRN sub_10001BE4:PROC
EXTRN sub_10001BED:PROC
EXTRN sub_10001C6E:PROC
EXTRN sub_10001C8D:PROC
EXTRN sub_10001C8E:PROC
EXTRN sub_10001C92:PROC
EXTRN sub_10001C9A:PROC
EXTRN sub_10001CA6:PROC
EXTRN sub_1001394B:PROC
EXTRN EXTRN g_101AE288:DWORD:DWORD
.CODE
FUN_10001a20 PROC
    sub sub esp, 090h
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 09Ch]
    push push esi
    mov mov esi, dword ptr [ebp]
    push push edi
    mov mov ebx, 16
    mov mov edx, 7
    mov mov eax, ebp
    add add esi, 64
    call sub_10001968
    mov mov edx, dword ptr [ebp + 4]
    mov mov esi, dword ptr [esi + 4]
    mov mov edi, eax
    add add esi, edx
    mov mov ebx, 0400000h
    mov mov edx, 1
    mov mov eax, ebp
    mov mov dword ptr [esp + 28], edi
    mov mov dword ptr [esp + 32], esi
    call sub_1000198B
    xor xor ebp, ebp
    test test edi, edi
    mov mov dword ptr [esp + 24], ebp
    jle L1
    lea lea edx, [esi + 2]
    movsx movsx ecx, word ptr [edx]
    cmp cmp ecx, 31
    je L2
    cmp cmp ebp, ecx
    jg L3
    lea lea ebp, [ecx + 1]
    add add edx, 16
    dec dec edi
    jne L0
    mov mov dword ptr [esp + 24], ebp
    test test eax, eax
    je L4
    cmp cmp eax, ebp
    je L5
    mov mov eax, dword ptr [g_101AE288]
    push push eax
    push push 010191A80h
    push push 1
    call sub_1001394B
    add add esp, 12
    xor xor eax, eax
    mov mov ecx, 31
    lea lea edi, [esp + 36]
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov edi, dword ptr [esp + 0A8h]
    mov mov ecx, 03C1h
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, dword ptr [esp + 0A4h]
    mov mov eax, dword ptr [ecx + 16]
    xor xor edi, edi
    test test eax, eax
    mov mov dword ptr [esp + 16], edi
    jle sub_10001C6E
    mov mov ecx, dword ptr [esp + 28]
L0:
    test test ecx, ecx
L2:
    jle sub_10001BDB
    lea lea eax, [esi + 8]
    mov mov edx, ecx
    mov mov edi, edi
    movsx movsx ecx, word ptr [eax - 8]
    cmp cmp ecx, edi
    jne sub_10001BE4
    movsx movsx ecx, word ptr [eax - 6]
    cmp cmp ecx, 31
    je sub_10001BED
    movsx movsx ebx, word ptr [eax]
    add add dword ptr [esp + ecx*4 + 36], ebx
    lea lea ecx, [esp + ecx*4 + 36]
    add add eax, 16
    dec dec edx
    jne sub_10001BE2
    xor xor eax, eax
    test test ebp, ebp
    mov mov dword ptr [esp + 20], eax
    jle sub_10001C92
    xor xor edi, edi
    mov mov edi, edi
    mov mov ebx, dword ptr [esp + eax*4 + 36]
    test test ebx, ebx
    je sub_10001C8E
    lea lea ecx, [eax + 1]
    cmp cmp ecx, ebp
    jge sub_10001C8D
    mov mov esi, dword ptr [esp + 0A8h]
    lea lea edx, [edi + eax]
    lea lea esi, [esi + edx*4 + 124]
    lea lea ecx, [ecx]
    mov mov edx, dword ptr [esp + ecx*4 + 36]
    test test edx, edx
    je sub_10001C9A
    mov mov ebp, dword ptr [esp + 0A8h]
    lea lea eax, [edi + ecx]
    lea lea eax, [ebp + eax*4]
    mov mov ebp, dword ptr [eax]
    add add edx, ebx
    add add ebp, edx
    mov mov dword ptr [eax], ebp
    jns sub_10001CA6
    mov mov dword ptr [eax], 07FFFFFFFh
    mov mov edx, dword ptr [eax]
    mov mov ebp, dword ptr [esp + 24]
    mov mov eax, dword ptr [esp + 20]
    mov mov dword ptr [esi], edx
    inc inc ecx
    add add esi, 124
    cmp cmp ecx, ebp
    jl sub_10001C9A
    mov mov esi, dword ptr [esp + 32]
    mov mov dword ptr [esp + eax*4 + 36], 0
    inc inc eax
    add add edi, 31
    cmp cmp eax, ebp
    mov mov dword ptr [esp + 20], eax
    jl sub_10001C92
    mov mov edi, dword ptr [esp + 16]
    mov mov eax, dword ptr [esp + 0A4h]
    mov mov ecx, dword ptr [eax + 16]
    inc inc edi
    cmp cmp edi, ecx
    mov mov dword ptr [esp + 16], edi
    jl sub_10001C6E
    pop pop edi
    pop pop esi
    mov mov eax, ebp
    pop pop ebp
    pop pop ebx
    add add esp, 090h
    ret ret
FUN_10001a20 ENDP
END
