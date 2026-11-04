.686
.MODEL FLAT, C
EXTRN sub_10031854:PROC
EXTRN sub_10034098:PROC
EXTRN fp_101D49DC:DWORD
EXTRN fp_101D49E0:DWORD
EXTRN g_106D3194:DWORD
.CODE
FUN_100343d0 PROC
    sub esp, 12
    push ebx
    push ebp
    push esi
    push edi
    push 00000AA50h
    call dword ptr [fp_101D49DC]
    mov edx, dword ptr [g_106D3194]
    mov ecx, dword ptr [edx + 000249D28h]
    mov esi, eax
    xor eax, eax
    add esp, 4
    cmp ecx, eax
    mov dword ptr [esp + 24], esi
    mov dword ptr [esp + 20], eax
    jle L3
    mov dword ptr [esp + 16], eax
    lea esp, [esp]
L0:
    mov edi, dword ptr [esp + 16]
    mov ebx, dword ptr [edx + 000249D24h]
    mov ecx, dword ptr [ebx + edi + 16]
    mov esi, dword ptr [edx + 000249D18h]
    add ebx, edi
    lea ecx, [ecx + ecx*2]
    lea ebp, [esi + ecx*4]
    mov ecx, dword ptr [ebx + 20]
    xor edi, edi
    test ecx, ecx
    jle L2
    lea ecx, [ecx + ecx*2 - 3]
    shl ecx, 2
    xor esi, esi
    mov edi, edi
L1:
    push eax
    mov eax, dword ptr [esp + 28]
    push 0
    lea edx, [esi + ebp]
    add ecx, ebp
    push edx
    push ecx
    mov ecx, 000000AA5h
    call sub_10034098
    mov edx, dword ptr [ebx + 20]
    add esp, 16
    mov ecx, esi
    inc edi
    add esi, 12
    cmp edi, edx
    jl L1
    mov edx, dword ptr [g_106D3194]
L2:
    mov ecx, dword ptr [esp + 20]
    mov edi, dword ptr [esp + 16]
    mov esi, dword ptr [edx + 000249D28h]
    inc ecx
    add edi, 24
    cmp ecx, esi
    mov dword ptr [esp + 20], ecx
    mov dword ptr [esp + 16], edi
    jl L0
    mov esi, dword ptr [esp + 24]
L3:
    cdq
    sub eax, edx
    sar eax, 1
    test eax, eax
    je L4
    push 0
    push esi
    push 1
    push eax
    call sub_10031854
    add esp, 16
L4:
    push esi
    call dword ptr [fp_101D49E0]
    add esp, 4
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 12
    ret
FUN_100343d0 ENDP
END
