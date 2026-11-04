.686
.MODEL FLAT, C
EXTRN sub_1007E428:PROC
EXTRN sub_1007E42F:PROC
EXTRN EXTRN g_1019BC84:DWORD:DWORD
.CODE
FUN_1007e3d1 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    cmp cmp dword ptr [ebp + 24], 0
    jbe L0
    mov mov ecx, dword ptr [ebp + 20]
    mov mov edx, dword ptr [ebp + 16]
    push push esi
    mov mov esi, dword ptr [ebp + 24]
    sub sub edx, ecx
    fld fld dword ptr [g_1019BC84]
    fld fld dword ptr [edx + ecx]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp sub_1007E428
    xor xor eax, eax
    inc inc eax
    jmp sub_1007E42F
    xor xor eax, eax
    mov mov dword ptr [ecx], eax
    add add ecx, 4
    dec dec esi
    jne L1
    pop pop esi
    push push dword ptr [ebp + 24]
    mov mov eax, dword ptr [ebp + 8]
    push push dword ptr [ebp + 16]
    mov mov ecx, dword ptr [eax]
L0:
    push push dword ptr [ebp + 12]
    push push eax
    call call dword ptr [ecx + 0188h]
    pop pop ebp
L1:
    ret ret 20
FUN_1007e3d1 ENDP
END
