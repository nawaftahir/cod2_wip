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
.CODE
FUN_1009c702 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    push esi
    push edi
    mov esi, ecx
    push 80
    mov dword ptr [ebp - 4], esi
    call sub_10065083
    xor ebx, ebx
    cmp eax, ebx
    je L0
    lea ecx, [esi + 32]
    push ecx
    push 1
    push ebx
    push ebx
    push ebx
    push ebx
    mov ecx, eax
    call sub_10083281
    mov edi, eax
    jmp L1
L0:
    xor edi, edi
L1:
    cmp edi, ebx
    je L9
    push 36
    call sub_100650AF
    cmp eax, ebx
    je L2
    push 000000200h
    push 1
    push 1
    push 20
    push 3
    mov ecx, eax
    call sub_10082E8F
    jmp L3
L2:
    xor eax, eax
L3:
    cmp eax, ebx
    mov dword ptr [edi + 16], eax
    je L9
    push 64
    call sub_100650D9
    cmp eax, ebx
    je L4
    add esi, 32
    push esi
    push ebx
    push 4
    mov ecx, eax
    call sub_1008348A
    mov esi, eax
    jmp L5
L4:
    xor esi, esi
L5:
    cmp esi, ebx
    je L9
    cmp dword ptr [ebp + 8], ebx
    mov dword ptr [edi + 32], esi
    je L6
    push dword ptr [ebp + 8]
    call sub_100828AD
    cmp eax, ebx
    mov dword ptr [esi + 24], eax
    je L9
L6:
    push 20
    call sub_10065113
    cmp eax, ebx
    je L7
    push 010114AE8h
    push ebx
    push dword ptr [edi + 32]
    mov ecx, eax
    call sub_1008292B
    jmp L8
L7:
    xor eax, eax
L8:
    cmp eax, ebx
    jne L10
L9:
    xor eax, eax
    jmp L11
L10:
    mov ecx, dword ptr [ebp - 4]
    push edi
    mov dword ptr [edi + 32], eax
    call sub_1009A639
    mov eax, edi
L11:
    pop edi
    pop esi
    pop ebx
    leave
    ret 4
FUN_1009c702 ENDP
END
