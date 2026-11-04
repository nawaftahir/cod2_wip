.686
.MODEL FLAT, C
EXTRN sub_10005721:PROC
EXTRN sub_1001F7C2:PROC
EXTRN sub_10023C3A:PROC
EXTRN sub_10024762:PROC
EXTRN sub_10058D72:PROC
EXTRN fp_101D4B5C:DWORD
EXTRN g_1019BC84:DWORD
EXTRN g_101CE738:DWORD
EXTRN g_101D1B9C:DWORD
EXTRN g_101D7E88:DWORD
EXTRN g_101D7E8C:DWORD
EXTRN g_101D7E94:DWORD
EXTRN g_101DA9C8:DWORD
EXTRN g_10678500:DWORD
EXTRN g_10678510:DWORD
.CODE
FUN_10009480 PROC
    mov eax, dword ptr [g_101D7E94]
    mov ecx, dword ptr [g_10678500]
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 12]
    cmp dword ptr [eax + ebp*8], ecx
    push esi
    push edi
    je L2
    fld dword ptr [g_1019BC84]
    mov dword ptr [eax + ebp*8], ecx
    mov eax, dword ptr [g_101D1B9C]
    mov ecx, dword ptr [eax + 0000000F8h]
    lea esi, [ebp + ebp*2]
    shl esi, 5
    fld dword ptr [esi + ecx]
    add esi, ecx
    fucompp
    fnstsw ax
    test ah, 68
    jnp L0
    lea ecx, [esi + 4]
    mov eax, 0101D7E7Ch
    call sub_10058D72
    fmul dword ptr [g_101D7E88]
    fadd dword ptr [g_101D7E8C]
    fcomp dword ptr [esi]
    fnstsw ax
    test ah, 65
    je L2
L0:
    mov ecx, dword ptr [g_101CE738]
    mov al, byte ptr [ecx + 8]
    test al, al
    je L1
    mov eax, dword ptr [esi + 16]
    push eax
    call dword ptr [fp_101D4B5C]
    mov edi, dword ptr [g_101DA9C8]
    add esp, 4
    push eax
    push 03E99999Ah
    add esi, 4
    push esi
    add edi, 000249D18h
    mov ebx, 010191488h
    call sub_10005721
    add esp, 12
L1:
    push ebp
    call sub_10023C3A
    mov edi, eax
    add esp, 4
    test edi, edi
    jl L2
    mov eax, dword ptr [g_10678510]
    mov edx, edi
    imul edx, edx, 116
    mov esi, edi
    imul esi, esi, 52
    push ebp
    add edx, eax
    push edx
    add esi, 010678AC4h
    push esi
    call sub_1001F7C2
    add esp, 12
    push edi
    mov dword ptr [esi + 12], 5
    call sub_10024762
    add esp, 4
L2:
    pop edi
    pop esi
    pop ebp
    pop ebx
    ret
FUN_10009480 ENDP
END
