.686
.MODEL FLAT, C
EXTRN sub_10061CF4:PROC
EXTRN fp_101D4B3C:DWORD
EXTRN fp_101D4B48:DWORD
EXTRN fp_101D4B5C:DWORD
.CODE
FUN_1002a940 PROC
    sub esp, 8
    push ebx
    push ebp
    push esi
    push edi
    call dword ptr [fp_101D4B48]
    mov ebx, eax
    add esp, 4
    xor esi, esi
    test ebx, ebx
    jle L3
L0:
    lea eax, [esp + 16]
    push eax
    push esi
    lea ecx, [esp + 20]
    push ecx
    push edi
    call dword ptr [fp_101D4B3C]
    add esp, 16
    xor ecx, ecx
    test eax, eax
    jle L2
    mov edx, dword ptr [esp + 12]
    jmp L1
    lea esp, [esp]
L1:
    mov ebp, dword ptr [edx + ecx*4]
    cmp word ptr [ebp + 6], -1
    je L4
    inc ecx
    cmp ecx, eax
    jl L1
L2:
    inc esi
    cmp esi, ebx
    jl L0
L3:
    pop esi
    pop ebp
    mov al, 1
    pop ebx
    add esp, 8
    ret
L4:
    push ecx
    push esi
    push edi
    call dword ptr [fp_101D4B5C]
    add esp, 4
    push eax
    push 010197378h
    call sub_10061CF4
    add esp, 16
    pop esi
    pop ebp
FUN_1002a940 ENDP
END
