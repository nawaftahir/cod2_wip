.686
.MODEL FLAT, C
EXTRN sub_10044B97:PROC
EXTRN sub_100468E2:PROC
EXTRN sub_10049DE3:PROC
.CODE
FUN_10049930 PROC
    push ebx
    push esi
    mov esi, eax
    push 1
    mov dword ptr [esi + 44], 1
    call sub_100468E2
    mov al, byte ptr [esi + 0000000B9h]
    xor ebx, ebx
    add esp, 4
    cmp al, bl
    je L0
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], 1
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    add esp, 4
    jmp L2
L0:
    cmp byte ptr [esi + 0000000DCh], bl
    je L1
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
    jmp L2
L1:
    call sub_10044B97
L2:
    mov eax, dword ptr [esp + 12]
    push eax
    mov eax, esi
    call sub_10049DE3
    mov ecx, dword ptr [esi + 4]
    push 32
    push 1
    push esi
    call dword ptr [ecx]
    mov dword ptr [esi + 000000154h], eax
    mov dword ptr [eax], 010045AC0h
    mov dword ptr [eax + 4], 010045B10h
    mov dword ptr [eax + 8], 010045BF0h
    mov dword ptr [eax + 12], 010045CE0h
    mov dword ptr [eax + 16], 010045D00h
    mov dword ptr [eax + 20], 010045A40h
    mov dword ptr [eax + 24], 010045A80h
    mov dword ptr [eax + 28], ebx
    mov edx, dword ptr [esi + 4]
    push esi
    call dword ptr [edx + 0x18]
    mov eax, dword ptr [esi + 000000154h]
    push esi
    call dword ptr [eax]
    add esp, 24
    pop esi
    pop ebx
    ret
FUN_10049930 ENDP
END
