; FUN_10014d90 @ 0x10014d90 — auto-synthesized
    EXTRN g_101da9c8:DWORD
    EXTRN g_10678ab8:DWORD
    EXTRN g_10678abc:DWORD
    sub_1005a2d7 PROTO C
.CODE
FUN_10014d90 PROC
    dec eax
    fld dword ptr [esp + 8]
    fmul dword ptr [esp + 8]
    push ebp
    mov ebp, dword ptr [esp + 8]
    fstp dword ptr [esp + 0xc]
    js L0
    push ebx
    push esi
    push edi
    lea edi, [ecx + eax*8]
    lea ebx, [eax + 1]
    mov edx, dword ptr [edi + 4]
    mov eax, dword ptr [edx]
    mov ecx, dword ptr [eax*4 + 0x101a5a8c]
    test ecx, ecx
    je L1
    mov eax, dword ptr [edi]
    test eax, eax
    jns L2
    shr eax, 0x13
    jmp L3
    shr eax, 4
    and eax, 0xfff
    cmp eax, 0x800
    jl L4
    mov eax, 0x7fe
    push eax
    push edi
    call ecx
    add esp, 8
    test eax, eax
    je L1
    lea esi, [eax + 0xc]
    mov edx, eax
    mov ecx, ebp
    call sub_1005a2d7
    fcomp dword ptr [esp + 0x18]
    fnstsw ax
    test ah, 0x41
    je L1
    mov ecx, dword ptr [edi]
    mov eax, dword ptr [g_10678ab8]
    mov edx, dword ptr [g_10678abc]
    mov dword ptr [edx + eax*8], ecx
    mov ecx, dword ptr [edi + 4]
    mov edx, dword ptr [g_10678ab8]
    mov eax, dword ptr [g_10678abc]
    mov dword ptr [eax + edx*8 + 4], ecx
    mov edx, dword ptr [g_10678ab8]
    mov eax, dword ptr [g_101da9c8]
    inc edx
    mov dword ptr [g_10678ab8], edx
    inc dword ptr [eax + 4]
    sub edi, 8
    dec ebx
    jne L5
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret
FUN_10014d90 ENDP
END