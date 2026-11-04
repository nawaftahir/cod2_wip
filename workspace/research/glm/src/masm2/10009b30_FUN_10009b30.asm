.686
.MODEL FLAT, C
EXTRN sub_10009957:PROC
EXTRN sub_10009A91:PROC
EXTRN sub_10009B8A:PROC
EXTRN sub_10009BAD:PROC
EXTRN sub_10009BB5:PROC
EXTRN sub_10009BC0:PROC
.CODE
FUN_10009b30 PROC
    sub sub esp, 0C04h
    push push esi
    lea lea eax, [esp + 4]
    push push eax
    mov mov eax, dword ptr [esp + 0C10h]
    push push ecx
    push push edx
    push push eax
    lea lea esi, [esp + 24]
    mov mov eax, edi
    call sub_10009A91
    add add esp, 16
    test test eax, eax
    jne sub_10009B8A
    xor xor al, al
    pop pop esi
    add add esp, 0C04h
    ret ret
    jle sub_10009BB5
    mov mov esi, dword ptr [esp + 4]
    push push ebx
    mov mov ebx, eax
    jmp sub_10009BAD
    lea lea ecx, [ecx]
    push push esi
    push push edi
    call sub_10009957
    add add esp, 8
    add add esi, 12
    dec dec ebx
    jne sub_10009BC0
    pop pop ebx
    mov mov al, 1
    pop pop esi
FUN_10009b30 ENDP
END
