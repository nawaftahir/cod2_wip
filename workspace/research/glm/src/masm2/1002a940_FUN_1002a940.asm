.686
.MODEL FLAT, C
EXTRN sub_1002A9B9:PROC
EXTRN sub_1002A9C2:PROC
EXTRN sub_1002A9CF:PROC
EXTRN sub_1002A9E7:PROC
EXTRN sub_10061CF4:PROC
EXTRN EXTRN fp_101D4B3C:DWORD:DWORD
EXTRN EXTRN fp_101D4B48:DWORD:DWORD
EXTRN EXTRN fp_101D4B5C:DWORD:DWORD
.CODE
FUN_1002a940 PROC
    sub sub esp, 8
    push push ebx
    push push ebp
    push push esi
    push push edi
    call dword ptr [fp_101D4B48]
    mov mov ebx, eax
    add add esp, 4
    xor xor esi, esi
    test test ebx, ebx
    jle L0
    lea lea eax, [esp + 16]
    push push eax
    push push esi
    lea lea ecx, [esp + 20]
    push push ecx
    push push edi
    call dword ptr [fp_101D4B3C]
    add add esp, 16
    xor xor ecx, ecx
    test test eax, eax
    jle sub_1002A9C2
    mov mov edx, dword ptr [esp + 12]
    jmp sub_1002A9B9
    lea lea esp, [esp]
    mov mov ebp, dword ptr [edx + ecx*4]
    cmp cmp word ptr [ebp + 6], -1
    je sub_1002A9E7
    inc inc ecx
    cmp cmp ecx, eax
    jl sub_1002A9CF
    inc inc esi
    cmp cmp esi, ebx
    jl L0
    pop pop esi
    pop pop ebp
    mov mov al, 1
    pop pop ebx
    add add esp, 8
    ret ret
    push push ecx
    push push esi
    push push edi
    call dword ptr [fp_101D4B5C]
    add add esp, 4
    push push eax
    push push 010197378h
    call sub_10061CF4
    add add esp, 16
    pop pop esi
    pop pop ebp
FUN_1002a940 ENDP
END
