.686
.MODEL FLAT, C
EXTRN sub_10065094:PROC
EXTRN sub_100650BB:PROC
EXTRN sub_100650E5:PROC
EXTRN sub_1006511F:PROC
EXTRN sub_10082937:PROC
EXTRN sub_10082E9B:PROC
EXTRN sub_1008328D:PROC
EXTRN sub_100834DF:PROC
EXTRN sub_1009A645:PROC
EXTRN sub_1009C064:PROC
EXTRN sub_1009C07C:PROC
EXTRN sub_1009C088:PROC
EXTRN sub_1009C0A6:PROC
EXTRN sub_1009C0AD:PROC
EXTRN sub_1009C0E0:PROC
EXTRN sub_1009C0E5:PROC
EXTRN sub_1009C0F9:PROC
EXTRN sub_1009C107:PROC
EXTRN sub_1009C119:PROC
.CODE
FUN_1009bf69 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ebx
    mov mov ebx, dword ptr [ebp + 8]
    push push edi
    xor xor edi, edi
    cmp cmp ebx, edi
    mov mov dword ptr [ebp - 4], ecx
    jne L0
    xor xor eax, eax
    jmp sub_1009C064
    push push esi
    push push 80
    add add ebx, 16
    call sub_10065094
    cmp cmp eax, edi
    je L1
    push push ebx
    push push 1
    push push edi
    push push edi
L0:
    push push edi
    push push edi
    mov mov ecx, eax
    call sub_1008328D
    mov mov esi, eax
    jmp L2
    xor xor esi, esi
    cmp cmp esi, edi
    je sub_1009C07C
    push push 36
    call sub_100650BB
    cmp cmp eax, edi
    je L3
    push push 0200h
    push push 1
    push push 1
    push push 14
    push push 3
    mov mov ecx, eax
    call sub_10082E9B
    jmp L4
    xor xor eax, eax
    cmp cmp eax, edi
    mov mov dword ptr [esi + 16], eax
    je sub_1009C0A6
    push push 64
    call sub_100650E5
    cmp cmp eax, edi
    mov mov dword ptr [ebp + 8], eax
    je sub_1009C088
    mov mov edi, dword ptr [ebx + 8]
    mov mov edx, edi
    lea lea ecx, [edx + 1]
    mov mov al, byte ptr [edx]
    inc inc edx
    test test al, al
    jne sub_1009C07C
    sub sub edx, ecx
    mov mov ecx, dword ptr [ebp + 8]
    push push ebx
    inc inc edx
    push push edx
    push push edi
    push push 5
    call sub_100834DF
    xor xor edi, edi
    jmp sub_1009C0AD
    xor xor eax, eax
    cmp cmp eax, edi
    mov mov dword ptr [esi + 32], eax
    je sub_1009C0E0
    push push 20
    call sub_1006511F
    cmp cmp eax, edi
    je sub_1009C0E5
    push push 010114AE8h
    push push edi
    push push dword ptr [esi + 32]
    mov mov ecx, eax
    call sub_10082937
    jmp sub_1009C0F9
    xor xor eax, eax
    cmp cmp eax, edi
    jne sub_1009C107
    xor xor eax, eax
    jmp sub_1009C119
    mov mov ecx, dword ptr [ebp - 4]
    push push esi
    mov mov dword ptr [esi + 32], eax
    call sub_1009A645
    mov mov eax, esi
    pop pop esi
    pop pop edi
    pop pop ebx
    leave leave
    ret ret 4
FUN_1009bf69 ENDP
END
