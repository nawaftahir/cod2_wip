.686
.MODEL FLAT, C
EXTRN sub_100029BD:PROC
EXTRN sub_100029C8:PROC
EXTRN sub_100029E9:PROC
EXTRN sub_1001391E:PROC
EXTRN sub_100F78F2:PROC
EXTRN EXTRN g_101AE2A8:DWORD:DWORD
EXTRN EXTRN g_101AE2AC:DWORD:DWORD
.CODE
FUN_10002940 PROC
    push push ebp
    xor xor ebp, ebp
    cmp cmp word ptr [ebx + 52], bp
    jbe sub_100029BD
    push push edi
    xor xor edi, edi
    push push esi
    lea lea ecx, [ecx]
    mov mov esi, dword ptr [ebx + 60]
    mov mov eax, dword ptr [esi + edi]
    add add esi, edi
    push push 0101919FCh
    push push eax
    call sub_100F78F2
    add add esp, 8
    test test eax, eax
    je L1
    movzx movzx ecx, word ptr [ebx + 52]
    inc inc ebp
    add add edi, 12
    cmp cmp ebp, ecx
    jl L0
    pop pop esi
    pop pop edi
    pop pop ebp
    ret ret
    cmp cmp byte ptr [esi + 5], 5
    je sub_100029C8
    mov mov edx, dword ptr [esi + 8]
    cmp cmp dword ptr [edx], 5
L0:
    je sub_100029E9
    mov mov eax, dword ptr [ebx]
    mov mov ecx, dword ptr [esi + 8]
    mov mov edx, dword ptr [ecx + 32]
    push push eax
    push push edx
    push push 0101919C4h
    push push 1
    call sub_1001391E
    add add esp, 16
    mov mov eax, dword ptr [esi + 8]
L1:
    mov mov dword ptr [g_101AE2A8], eax
    mov mov cl, byte ptr [esi + 4]
    pop pop esi
    mov mov byte ptr [g_101AE2AC], cl
    pop pop edi
    pop pop ebp
    ret ret
FUN_10002940 ENDP
END
