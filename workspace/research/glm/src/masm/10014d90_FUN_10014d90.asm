.686
.MODEL FLAT, C
EXTRN sub_1005A2D7:PROC
EXTRN g_101DA9C8:DWORD
EXTRN g_10678AB8:DWORD
EXTRN g_10678ABC:DWORD
.CODE
FUN_10014d90 PROC
    dec eax
    fld dword ptr [esp + 8]
    fmul dword ptr [esp + 8]
    push ebp
    mov ebp, dword ptr [esp + 8]
    fstp dword ptr [esp + 12]
    js L5
    push ebx
    push esi
    push edi
    lea edi, [ecx + eax*8]
    lea ebx, [eax + 1]
L0:
    mov edx, dword ptr [edi + 4]
    mov eax, dword ptr [edx]
    mov ecx, dword ptr [eax*4 + 0101A5A8Ch]
    test ecx, ecx
    je L4
    mov eax, dword ptr [edi]
    test eax, eax
    jns L1
    shr eax, 19
    jmp L2
L1:
    shr eax, 4
L2:
    and eax, 000000FFFh
    cmp eax, 000000800h
    jl L3
    mov eax, 0000007FEh
L3:
    push eax
    push edi
    call ecx
    add esp, 8
    test eax, eax
    je L4
    lea esi, [eax + 12]
    mov edx, eax
    mov ecx, ebp
    call sub_1005A2D7
    fcomp dword ptr [esp + 24]
    fnstsw ax
    test ah, 65
    je L4
    mov ecx, dword ptr [edi]
    mov eax, dword ptr [g_10678AB8]
    mov edx, dword ptr [g_10678ABC]
    mov dword ptr [edx + eax*8], ecx
    mov ecx, dword ptr [edi + 4]
    mov edx, dword ptr [g_10678AB8]
    mov eax, dword ptr [g_10678ABC]
    mov dword ptr [eax + edx*8 + 4], ecx
    mov edx, dword ptr [g_10678AB8]
    mov eax, dword ptr [g_101DA9C8]
    inc edx
    mov dword ptr [g_10678AB8], edx
    inc dword ptr [eax + 4]
L4:
    sub edi, 8
    dec ebx
    jne L0
    pop edi
    pop esi
    pop ebx
L5:
    pop ebp
    ret
FUN_10014d90 ENDP
END
