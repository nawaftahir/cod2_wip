.686
.MODEL FLAT, C
EXTRN g_101D0A74:DWORD
EXTRN g_101D0A78:DWORD
.CODE
FUN_1000d260 PROC
    push esi
    push edi
    xor edi, edi
L0:
    mov esi, dword ptr [edi + 0101CEA68h]
    test esi, esi
    je L4
    cmp byte ptr [esi + 30], 5
    jb L4
    movzx eax, byte ptr [esi + 12]
    test eax, eax
    jl L1
    cmp eax, 1
    jle L2
    cmp eax, 4
    je L2
L1:
    mov eax, dword ptr [esi + 16]
    mov ecx, dword ptr [g_101D0A74]
    sub ecx, eax
    mov eax, dword ptr [g_101D0A78]
    mov dword ptr [g_101D0A74], ecx
    mov ecx, dword ptr [esi + 20]
    sub eax, ecx
    mov dword ptr [g_101D0A78], eax
L2:
    mov eax, dword ptr [esi + 4]
    test eax, eax
    je L3
    mov edx, dword ptr [eax]
    push eax
    call dword ptr [edx + 8]
    lea ecx, [esi + 16]
    mov dword ptr [esi + 4], 0
    xor eax, eax
    mov dword ptr [ecx], eax
    mov dword ptr [ecx + 4], eax
L3:
    mov dword ptr [esi], 0
L4:
    add edi, 4
    cmp edi, 000002000h
    jb L0
    pop edi
    pop esi
    ret
FUN_1000d260 ENDP
END
