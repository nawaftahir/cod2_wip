.686
.MODEL FLAT, C
EXTRN sub_100F5DE8:PROC
EXTRN sub_100F78F3:PROC
.CODE
FUN_10002ed0 PROC
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 24]
    push esi
    mov esi, 1
    cmp ebp, esi
    mov bl, 1
    jle L2
L0:
    mov eax, dword ptr [esp + 16]
    mov ecx, dword ptr [esp + 24]
    mov edx, dword ptr [ecx + esi*8]
    push eax
    push edx
    call sub_100F78F3
    add esp, 8
    test eax, eax
    je L1
    inc esi
    cmp esi, ebp
    jl L0
    jmp L2
L1:
    mov eax, dword ptr [esp + 24]
    mov esi, dword ptr [eax + esi*8 + 4]
    test esi, esi
    jne L3
L2:
    mov esi, dword ptr [esp + 20]
    xor bl, bl
L3:
    lea ecx, [edi + 8]
    push ecx
    lea eax, [edi + 4]
    push eax
    push edi
    push 010191928h
    push esi
    mov dword ptr [edi], 0
    mov dword ptr [eax], 0
    mov dword ptr [ecx], 0
    call sub_100F5DE8
    add esp, 20
    pop esi
    pop ebp
    mov al, bl
    pop ebx
    ret
FUN_10002ed0 ENDP
END
