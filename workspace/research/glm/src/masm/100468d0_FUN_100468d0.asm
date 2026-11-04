.686
.MODEL FLAT, C
EXTRN sub_10045E68:PROC
EXTRN sub_10046045:PROC
.CODE
FUN_100468d0 PROC
    push ebx
    push esi
    push edi
    push 32
    mov esi, eax
    mov eax, dword ptr [esi + 4]
    push 1
    push esi
    call dword ptr [eax]
    mov edi, eax
    mov dword ptr [esi + 000000144h], edi
    xor ebx, ebx
    add esp, 12
    mov dword ptr [edi], 010046690h
    mov dword ptr [edi + 4], 010046820h
    mov dword ptr [edi + 8], 010046850h
    mov byte ptr [edi + 13], bl
    call sub_10045E68
    cmp dword ptr [esi + 0000000B4h], ebx
    je L0
    call sub_10046045
    jmp L1
L0:
    mov byte ptr [esi + 0000000DCh], bl
    mov dword ptr [esi + 0000000B0h], 1
L1:
    cmp byte ptr [esi + 0000000DCh], bl
    je L2
    mov byte ptr [esi + 0000000BAh], 1
L2:
    cmp byte ptr [esp + 16], bl
    je L3
    mov dl, byte ptr [esi + 0000000BAh]
    xor ecx, ecx
    cmp dl, bl
    sete cl
    inc ecx
    mov dword ptr [edi + 16], ecx
    jmp L4
L3:
    mov dword ptr [edi + 16], ebx
L4:
    mov dword ptr [edi + 28], ebx
    mov dword ptr [edi + 20], ebx
    cmp byte ptr [esi + 0000000BAh], bl
    je L5
    mov edx, dword ptr [esi + 0000000B0h]
    shl edx, 1
    mov dword ptr [edi + 24], edx
    pop edi
    pop esi
    pop ebx
    ret
L5:
    mov eax, dword ptr [esi + 0000000B0h]
    mov dword ptr [edi + 24], eax
    pop edi
    pop esi
    pop ebx
    ret
FUN_100468d0 ENDP
END
