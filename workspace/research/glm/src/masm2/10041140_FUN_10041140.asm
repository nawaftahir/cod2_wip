.686
.MODEL FLAT, C
EXTRN sub_1003A68A:PROC
EXTRN sub_1003A8F0:PROC
EXTRN sub_1003ED7B:PROC
EXTRN sub_1003EE1B:PROC
EXTRN sub_100412CF:PROC
EXTRN sub_10041312:PROC
EXTRN sub_1004131A:PROC
EXTRN sub_1004132F:PROC
EXTRN sub_10060CAD:PROC
EXTRN sub_100F6CB4:PROC
EXTRN sub_100F6D6D:PROC
EXTRN EXTRN g_101CE708:DWORD:DWORD
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_106D3194:DWORD:DWORD
EXTRN EXTRN g_1072D9BC:DWORD:DWORD
EXTRN EXTRN g_1072D9D0:DWORD:DWORD
EXTRN EXTRN g_1072D9E0:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
EXTRN EXTRN g_1076674C:DWORD:DWORD
EXTRN EXTRN g_10766750:DWORD:DWORD
EXTRN EXTRN g_10766754:DWORD:DWORD
EXTRN EXTRN g_10766758:DWORD:DWORD
.CODE
FUN_10041140 PROC
    sub sub esp, 24
    push push ebx
    push push esi
    mov mov esi, eax
    mov mov eax, dword ptr [g_1072D9D0]
    xor xor ebx, ebx
    cmp cmp eax, ebx
    push push edi
    jne L0
    cmp cmp dword ptr [g_1072D9E0], ebx
    je L1
    call sub_1003A8F0
    mov mov eax, dword ptr [g_101CE7EC]
    cmp cmp dword ptr [eax + 8], ebx
    je L2
    mov mov ecx, dword ptr [g_1072D9BC]
    mov mov edx, dword ptr [ecx]
    push push edx
    push push 01019A42Ch
    call sub_10060CAD
    mov mov ecx, dword ptr [g_101CE7EC]
    mov mov edx, dword ptr [ecx + 8]
    add add esp, 8
    cmp cmp edx, ebx
    je L3
    mov mov edx, dword ptr [g_10764584]
    cmp cmp edx, ebx
    setne setne cl
    cmp cmp cl, bl
    je L4
    push push eax
    push push 010193358h
    push push edx
    call sub_100F6D6D
    mov mov edx, dword ptr [g_10764584]
    add add esp, 12
    push push edx
    call sub_100F6CB4
    add add esp, 4
    mov mov edx, dword ptr [g_101CE708]
    mov mov edi, dword ptr [edx + 8]
    xor xor eax, eax
    cmp cmp edi, 2
    setne setne al
    mov mov ecx, dword ptr [esi + 4]
    mov mov dword ptr [esp + 32], ebx
    mov mov dword ptr [esp + 16], ebx
    dec dec eax
    and and eax, -28
    add add eax, 64
    mov mov edi, eax
    mov mov eax, dword ptr [esi + 8]
    cdq cdq
    idiv idiv edi
    movsx movsx edx, word ptr [ecx + 4]
    mov mov dword ptr [esp + 24], edx
    mov mov dword ptr [esp + 28], eax
    movsx movsx eax, word ptr [ecx + 2]
    mov mov ecx, dword ptr [ecx + 20]
    mov mov dword ptr [esp + 20], eax
    cmp cmp dword ptr [g_1076674C], ecx
    je sub_100412CF
    mov mov esi, ecx
    call sub_1003ED7B
    mov mov eax, dword ptr [g_106D3194]
    mov mov ecx, dword ptr [eax + 0217C78h]
L4:
    mov mov eax, dword ptr [ecx + 8]
    cmp cmp dword ptr [g_10766750], eax
    jne sub_10041312
    cmp cmp dword ptr [g_10766754], ebx
    jne sub_1004131A
    cmp cmp dword ptr [g_10766758], edi
    je sub_1004132F
    push push eax
    xor xor ebx, ebx
    xor xor esi, esi
    call sub_1003EE1B
    add add esp, 4
    lea lea edx, [esp + 16]
    push push edx
    push push 0
    call sub_1003A68A
    add add esp, 8
    pop pop edi
    pop pop esi
    pop pop ebx
    add add esp, 24
    ret ret
FUN_10041140 ENDP
END
