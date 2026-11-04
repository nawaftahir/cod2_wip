.686
.MODEL FLAT, C
EXTRN g_1019BC84:DWORD
.CODE
FUN_1007e3d1 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    cmp dword ptr [ebp + 24], 0
    jbe L3
    mov ecx, dword ptr [ebp + 20]
    mov edx, dword ptr [ebp + 16]
    push esi
    mov esi, dword ptr [ebp + 24]
    sub edx, ecx
L0:
    fld dword ptr [g_1019BC84]
    fld dword ptr [edx + ecx]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L1
    xor eax, eax
    inc eax
    jmp L2
L1:
    xor eax, eax
L2:
    mov dword ptr [ecx], eax
    add ecx, 4
    dec esi
    jne L0
    pop esi
L3:
    push dword ptr [ebp + 24]
    mov eax, dword ptr [ebp + 8]
    push dword ptr [ebp + 16]
    mov ecx, dword ptr [eax]
    push dword ptr [ebp + 12]
    push eax
    call dword ptr [ecx + 0x188]
    pop ebp
    ret 20
FUN_1007e3d1 ENDP
END
