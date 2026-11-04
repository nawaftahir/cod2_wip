.686
.MODEL FLAT, C
EXTRN sub_1002CF5C:PROC
EXTRN sub_1002DFD7:PROC
EXTRN sub_1002DFE5:PROC
EXTRN sub_100413A5:PROC
EXTRN sub_100413EB:PROC
EXTRN sub_10041424:PROC
EXTRN sub_1005EBE4:PROC
EXTRN sub_10060C93:PROC
EXTRN sub_100F6C9A:PROC
EXTRN sub_100F6D53:PROC
EXTRN EXTRN g_101CE708:DWORD:DWORD
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_1072D9B0:DWORD:DWORD
EXTRN EXTRN g_1072D9BC:DWORD:DWORD
EXTRN EXTRN g_1072D9D0:DWORD:DWORD
EXTRN EXTRN g_1072D9D4:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
.CODE
FUN_10041260 PROC
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    push push ebx
    push push ebp
    push push esi
    push push edi
    je L0
    mov mov ecx, dword ptr [g_1072D9BC]
    mov mov edx, dword ptr [ecx]
    push push edx
    push push 01019A400h
    call sub_10060C93
    mov mov ecx, dword ptr [g_101CE7EC]
    mov mov edx, dword ptr [ecx + 8]
    add add esp, 8
    test test edx, edx
    je L1
    mov mov edx, dword ptr [g_10764584]
    test test edx, edx
    setne setne cl
    test test cl, cl
    je L2
    push push eax
    push push 010193358h
    push push edx
    call sub_100F6D53
    mov mov edx, dword ptr [g_10764584]
    add add esp, 12
    push push edx
    call sub_100F6C9A
    add add esp, 4
    mov mov eax, dword ptr [esp + 20]
    mov mov edi, dword ptr [eax + 4]
    movsx movsx esi, word ptr [edi + 2]
    mov mov ecx, dword ptr [g_1072D9D4]
    movsx movsx eax, word ptr [edi + 4]
    add add ecx, esi
    cmp cmp ecx, 0154Ah
    lea lea ebp, [eax + eax*2]
    jg L3
    mov mov edx, dword ptr [g_1072D9D0]
    add add edx, ebp
    cmp cmp edx, 0100000h
    jle L4
    call sub_1002DFD7
    test test byte ptr [g_1072D9D0], 1
    je sub_100413A5
    call sub_1002DFE5
    mov mov eax, dword ptr [g_101CE708]
    cmp cmp dword ptr [eax + 8], 2
    mov mov ebx, dword ptr [g_1072D9D4]
    jne sub_100413EB
    mov mov edx, dword ptr [esp + 20]
    mov mov eax, dword ptr [edx + 12]
    lea lea ecx, [esi + esi*8]
    shl shl ecx, 2
    push push ecx
    push push eax
    movzx movzx eax, bx
    lea lea ecx, [eax + eax*8]
    lea lea edx, [ecx*4 + 0106D3200h]
    push push edx
    jmp sub_10041424
    mov mov ecx, dword ptr [esp + 20]
    mov mov edx, dword ptr [ecx + 12]
    mov mov eax, esi
    shl shl eax, 6
    push push eax
    movzx movzx eax, bx
    shl shl eax, 6
    push push edx
    add add eax, 0106D3200h
    push push eax
    call sub_1005EBE4
    mov mov ecx, dword ptr [g_1072D9D4]
    mov mov edx, dword ptr [g_1072D9B0]
    add add ecx, esi
    add add esp, 12
    mov mov dword ptr [g_1072D9D4], ecx
    mov mov ecx, dword ptr [g_1072D9D0]
    push push ebx
    lea lea eax, [edx + ecx*2]
    push push eax
    push push edi
    call sub_1002CF5C
    mov mov eax, dword ptr [g_1072D9D0]
    add add esp, 12
    pop pop edi
    pop pop esi
    add add eax, ebp
    pop pop ebp
L4:
    mov mov dword ptr [g_1072D9D0], eax
    pop pop ebx
    ret ret
FUN_10041260 ENDP
END
