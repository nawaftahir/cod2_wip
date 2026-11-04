.686
.MODEL FLAT, C
EXTRN sub_10042661:PROC
EXTRN sub_10042C0E:PROC
EXTRN sub_10043C02:PROC
EXTRN sub_10044C8D:PROC
EXTRN sub_10044CB0:PROC
EXTRN sub_10044CB8:PROC
EXTRN sub_10044CC0:PROC
EXTRN sub_10044E37:PROC
EXTRN sub_100468DC:PROC
EXTRN sub_10048C3A:PROC
EXTRN sub_10049523:PROC
.CODE
FUN_10044b70 PROC
    push push ebx
    push push esi
    xor xor ebx, ebx
    push push ebx
    mov mov esi, eax
    call sub_100468DC
    mov mov al, byte ptr [esi + 0B8h]
    add add esp, 4
    cmp cmp al, bl
    jne L1
    call sub_10042C0E
    call sub_10049523
    xor xor al, al
    call sub_10048C3A
    push push edi
    mov mov edi, esi
    call sub_10043C02
    cmp cmp byte ptr [esi + 0B9h], bl
    pop pop edi
    je L2
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [eax + 20], 1
    mov mov ecx, dword ptr [esi]
    push push esi
    call call dword ptr [ecx]
    add add esp, 4
    jmp L3
    cmp cmp byte ptr [esi + 0DCh], bl
    je L4
    mov mov edx, dword ptr [esi + 4]
    push push 108
    push push 1
    push push esi
    call call dword ptr [edx]
    mov mov dword ptr [esi + 0164h], eax
    mov mov dword ptr [eax], 0100477E0h
    mov mov dword ptr [eax + 76], ebx
    mov mov dword ptr [eax + 92], ebx
    mov mov dword ptr [eax + 80], ebx
    mov mov dword ptr [eax + 96], ebx
    mov mov dword ptr [eax + 84], ebx
    mov mov dword ptr [eax + 100], ebx
    mov mov dword ptr [eax + 88], ebx
    mov mov dword ptr [eax + 104], ebx
    add add esp, 12
    mov mov dword ptr [eax + 64], ebx
    jmp sub_10044C8D
    call L0
    cmp cmp dword ptr [esi + 0B0h], 1
    jg sub_10044CB0
    cmp cmp byte ptr [esi + 0BAh], bl
    jne sub_10044CB8
    xor xor al, al
    jmp sub_10044CC0
    xor xor eax, eax
    mov mov al, 1
    push push eax
    push push esi
    call sub_10042661
    push push ebx
    call sub_10044E37
    mov mov eax, dword ptr [esi + 4]
    push push 32
    push push 1
    push push esi
    call call dword ptr [eax]
    mov mov dword ptr [esi + 0154h], eax
    mov mov dword ptr [eax], 010045AC0h
    mov mov dword ptr [eax + 4], 010045B10h
    mov mov dword ptr [eax + 8], 010045BF0h
    mov mov dword ptr [eax + 12], 010045CE0h
L4:
    mov mov dword ptr [eax + 16], 010045D00h
    mov mov dword ptr [eax + 20], 010045A40h
    mov mov dword ptr [eax + 24], 010045A80h
    mov mov dword ptr [eax + 28], ebx
    mov mov ecx, dword ptr [esi + 4]
    push push esi
    call call dword ptr [ecx + 24]
    mov mov edx, dword ptr [esi + 0154h]
    push push esi
    call call dword ptr [edx]
    add add esp, 32
    pop pop esi
    pop pop ebx
    ret ret
FUN_10044b70 ENDP
END
