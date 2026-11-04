.686
.MODEL FLAT, C
EXTRN sub_1001391E:PROC
EXTRN sub_100F78F2:PROC
EXTRN g_101AE2A8:DWORD
EXTRN g_101AE2AC:DWORD
.CODE
FUN_10002940 PROC
    push ebp
    xor ebp, ebp
    cmp word ptr [ebx + 52], bp
    jbe L4
    push edi
    xor edi, edi
    push esi
    lea ecx, [ecx]
L0:
    mov esi, dword ptr [ebx + 60]
    mov eax, dword ptr [esi + edi]
    add esi, edi
    push 0101919FCh
    push eax
    call sub_100F78F2
    add esp, 8
    test eax, eax
    je L1
    movzx ecx, word ptr [ebx + 52]
    inc ebp
    add edi, 12
    cmp ebp, ecx
    jl L0
    pop esi
    pop edi
    pop ebp
    ret
L1:
    cmp byte ptr [esi + 5], 5
    je L2
    mov edx, dword ptr [esi + 8]
    cmp dword ptr [edx], 5
    je L3
L2:
    mov eax, dword ptr [ebx]
    mov ecx, dword ptr [esi + 8]
    mov edx, dword ptr [ecx + 32]
    push eax
    push edx
    push 0101919C4h
    push 1
    call sub_1001391E
    add esp, 16
L3:
    mov eax, dword ptr [esi + 8]
    mov dword ptr [g_101AE2A8], eax
    mov cl, byte ptr [esi + 4]
    pop esi
    mov byte ptr [g_101AE2AC], cl
    pop edi
L4:
    pop ebp
    ret
FUN_10002940 ENDP
END
