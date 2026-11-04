.686
.MODEL FLAT, C
EXTRN sub_10009957:PROC
EXTRN sub_10009A91:PROC
.CODE
FUN_10009b30 PROC
    sub esp, 000000C04h
    push esi
    lea eax, [esp + 4]
    push eax
    mov eax, dword ptr [esp + 000000C10h]
    push ecx
    push edx
    push eax
    lea esi, [esp + 24]
    mov eax, edi
    call sub_10009A91
    add esp, 16
    test eax, eax
    jne L0
    xor al, al
    pop esi
    add esp, 000000C04h
    ret
L0:
    jle L2
    mov esi, dword ptr [esp + 4]
    push ebx
    mov ebx, eax
    jmp L1
    lea ecx, [ecx]
L1:
    push esi
    push edi
    call sub_10009957
    add esp, 8
    add esi, 12
    dec ebx
    jne L1
    pop ebx
L2:
    mov al, 1
    pop esi
FUN_10009b30 ENDP
END
