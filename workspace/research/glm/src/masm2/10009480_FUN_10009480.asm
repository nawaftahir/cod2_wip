.686
.MODEL FLAT, C
EXTRN sub_10005721:PROC
EXTRN sub_10009581:PROC
EXTRN sub_10009598:PROC
EXTRN sub_100095CC:PROC
EXTRN sub_10009618:PROC
EXTRN sub_1001F7C2:PROC
EXTRN sub_10023C3A:PROC
EXTRN sub_10024762:PROC
EXTRN sub_10058D72:PROC
EXTRN EXTRN fp_101D4B5C:DWORD:DWORD
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_101CE738:DWORD:DWORD
EXTRN EXTRN g_101D1B9C:DWORD:DWORD
EXTRN EXTRN g_101D7E88:DWORD:DWORD
EXTRN EXTRN g_101D7E8C:DWORD:DWORD
EXTRN EXTRN g_101D7E94:DWORD:DWORD
EXTRN EXTRN g_101DA9C8:DWORD:DWORD
EXTRN EXTRN g_10678500:DWORD:DWORD
EXTRN EXTRN g_10678510:DWORD:DWORD
.CODE
FUN_10009480 PROC
    mov mov eax, dword ptr [g_101D7E94]
    mov mov ecx, dword ptr [g_10678500]
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 12]
    cmp cmp dword ptr [eax + ebp*8], ecx
    push push esi
    push push edi
    je sub_10009581
    fld fld dword ptr [g_1019BC84]
    mov mov dword ptr [eax + ebp*8], ecx
    mov mov eax, dword ptr [g_101D1B9C]
    mov mov ecx, dword ptr [eax + 0F8h]
    lea lea esi, [ebp + ebp*2]
    shl shl esi, 5
    fld fld dword ptr [esi + ecx]
    add add esi, ecx
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp L0
    lea lea ecx, [esi + 4]
    mov mov eax, 0101D7E7Ch
    call sub_10058D72
    fmul fmul dword ptr [g_101D7E88]
    fadd fadd dword ptr [g_101D7E8C]
    fcomp fcomp dword ptr [esi]
    fnstsw fnstsw ax
    test test ah, 65
    je sub_100095CC
    mov mov ecx, dword ptr [g_101CE738]
    mov mov al, byte ptr [ecx + 8]
    test test al, al
    je sub_10009598
    mov mov eax, dword ptr [esi + 16]
    push push eax
    call dword ptr [fp_101D4B5C]
    mov mov edi, dword ptr [g_101DA9C8]
    add add esp, 4
    push push eax
    push push 03E99999Ah
    add add esi, 4
    push push esi
    add add edi, 0249D18h
    mov mov ebx, 010191488h
    call sub_10005721
    add add esp, 12
    push push ebp
    call sub_10023C3A
    mov mov edi, eax
L0:
    add add esp, 4
    test test edi, edi
    jl sub_10009618
    mov mov eax, dword ptr [g_10678510]
    mov mov edx, edi
    imul imul edx, edx, 116
    mov mov esi, edi
    imul imul esi, esi, 52
    push push ebp
    add add edx, eax
    push push edx
    add add esi, 010678AC4h
    push push esi
    call sub_1001F7C2
    add add esp, 12
    push push edi
    mov mov dword ptr [esi + 12], 5
    call sub_10024762
    add add esp, 4
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    ret ret
FUN_10009480 ENDP
END
