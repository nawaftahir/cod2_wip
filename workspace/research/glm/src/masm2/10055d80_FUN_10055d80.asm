.686
.MODEL FLAT, C
EXTRN sub_10055DF4:PROC
EXTRN sub_10055DFD:PROC
EXTRN sub_10055E20:PROC
.CODE
FUN_10055d80 PROC
    push push ebx
    push push ebp
    push push esi
    push push edi
    push push 0400h
    mov mov esi, ecx
    mov mov ecx, dword ptr [eax + 4]
    push push 1
    push push eax
    call call dword ptr [ecx]
    shl shl esi, 9
    add add esp, 12
    sub sub esi, 0200h
    mov mov ebp, eax
    mov mov ebx, esi
    mov mov edi, 0101910F0h
    mov mov esi, ebp
    lea lea ebx, [ebx]
    xor xor ecx, ecx
    jmp sub_10055DF4
    lea lea esp, [esp]
    jmp sub_10055DFD
    lea lea ecx, [ecx]
    movzx movzx edx, byte ptr [edi + ecx]
    imul imul edx, edx, 01FEh
    mov mov eax, 0FE01h
    sub sub eax, edx
    cdq cdq
    idiv idiv ebx
    inc inc ecx
    add add esi, 4
    cmp cmp ecx, 16
    mov mov dword ptr [esi - 4], eax
    jl sub_10055E20
    add add edi, 16
FUN_10055d80 ENDP
END
