.686
.MODEL FLAT, C
EXTRN sub_10044B97:PROC
EXTRN sub_100468E2:PROC
EXTRN sub_10049A19:PROC
EXTRN sub_10049DE3:PROC
.CODE
FUN_10049930 PROC
    push push ebx
    push push esi
    mov mov esi, eax
    push push 1
    mov mov dword ptr [esi + 44], 1
    call sub_100468E2
    mov mov al, byte ptr [esi + 0B9h]
    xor xor ebx, ebx
    add add esp, 4
    cmp cmp al, bl
    je L0
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [eax + 20], 1
    mov mov ecx, dword ptr [esi]
    push push esi
    call call dword ptr [ecx]
    add add esp, 4
    jmp L1
    cmp cmp byte ptr [esi + 0DCh], bl
    je L2
    mov mov edx, dword ptr [esi + 4]
    push push 108
    push push 1
    push push esi
    call call dword ptr [edx]
    mov mov dword ptr [esi + 0164h], eax
    mov mov dword ptr [eax], 0100477E0h
    mov mov dword ptr [eax + 76], ebx
L0:
    mov mov dword ptr [eax + 92], ebx
    mov mov dword ptr [eax + 80], ebx
    mov mov dword ptr [eax + 96], ebx
    mov mov dword ptr [eax + 84], ebx
    mov mov dword ptr [eax + 100], ebx
    mov mov dword ptr [eax + 88], ebx
    mov mov dword ptr [eax + 104], ebx
    add add esp, 12
    mov mov dword ptr [eax + 64], ebx
    jmp sub_10049A19
    call sub_10044B97
    mov mov eax, dword ptr [esp + 12]
    push push eax
    mov mov eax, esi
    call sub_10049DE3
    mov mov ecx, dword ptr [esi + 4]
    push push 32
    push push 1
    push push esi
    call call dword ptr [ecx]
    mov mov dword ptr [esi + 0154h], eax
    mov mov dword ptr [eax], 010045AC0h
    mov mov dword ptr [eax + 4], 010045B10h
    mov mov dword ptr [eax + 8], 010045BF0h
    mov mov dword ptr [eax + 12], 010045CE0h
L2:
    mov mov dword ptr [eax + 16], 010045D00h
    mov mov dword ptr [eax + 20], 010045A40h
    mov mov dword ptr [eax + 24], 010045A80h
    mov mov dword ptr [eax + 28], ebx
    mov mov edx, dword ptr [esi + 4]
    push push esi
    call call dword ptr [edx + 24]
    mov mov eax, dword ptr [esi + 0154h]
    push push esi
    call call dword ptr [eax]
    add add esp, 24
    pop pop esi
    pop pop ebx
    ret ret
FUN_10049930 ENDP
END
