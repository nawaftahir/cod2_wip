.686
.MODEL FLAT, C
EXTRN sub_10002F52:PROC
EXTRN sub_100F5DE8:PROC
EXTRN sub_100F78F3:PROC
.CODE
FUN_10002ed0 PROC
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 24]
    push push esi
    mov mov esi, 1
    cmp cmp ebp, esi
    mov mov bl, 1
    jle L1
    mov mov eax, dword ptr [esp + 16]
    mov mov ecx, dword ptr [esp + 24]
    mov mov edx, dword ptr [ecx + esi*8]
    push push eax
    push push edx
    call sub_100F78F3
    add add esp, 8
    test test eax, eax
    je L2
    inc inc esi
    cmp cmp esi, ebp
    jl L0
    jmp L3
    mov mov eax, dword ptr [esp + 24]
    mov mov esi, dword ptr [eax + esi*8 + 4]
    test test esi, esi
    jne sub_10002F52
    mov mov esi, dword ptr [esp + 20]
L0:
    xor xor bl, bl
    lea lea ecx, [edi + 8]
    push push ecx
    lea lea eax, [edi + 4]
    push push eax
    push push edi
    push push 010191928h
    push push esi
    mov mov dword ptr [edi], 0
    mov mov dword ptr [eax], 0
    mov mov dword ptr [ecx], 0
    call sub_100F5DE8
    add add esp, 20
    pop pop esi
    pop pop ebp
    mov mov al, bl
    pop pop ebx
    ret ret
FUN_10002ed0 ENDP
END
