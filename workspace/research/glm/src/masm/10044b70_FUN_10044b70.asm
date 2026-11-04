.686
.MODEL FLAT, C
EXTRN sub_10042661:PROC
EXTRN sub_10042C0E:PROC
EXTRN sub_10043C02:PROC
EXTRN sub_10044BB1:PROC
EXTRN sub_10044E37:PROC
EXTRN sub_100468DC:PROC
EXTRN sub_10048C3A:PROC
EXTRN sub_10049523:PROC
.CODE
FUN_10044b70 PROC
    push ebx
    push esi
    xor ebx, ebx
    push ebx
    mov esi, eax
    call sub_100468DC
    mov al, byte ptr [esi + 0000000B8h]
    add esp, 4
    cmp al, bl
    jne L0
    call sub_10042C0E
    call sub_10049523
    xor al, al
    call sub_10048C3A
L0:
    push edi
    mov edi, esi
    call sub_10043C02
    cmp byte ptr [esi + 0000000B9h], bl
    pop edi
    je L1
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], 1
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    add esp, 4
    jmp L3
L1:
    cmp byte ptr [esi + 0000000DCh], bl
    je L2
    mov edx, dword ptr [esi + 4]
    push 108
    push 1
    push esi
    call dword ptr [edx]
    mov dword ptr [esi + 000000164h], eax
    mov dword ptr [eax], 0100477E0h
    mov dword ptr [eax + 76], ebx
    mov dword ptr [eax + 92], ebx
    mov dword ptr [eax + 80], ebx
    mov dword ptr [eax + 96], ebx
    mov dword ptr [eax + 84], ebx
    mov dword ptr [eax + 100], ebx
    mov dword ptr [eax + 88], ebx
    mov dword ptr [eax + 104], ebx
    add esp, 12
    mov dword ptr [eax + 64], ebx
    jmp L3
L2:
    call sub_10044BB1
L3:
    cmp dword ptr [esi + 0000000B0h], 1
    jg L4
    cmp byte ptr [esi + 0000000BAh], bl
    jne L4
    xor al, al
    jmp L5
L4:
    xor eax, eax
    mov al, 1
L5:
    push eax
    push esi
    call sub_10042661
    push ebx
    call sub_10044E37
    mov eax, dword ptr [esi + 4]
    push 32
    push 1
    push esi
    call dword ptr [eax]
    mov dword ptr [esi + 000000154h], eax
    mov dword ptr [eax], 010045AC0h
    mov dword ptr [eax + 4], 010045B10h
    mov dword ptr [eax + 8], 010045BF0h
    mov dword ptr [eax + 12], 010045CE0h
    mov dword ptr [eax + 16], 010045D00h
    mov dword ptr [eax + 20], 010045A40h
    mov dword ptr [eax + 24], 010045A80h
    mov dword ptr [eax + 28], ebx
    mov ecx, dword ptr [esi + 4]
    push esi
    call dword ptr [ecx + 0x18]
    mov edx, dword ptr [esi + 000000154h]
    push esi
    call dword ptr [edx]
    add esp, 32
    pop esi
    pop ebx
    ret
FUN_10044b70 ENDP
END
