.686
.MODEL FLAT, C
EXTRN sub_10014E5E:PROC
EXTRN sub_10014E64:PROC
EXTRN sub_10014E6A:PROC
EXTRN sub_10014E94:PROC
EXTRN sub_10014EAB:PROC
EXTRN sub_1005A2D7:PROC
EXTRN EXTRN g_101DA9C8:DWORD:DWORD
EXTRN EXTRN g_10678AB8:DWORD:DWORD
EXTRN EXTRN g_10678ABC:DWORD:DWORD
.CODE
FUN_10014d90 PROC
    dec dec eax
    fld fld dword ptr [esp + 8]
    fmul fmul dword ptr [esp + 8]
    push push ebp
    mov mov ebp, dword ptr [esp + 8]
    fstp fstp dword ptr [esp + 12]
    js sub_10014E5E
    push push ebx
    push push esi
    push push edi
    lea lea edi, [ecx + eax*8]
    lea lea ebx, [eax + 1]
    mov mov edx, dword ptr [edi + 4]
    mov mov eax, dword ptr [edx]
    mov mov ecx, dword ptr [eax*4 + 0101A5A8Ch]
    test test ecx, ecx
    je sub_10014E6A
    mov mov eax, dword ptr [edi]
    test test eax, eax
    jns L0
    shr shr eax, 19
    jmp L1
    shr shr eax, 4
    and and eax, 0FFFh
    cmp cmp eax, 0800h
    jl L2
    mov mov eax, 07FEh
    push push eax
    push push edi
    call call ecx
    add add esp, 8
    test test eax, eax
    je sub_10014E94
    lea lea esi, [eax + 12]
    mov mov edx, eax
    mov mov ecx, ebp
    call sub_1005A2D7
    fcomp fcomp dword ptr [esp + 24]
    fnstsw fnstsw ax
    test test ah, 65
    je sub_10014EAB
    mov mov ecx, dword ptr [edi]
    mov mov eax, dword ptr [g_10678AB8]
    mov mov edx, dword ptr [g_10678ABC]
    mov mov dword ptr [edx + eax*8], ecx
    mov mov ecx, dword ptr [edi + 4]
    mov mov edx, dword ptr [g_10678AB8]
    mov mov eax, dword ptr [g_10678ABC]
    mov mov dword ptr [eax + edx*8 + 4], ecx
    mov mov edx, dword ptr [g_10678AB8]
    mov mov eax, dword ptr [g_101DA9C8]
    inc inc edx
    mov mov dword ptr [g_10678AB8], edx
    inc inc dword ptr [eax + 4]
    sub sub edi, 8
    dec dec ebx
    jne sub_10014E64
    pop pop edi
    pop pop esi
    pop pop ebx
    pop pop ebp
    ret ret
FUN_10014d90 ENDP
END
