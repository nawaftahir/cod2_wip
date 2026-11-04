.686
.MODEL FLAT, C
EXTRN sub_1000F3FB:PROC
EXTRN sub_1000F40E:PROC
EXTRN sub_1000F421:PROC
EXTRN sub_1000F434:PROC
EXTRN sub_1000F447:PROC
EXTRN sub_1000F5C8:PROC
EXTRN sub_1000F5D8:PROC
EXTRN sub_1000F5E8:PROC
EXTRN sub_1000F5F8:PROC
EXTRN sub_1000F608:PROC
EXTRN sub_1000F88A:PROC
EXTRN sub_1000F89D:PROC
EXTRN sub_1000F8B0:PROC
.CODE
FUN_1000f900 PROC
    push esi
    mov dword ptr [eax + 4], 0
    movzx esi, byte ptr [ecx + 4]
    dec esi
    cmp esi, 12
    ja L0
    jmp dword ptr [esi*4 + 0x1000fa08]
    push 4
    push 21
    push edx
    push ecx
    call sub_1000F5C8
    add esp, 16
    pop esi
    ret
    push 3
    push 22
    push edx
    push ecx
    call sub_1000F5D8
    add esp, 16
    pop esi
    ret
    push 2
    push 51
    push edx
    push ecx
    call sub_1000F5E8
    add esp, 16
    pop esi
    ret
    push 1
    push 50
    push edx
    push ecx
    call sub_1000F5F8
    add esp, 16
    pop esi
    ret
    push 1
    push 28
    push edx
    push ecx
    call sub_1000F608
    add esp, 16
    pop esi
    ret
    push 21
    push edx
    push eax
    mov eax, 4
    call sub_1000F3FB
    add esp, 12
    pop esi
    ret
    push 22
    push edx
    push eax
    mov eax, 3
    call sub_1000F40E
    add esp, 12
    pop esi
    ret
    push 51
    push edx
    push eax
    mov eax, 2
    call sub_1000F421
    add esp, 12
    pop esi
    ret
    push 50
    push edx
    push eax
    mov eax, 1
    call sub_1000F434
    add esp, 12
    pop esi
    ret
    push 28
    push edx
    push eax
    mov eax, 1
    call sub_1000F447
    add esp, 12
    pop esi
    ret
    push 8
    push 031545844h
    push edx
    push ecx
    call sub_1000F88A
    add esp, 16
    pop esi
    ret
    push 16
    push 033545844h
    push edx
    push ecx
    call sub_1000F89D
    add esp, 16
    pop esi
    ret
    push 16
    push 035545844h
    push edx
    push ecx
    call sub_1000F8B0
    add esp, 16
L0:
    pop esi
    ret
FUN_1000f900 ENDP
END
