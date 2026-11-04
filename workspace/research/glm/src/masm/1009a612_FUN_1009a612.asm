.686
.MODEL FLAT, C
EXTRN sub_10065087:PROC
EXTRN sub_100650AA:PROC
EXTRN sub_100650D1:PROC
EXTRN sub_100828E7:PROC
EXTRN sub_1008317D:PROC
EXTRN sub_100832A6:PROC
.CODE
FUN_1009a612 PROC
    mov edi, edi
    push ebx
    push edi
    mov ebx, ecx
    xor edi, edi
    cmp dword ptr [ebx + 24], edi
    jne L0
    xor eax, eax
    jmp L9
L0:
    push esi
    push 36
    call sub_10065087
    cmp eax, edi
    je L1
    mov ecx, eax
    call sub_1008317D
    mov esi, eax
    jmp L2
L1:
    xor esi, esi
L2:
    cmp esi, edi
    je L7
    push 80
    mov dword ptr [esi + 16], 6
    call sub_100650AA
    cmp eax, edi
    je L3
    add ebx, 32
    push ebx
    push 1
    push edi
    push edi
    push edi
    push edi
    mov ecx, eax
    call sub_100832A6
    jmp L4
L3:
    xor eax, eax
L4:
    cmp eax, edi
    je L7
    push 20
    mov dword ptr [esi + 24], eax
    call sub_100650D1
    cmp eax, edi
    je L5
    push 010114734h
    push edi
    push esi
    mov ecx, eax
    call sub_100828E7
    jmp L6
L5:
    xor eax, eax
L6:
    cmp eax, edi
    jne L8
L7:
    xor eax, eax
L8:
    pop esi
L9:
    pop edi
    pop ebx
    ret
FUN_1009a612 ENDP
END
