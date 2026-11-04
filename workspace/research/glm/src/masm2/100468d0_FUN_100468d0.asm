.686
.MODEL FLAT, C
EXTRN sub_10045E68:PROC
EXTRN sub_10046045:PROC
EXTRN sub_10046995:PROC
EXTRN sub_100469BB:PROC
EXTRN sub_100469D1:PROC
EXTRN sub_100469FF:PROC
.CODE
FUN_100468d0 PROC
    push push ebx
    push push esi
    push push edi
    push push 32
    mov mov esi, eax
    mov mov eax, dword ptr [esi + 4]
    push push 1
    push push esi
    call call dword ptr [eax]
    mov mov edi, eax
    mov mov dword ptr [esi + 0144h], edi
    xor xor ebx, ebx
    add add esp, 12
    mov mov dword ptr [edi], 010046690h
    mov mov dword ptr [edi + 4], 010046820h
    mov mov dword ptr [edi + 8], 010046850h
    mov mov byte ptr [edi + 13], bl
    call sub_10045E68
    cmp cmp dword ptr [esi + 0B4h], ebx
    je L0
    call sub_10046045
    jmp L1
    mov mov byte ptr [esi + 0DCh], bl
    mov mov dword ptr [esi + 0B0h], 1
    cmp cmp byte ptr [esi + 0DCh], bl
    je sub_10046995
    mov mov byte ptr [esi + 0BAh], 1
    cmp cmp byte ptr [esp + 16], bl
    je sub_100469BB
    mov mov dl, byte ptr [esi + 0BAh]
    xor xor ecx, ecx
    cmp cmp dl, bl
    sete sete cl
    inc inc ecx
    mov mov dword ptr [edi + 16], ecx
    jmp sub_100469D1
    mov mov dword ptr [edi + 16], ebx
    mov mov dword ptr [edi + 28], ebx
    mov mov dword ptr [edi + 20], ebx
    cmp cmp byte ptr [esi + 0BAh], bl
    je sub_100469FF
    mov mov edx, dword ptr [esi + 0B0h]
    shl shl edx, 1
    mov mov dword ptr [edi + 24], edx
    pop pop edi
    pop pop esi
    pop pop ebx
L1:
    ret ret
    mov mov eax, dword ptr [esi + 0B0h]
    mov mov dword ptr [edi + 24], eax
    pop pop edi
    pop pop esi
    pop pop ebx
    ret ret
FUN_100468d0 ENDP
END
