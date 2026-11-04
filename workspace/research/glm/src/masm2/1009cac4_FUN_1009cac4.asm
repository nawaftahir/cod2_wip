.686
.MODEL FLAT, C
EXTRN sub_100637AF:PROC
EXTRN sub_100637C0:PROC
EXTRN sub_10099BC0:PROC
EXTRN sub_1009B5FB:PROC
EXTRN sub_1009B630:PROC
EXTRN sub_1009B7C1:PROC
EXTRN sub_1009B7F6:PROC
EXTRN sub_1009CCD7:PROC
EXTRN sub_1009CCE0:PROC
EXTRN sub_1009CCEF:PROC
EXTRN sub_1009CCFD:PROC
EXTRN sub_1009CD01:PROC
EXTRN sub_1009CD42:PROC
EXTRN sub_1009CD47:PROC
EXTRN sub_1009CD4E:PROC
EXTRN sub_1009CD6C:PROC
EXTRN sub_1009CD75:PROC
EXTRN sub_1009CD7F:PROC
EXTRN sub_1009CD99:PROC
EXTRN sub_1009CDA0:PROC
EXTRN sub_1009CDDB:PROC
EXTRN sub_1009CDE3:PROC
EXTRN sub_1009CE07:PROC
EXTRN sub_1009CE18:PROC
EXTRN sub_1009CE24:PROC
EXTRN sub_1009CE36:PROC
EXTRN sub_1009CE49:PROC
EXTRN sub_1009CE51:PROC
.CODE
FUN_1009cac4 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 32
    push push ebx
    mov mov ebx, dword ptr [ebp + 8]
    push push esi
    push push edi
    mov mov edi, dword ptr [ebp + 12]
    xor xor esi, esi
    cmp cmp edi, esi
    mov mov dword ptr [ebp - 8], ecx
    mov mov dword ptr [ebp - 4], esi
    je L2
    mov mov eax, dword ptr [ebx + 28]
    cmp cmp eax, esi
    je L3
    lea lea ecx, [ebp - 20]
    push push ecx
    push push esi
    push push dword ptr [eax + 24]
    call sub_100637AF
    test test eax, eax
    jl L0
    lea lea eax, [ebp - 32]
    push push eax
    push push esi
    push push dword ptr [edi + 24]
    call sub_100637C0
    test test eax, eax
    jl L1
    mov mov eax, dword ptr [ebp - 28]
    cmp cmp dword ptr [ebp - 16], eax
    je L5
    mov mov ecx, eax
    xor xor ecx, dword ptr [ebp - 16]
    test test ecx, 0FFFF0000h
    jne sub_1009CCEF
    mov mov ecx, 0FFFFh
    test test dword ptr [ebp - 16], ecx
    je L4
    test test ecx, eax
    jne sub_1009CD01
    and and eax, ecx
    neg neg eax
    sbb sbb eax, eax
    inc inc eax
    inc inc eax
    mov mov dword ptr [ebp - 4], eax
    jmp L9
    mov mov eax, dword ptr [ebx + 28]
    mov mov esi, dword ptr [eax + 24]
    mov mov eax, dword ptr [edi + 24]
    mov mov dl, byte ptr [eax]
    mov mov cl, dl
    cmp cmp dl, byte ptr [esi]
    jne L7
    test test cl, cl
    je L7
    mov mov dl, byte ptr [eax + 1]
    mov mov cl, dl
    cmp cmp dl, byte ptr [esi + 1]
    jne L8
    inc inc eax
    inc inc eax
    inc inc esi
    inc inc esi
    test test cl, cl
    jne L6
    xor xor eax, eax
    jmp L10
    sbb sbb eax, eax
    sbb sbb eax, -1
    test test eax, eax
    je L11
    jmp sub_1009CD47
    xor xor eax, eax
    cmp cmp dword ptr [ebx + 28], esi
    sete sete al
    xor xor ecx, ecx
    cmp cmp edi, esi
    sete sete cl
    cmp cmp ecx, eax
    je L12
    mov mov dword ptr [ebp - 4], 2
    mov mov edi, dword ptr [ebx + 36]
    test test edi, edi
    mov mov eax, dword ptr [ebp + 16]
    mov mov dword ptr [ebp + 8], eax
    je sub_1009CD6C
    mov mov eax, dword ptr [ebp + 20]
    and and eax, 16
    mov mov dword ptr [ebp + 16], eax
    mov mov eax, dword ptr [edi + 8]
    mov mov edi, dword ptr [edi + 12]
    xor xor ecx, ecx
    test test edi, edi
    je sub_1009CCD7
    mov mov edx, dword ptr [edi + 8]
    cmp cmp dword ptr [edx + 4], 12
    jne sub_1009CCE0
    mov mov edi, dword ptr [edi + 12]
    inc inc ecx
    cmp cmp dword ptr [ebp + 16], 0
    je sub_1009CCFD
    mov mov edx, dword ptr [eax + 24]
    test test byte ptr [edx + 28], 64
    je sub_1009CD99
    mov mov edx, dword ptr [ebp + 8]
    test test edx, edx
    je sub_1009CDA0
    mov mov esi, dword ptr [eax + 24]
    mov mov eax, dword ptr [edx + 8]
    test test eax, eax
    mov mov ebx, dword ptr [esi + 32]
    je sub_1009CD42
    mov mov eax, dword ptr [eax + 16]
    mov mov dword ptr [ebp + 12], eax
    jmp sub_1009CD4E
    and and dword ptr [ebp + 12], 0
    test test byte ptr [esi + 28], 16
    je sub_1009CD7F
    mov mov ecx, dword ptr [ebp - 8]
L7:
    push push 0
    push push dword ptr [ebp + 12]
    push push ebx
    call sub_1009B7C1
    test test eax, eax
    je sub_1009CDE3
    push push dword ptr [ebp + 12]
    mov mov ecx, dword ptr [ebp - 8]
    push push ebx
    call sub_1009B5FB
    add add dword ptr [ebp - 4], eax
    test test byte ptr [esi + 28], 32
    je sub_1009CDDB
    push push dword ptr [ebp + 12]
    mov mov ecx, dword ptr [ebp - 8]
    call sub_10099BC0
    test test eax, eax
    jne sub_1009CE07
    mov mov ecx, dword ptr [ebp - 8]
    push push eax
    push push ebx
    push push dword ptr [ebp + 12]
    call sub_1009B7F6
    test test eax, eax
    je sub_1009CE18
    mov mov ecx, dword ptr [ebp - 8]
    push push ebx
    push push dword ptr [ebp + 12]
L11:
    call sub_1009B630
    add add dword ptr [ebp - 4], eax
    mov mov eax, dword ptr [ebp + 8]
    mov mov eax, dword ptr [eax + 12]
    mov mov dword ptr [ebp + 8], eax
    jmp sub_1009CE24
    test test ecx, ecx
    je sub_1009CE36
    test test edi, edi
    jne sub_1009CD75
    cmp cmp dword ptr [ebp + 8], 0
    je sub_1009CE49
    or or eax, -1
    jmp sub_1009CE51
    mov mov eax, dword ptr [ebp - 4]
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 16
FUN_1009cac4 ENDP
END
