.686
.MODEL FLAT, C
EXTRN sub_1000669D:PROC
EXTRN sub_1000983C:PROC
EXTRN sub_1000983F:PROC
EXTRN sub_10009859:PROC
EXTRN sub_100138E4:PROC
EXTRN EXTRN g_101CE5E0:DWORD:DWORD
EXTRN EXTRN g_101CE5E4:DWORD:DWORD
.CODE
FUN_10009770 PROC
    cmp cmp dword ptr [g_101CE5E0], 0100h
    push push ebp
    mov mov ebp, dword ptr [esp + 8]
    push push esi
    push push edi
    jl L0
    push push 0100h
    push push 01019258Ch
    push push 1
    call sub_100138E4
    add add esp, 12
    movzx movzx edx, byte ptr [ebp + 36]
    push push ebx
    mov mov ebx, dword ptr [ebp + 32]
    mov mov ecx, 0101CE588h
    mov mov byte ptr [ebp], 1
    call sub_1000669D
    mov mov edx, dword ptr [g_101CE5E0]
    lea lea ecx, [edx - 1]
    sar sar ecx, 1
    test test ecx, ecx
    pop pop ebx
    jl sub_1000983C
    lea lea ecx, [ecx]
    mov mov edi, dword ptr [g_101CE5E4]
    fcom fcom dword ptr [edi + ecx*8 + 4]
    lea lea esi, [edi + ecx*8]
    fnstsw fnstsw ax
    test test ah, 1
    je sub_10009859
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [edi + edx*8], eax
    mov mov eax, dword ptr [esi + 4]
    mov mov esi, dword ptr [g_101CE5E4]
    mov mov dword ptr [esi + edx*8 + 4], eax
    mov mov edx, ecx
    dec dec ecx
    sar sar ecx, 1
    test test ecx, ecx
    jge sub_1000983F
    mov mov edi, dword ptr [g_101CE5E4]
    mov mov dword ptr [edi + edx*8], ebp
    mov mov ecx, dword ptr [g_101CE5E4]
    fstp fstp dword ptr [ecx + edx*8 + 4]
    mov mov eax, dword ptr [g_101CE5E0]
    pop pop edi
    inc inc eax
    pop pop esi
    mov mov dword ptr [g_101CE5E0], eax
    pop pop ebp
    ret ret
FUN_10009770 ENDP
END
