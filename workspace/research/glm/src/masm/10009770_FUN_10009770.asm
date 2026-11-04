.686
.MODEL FLAT, C
EXTRN sub_1000669D:PROC
EXTRN sub_100138E4:PROC
EXTRN g_101CE5E0:DWORD
EXTRN g_101CE5E4:DWORD
.CODE
FUN_10009770 PROC
    cmp dword ptr [g_101CE5E0], 000000100h
    push ebp
    mov ebp, dword ptr [esp + 8]
    push esi
    push edi
    jl L0
    push 000000100h
    push 01019258Ch
    push 1
    call sub_100138E4
    add esp, 12
L0:
    movzx edx, byte ptr [ebp + 36]
    push ebx
    mov ebx, dword ptr [ebp + 32]
    mov ecx, 0101CE588h
    mov byte ptr [ebp], 1
    call sub_1000669D
    mov edx, dword ptr [g_101CE5E0]
    lea ecx, [edx - 1]
    sar ecx, 1
    test ecx, ecx
    pop ebx
    jl L2
    lea ecx, [ecx]
L1:
    mov edi, dword ptr [g_101CE5E4]
    fcom dword ptr [edi + ecx*8 + 4]
    lea esi, [edi + ecx*8]
    fnstsw ax
    test ah, 1
    je L3
    mov eax, dword ptr [esi]
    mov dword ptr [edi + edx*8], eax
    mov eax, dword ptr [esi + 4]
    mov esi, dword ptr [g_101CE5E4]
    mov dword ptr [esi + edx*8 + 4], eax
    mov edx, ecx
    dec ecx
    sar ecx, 1
    test ecx, ecx
    jge L1
L2:
    mov edi, dword ptr [g_101CE5E4]
L3:
    mov dword ptr [edi + edx*8], ebp
    mov ecx, dword ptr [g_101CE5E4]
    fstp dword ptr [ecx + edx*8 + 4]
    mov eax, dword ptr [g_101CE5E0]
    pop edi
    inc eax
    pop esi
    mov dword ptr [g_101CE5E0], eax
    pop ebp
    ret
FUN_10009770 ENDP
END
