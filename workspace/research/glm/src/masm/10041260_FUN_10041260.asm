.686
.MODEL FLAT, C
EXTRN sub_1002CF5C:PROC
EXTRN sub_1002DFD7:PROC
EXTRN sub_1002DFE5:PROC
EXTRN sub_1005EBE4:PROC
EXTRN sub_10060C93:PROC
EXTRN sub_100F6C9A:PROC
EXTRN sub_100F6D53:PROC
EXTRN g_101CE708:DWORD
EXTRN g_101CE7EC:DWORD
EXTRN g_1072D9B0:DWORD
EXTRN g_1072D9BC:DWORD
EXTRN g_1072D9D0:DWORD
EXTRN g_1072D9D4:DWORD
EXTRN g_10764584:DWORD
.CODE
FUN_10041260 PROC
    mov eax, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    push ebx
    push ebp
    push esi
    push edi
    je L0
    mov ecx, dword ptr [g_1072D9BC]
    mov edx, dword ptr [ecx]
    push edx
    push 01019A400h
    call sub_10060C93
    mov ecx, dword ptr [g_101CE7EC]
    mov edx, dword ptr [ecx + 8]
    add esp, 8
    test edx, edx
    je L0
    mov edx, dword ptr [g_10764584]
    test edx, edx
    setne cl
    test cl, cl
    je L0
    push eax
    push 010193358h
    push edx
    call sub_100F6D53
    mov edx, dword ptr [g_10764584]
    add esp, 12
    push edx
    call sub_100F6C9A
    add esp, 4
L0:
    mov eax, dword ptr [esp + 20]
    mov edi, dword ptr [eax + 4]
    movsx esi, word ptr [edi + 2]
    mov ecx, dword ptr [g_1072D9D4]
    movsx eax, word ptr [edi + 4]
    add ecx, esi
    cmp ecx, 00000154Ah
    lea ebp, [eax + eax*2]
    jg L1
    mov edx, dword ptr [g_1072D9D0]
    add edx, ebp
    cmp edx, 000100000h
    jle L2
L1:
    call sub_1002DFD7
L2:
    test byte ptr [g_1072D9D0], 1
    je L3
    call sub_1002DFE5
L3:
    mov eax, dword ptr [g_101CE708]
    cmp dword ptr [eax + 8], 2
    mov ebx, dword ptr [g_1072D9D4]
    jne L4
    mov edx, dword ptr [esp + 20]
    mov eax, dword ptr [edx + 12]
    lea ecx, [esi + esi*8]
    shl ecx, 2
    push ecx
    push eax
    movzx eax, bx
    lea ecx, [eax + eax*8]
    lea edx, [ecx*4 + 0106D3200h]
    push edx
    jmp L5
L4:
    mov ecx, dword ptr [esp + 20]
    mov edx, dword ptr [ecx + 12]
    mov eax, esi
    shl eax, 6
    push eax
    movzx eax, bx
    shl eax, 6
    push edx
    add eax, 0106D3200h
    push eax
L5:
    call sub_1005EBE4
    mov ecx, dword ptr [g_1072D9D4]
    mov edx, dword ptr [g_1072D9B0]
    add ecx, esi
    add esp, 12
    mov dword ptr [g_1072D9D4], ecx
    mov ecx, dword ptr [g_1072D9D0]
    push ebx
    lea eax, [edx + ecx*2]
    push eax
    push edi
    call sub_1002CF5C
    mov eax, dword ptr [g_1072D9D0]
    add esp, 12
    pop edi
    pop esi
    add eax, ebp
    pop ebp
    mov dword ptr [g_1072D9D0], eax
    pop ebx
    ret
FUN_10041260 ENDP
END
