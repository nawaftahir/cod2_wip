.686
.MODEL FLAT, C
EXTRN sub_10065083:PROC
EXTRN sub_100650AF:PROC
EXTRN sub_100650D9:PROC
EXTRN sub_10065113:PROC
EXTRN sub_100828AD:PROC
EXTRN sub_1008292B:PROC
EXTRN sub_10082E8F:PROC
EXTRN sub_10083281:PROC
EXTRN sub_1008348A:PROC
EXTRN sub_1009A639:PROC
EXTRN sub_1009C7F2:PROC
EXTRN sub_1009C7FD:PROC
EXTRN sub_1009C806:PROC
EXTRN sub_1009C827:PROC
EXTRN sub_1009C82F:PROC
EXTRN sub_1009C84A:PROC
EXTRN sub_1009C861:PROC
EXTRN sub_1009C866:PROC
EXTRN sub_1009C87A:PROC
EXTRN sub_1009C888:PROC
EXTRN sub_1009C89A:PROC
.CODE
FUN_1009c702 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ebx
    push push esi
    push push edi
    mov mov esi, ecx
    push push 80
    mov mov dword ptr [ebp - 4], esi
    call sub_10065083
    xor xor ebx, ebx
    cmp cmp eax, ebx
    je L0
    lea lea ecx, [esi + 32]
    push push ecx
    push push 1
    push push ebx
    push push ebx
    push push ebx
    push push ebx
    mov mov ecx, eax
    call sub_10083281
    mov mov edi, eax
    jmp L1
    xor xor edi, edi
    cmp cmp edi, ebx
    je sub_1009C7FD
    push push 36
    call sub_100650AF
    cmp cmp eax, ebx
    je L2
    push push 0200h
    push push 1
    push push 1
    push push 20
    push push 3
    mov mov ecx, eax
    call sub_10082E8F
    jmp L3
    xor xor eax, eax
    cmp cmp eax, ebx
    mov mov dword ptr [edi + 16], eax
L1:
    je sub_1009C827
    push push 64
    call sub_100650D9
    cmp cmp eax, ebx
    je sub_1009C7F2
    add add esi, 32
    push push esi
    push push ebx
    push push 4
    mov mov ecx, eax
    call sub_1008348A
    mov mov esi, eax
    jmp sub_1009C806
    xor xor esi, esi
    cmp cmp esi, ebx
    je sub_1009C84A
    cmp cmp dword ptr [ebp + 8], ebx
    mov mov dword ptr [edi + 32], esi
    je sub_1009C82F
    push push dword ptr [ebp + 8]
    call sub_100828AD
    cmp cmp eax, ebx
    mov mov dword ptr [esi + 24], eax
    je sub_1009C861
    push push 20
L2:
    call sub_10065113
    cmp cmp eax, ebx
    je sub_1009C866
    push push 010114AE8h
    push push ebx
    push push dword ptr [edi + 32]
    mov mov ecx, eax
    call sub_1008292B
    jmp sub_1009C87A
    xor xor eax, eax
    cmp cmp eax, ebx
    jne sub_1009C888
    xor xor eax, eax
    jmp sub_1009C89A
    mov mov ecx, dword ptr [ebp - 4]
    push push edi
    mov mov dword ptr [edi + 32], eax
    call sub_1009A639
    mov mov eax, edi
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 4
FUN_1009c702 ENDP
END
