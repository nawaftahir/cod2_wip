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
EXTRN sub_1000FA19:PROC
.CODE
FUN_1000f900 PROC
    push push esi
    mov mov dword ptr [eax + 4], 0
    movzx movzx esi, byte ptr [ecx + 4]
    dec dec esi
    cmp cmp esi, 12
    ja sub_1000FA19
    jmp jmp dword ptr [esi*4 + 01000FA08h]
    push push 4
    push push 21
    push push edx
    push push ecx
    call sub_1000F5C8
    add add esp, 16
    pop pop esi
    ret ret
    push push 3
    push push 22
    push push edx
    push push ecx
    call sub_1000F5D8
    add add esp, 16
    pop pop esi
    ret ret
    push push 2
    push push 51
    push push edx
    push push ecx
    call sub_1000F5E8
    add add esp, 16
    pop pop esi
    ret ret
    push push 1
    push push 50
    push push edx
    push push ecx
    call sub_1000F5F8
    add add esp, 16
    pop pop esi
    ret ret
    push push 1
    push push 28
    push push edx
    push push ecx
    call sub_1000F608
    add add esp, 16
    pop pop esi
    ret ret
    push push 21
    push push edx
    push push eax
    mov mov eax, 4
    call sub_1000F3FB
    add add esp, 12
    pop pop esi
    ret ret
    push push 22
    push push edx
    push push eax
    mov mov eax, 3
    call sub_1000F40E
    add add esp, 12
    pop pop esi
    ret ret
    push push 51
    push push edx
    push push eax
    mov mov eax, 2
    call sub_1000F421
    add add esp, 12
    pop pop esi
    ret ret
    push push 50
    push push edx
    push push eax
    mov mov eax, 1
    call sub_1000F434
    add add esp, 12
    pop pop esi
    ret ret
    push push 28
    push push edx
    push push eax
    mov mov eax, 1
    call sub_1000F447
    add add esp, 12
    pop pop esi
    ret ret
    push push 8
    push push 031545844h
    push push edx
    push push ecx
    call sub_1000F88A
    add add esp, 16
    pop pop esi
    ret ret
    push push 16
    push push 033545844h
    push push edx
    push push ecx
    call sub_1000F89D
    add add esp, 16
    pop pop esi
    ret ret
    push push 16
    push push 035545844h
    push push edx
    push push ecx
    call sub_1000F8B0
    add add esp, 16
    pop pop esi
    ret ret
FUN_1000f900 ENDP
END
