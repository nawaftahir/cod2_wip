.686
.MODEL FLAT, C
EXTRN sub_10031854:PROC
EXTRN sub_10034098:PROC
EXTRN sub_100344C5:PROC
EXTRN sub_100344CC:PROC
EXTRN sub_100344D3:PROC
EXTRN sub_100344D8:PROC
EXTRN sub_10034570:PROC
EXTRN EXTRN fp_101D49DC:DWORD:DWORD
EXTRN EXTRN fp_101D49E0:DWORD:DWORD
EXTRN EXTRN g_106D3194:DWORD:DWORD
.CODE
FUN_100343d0 PROC
    sub sub esp, 12
    push push ebx
    push push ebp
    push push esi
    push push edi
    push push 0AA50h
    call dword ptr [fp_101D49DC]
    mov mov edx, dword ptr [g_106D3194]
    mov mov ecx, dword ptr [edx + 0249D28h]
    mov mov esi, eax
    xor xor eax, eax
    add add esp, 4
    cmp cmp ecx, eax
    mov mov dword ptr [esp + 24], esi
    mov mov dword ptr [esp + 20], eax
    jle sub_100344C5
    mov mov dword ptr [esp + 16], eax
    lea lea esp, [esp]
    mov mov edi, dword ptr [esp + 16]
    mov mov ebx, dword ptr [edx + 0249D24h]
    mov mov ecx, dword ptr [ebx + edi + 16]
    mov mov esi, dword ptr [edx + 0249D18h]
    add add ebx, edi
    lea lea ecx, [ecx + ecx*2]
    lea lea ebp, [esi + ecx*4]
    mov mov ecx, dword ptr [ebx + 20]
    xor xor edi, edi
    test test ecx, ecx
    jle sub_100344D3
    lea lea ecx, [ecx + ecx*2 - 3]
    shl shl ecx, 2
    xor xor esi, esi
    mov mov edi, edi
    push push eax
    mov mov eax, dword ptr [esp + 28]
    push push 0
    lea lea edx, [esi + ebp]
    add add ecx, ebp
    push push edx
    push push ecx
    mov mov ecx, 0AA5h
    call sub_10034098
    mov mov edx, dword ptr [ebx + 20]
    add add esp, 16
    mov mov ecx, esi
    inc inc edi
    add add esi, 12
    cmp cmp edi, edx
    jl sub_100344D8
    mov mov edx, dword ptr [g_106D3194]
    mov mov ecx, dword ptr [esp + 20]
    mov mov edi, dword ptr [esp + 16]
    mov mov esi, dword ptr [edx + 0249D28h]
    inc inc ecx
    add add edi, 24
    cmp cmp ecx, esi
    mov mov dword ptr [esp + 20], ecx
    mov mov dword ptr [esp + 16], edi
    jl sub_100344CC
    mov mov esi, dword ptr [esp + 24]
    cdq cdq
    sub sub eax, edx
    sar sar eax, 1
    test test eax, eax
    je sub_10034570
    push push 0
    push push esi
    push push 1
    push push eax
    call sub_10031854
    add add esp, 16
    push push esi
    call dword ptr [fp_101D49E0]
    add add esp, 4
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 12
    ret ret
FUN_100343d0 ENDP
END
