.686
.MODEL FLAT, C
EXTRN sub_10065087:PROC
EXTRN sub_100650AA:PROC
EXTRN sub_100650D1:PROC
EXTRN sub_100828E7:PROC
EXTRN sub_1008317D:PROC
EXTRN sub_100832A6:PROC
EXTRN sub_1009A6A3:PROC
EXTRN sub_1009A6A5:PROC
EXTRN sub_1009A6BA:PROC
EXTRN sub_1009A6BD:PROC
EXTRN sub_1009A6E8:PROC
EXTRN sub_1009A6F0:PROC
EXTRN sub_1009A702:PROC
EXTRN sub_1009A70E:PROC
.CODE
FUN_1009a612 PROC
    mov mov edi, edi
    push push ebx
    push push edi
    mov mov ebx, ecx
    xor xor edi, edi
    cmp cmp dword ptr [ebx + 24], edi
    jne L0
    xor xor eax, eax
    jmp sub_1009A6A3
    push push esi
    push push 36
    call sub_10065087
    cmp cmp eax, edi
    je L1
    mov mov ecx, eax
    call sub_1008317D
    mov mov esi, eax
    jmp L2
    xor xor esi, esi
    cmp cmp esi, edi
    je sub_1009A6BD
    push push 80
    mov mov dword ptr [esi + 16], 6
    call sub_100650AA
    cmp cmp eax, edi
    je sub_1009A6A5
    add add ebx, 32
    push push ebx
    push push 1
    push push edi
    push push edi
    push push edi
    push push edi
    mov mov ecx, eax
    call sub_100832A6
    jmp sub_1009A6BA
    xor xor eax, eax
    cmp cmp eax, edi
    je sub_1009A6E8
    push push 20
    mov mov dword ptr [esi + 24], eax
    call sub_100650D1
    cmp cmp eax, edi
    je sub_1009A6F0
    push push 010114734h
    push push edi
    push push esi
    mov mov ecx, eax
    call sub_100828E7
    jmp sub_1009A702
    xor xor eax, eax
    cmp cmp eax, edi
    jne sub_1009A70E
    xor xor eax, eax
    pop pop esi
    pop pop edi
    pop pop ebx
    ret ret
FUN_1009a612 ENDP
END
