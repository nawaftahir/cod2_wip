.686
.MODEL FLAT, C
EXTRN sub_1000D2D8:PROC
EXTRN sub_1000D2D9:PROC
EXTRN sub_1000D2DE:PROC
EXTRN sub_1000D311:PROC
EXTRN EXTRN g_101D0A74:DWORD:DWORD
EXTRN EXTRN g_101D0A78:DWORD:DWORD
.CODE
FUN_1000d260 PROC
    push push esi
    push push edi
    xor xor edi, edi
    mov mov esi, dword ptr [edi + 0101CEA68h]
    test test esi, esi
    je sub_1000D2D8
    cmp cmp byte ptr [esi + 30], 5
    jb sub_1000D2DE
    movzx movzx eax, byte ptr [esi + 12]
    test test eax, eax
    jl L0
    cmp cmp eax, 1
    jle L1
    cmp cmp eax, 4
    je L2
    mov mov eax, dword ptr [esi + 16]
    mov mov ecx, dword ptr [g_101D0A74]
    sub sub ecx, eax
    mov mov eax, dword ptr [g_101D0A78]
    mov mov dword ptr [g_101D0A74], ecx
    mov mov ecx, dword ptr [esi + 20]
    sub sub eax, ecx
    mov mov dword ptr [g_101D0A78], eax
    mov mov eax, dword ptr [esi + 4]
    test test eax, eax
    je sub_1000D311
    mov mov edx, dword ptr [eax]
    push push eax
    call call dword ptr [edx + 8]
    lea lea ecx, [esi + 16]
    mov mov dword ptr [esi + 4], 0
    xor xor eax, eax
    mov mov dword ptr [ecx], eax
    mov mov dword ptr [ecx + 4], eax
    mov mov dword ptr [esi], 0
    add add edi, 4
    cmp cmp edi, 02000h
    jb sub_1000D2D9
    pop pop edi
    pop pop esi
    ret ret
FUN_1000d260 ENDP
END
