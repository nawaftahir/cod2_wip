.686
.MODEL FLAT, C
EXTRN sub_1003A6B7:PROC
EXTRN sub_1003A8F4:PROC
EXTRN sub_1003E5EF:PROC
EXTRN sub_1003ED60:PROC
EXTRN sub_1003EE0F:PROC
EXTRN sub_1003EFC9:PROC
EXTRN sub_1004151B:PROC
EXTRN sub_1004157A:PROC
EXTRN sub_10041582:PROC
EXTRN sub_10041597:PROC
EXTRN sub_10060CB1:PROC
EXTRN sub_100F6CB8:PROC
EXTRN sub_100F6D71:PROC
EXTRN EXTRN g_101CE708:DWORD:DWORD
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_1072D9BC:DWORD:DWORD
EXTRN EXTRN g_1072D9D0:DWORD:DWORD
EXTRN EXTRN g_1072D9E0:DWORD:DWORD
EXTRN EXTRN g_1072DE40:DWORD:DWORD
EXTRN EXTRN g_10730550:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
EXTRN EXTRN g_1076674C:DWORD:DWORD
EXTRN EXTRN g_10766750:DWORD:DWORD
EXTRN EXTRN g_10766754:DWORD:DWORD
EXTRN EXTRN g_10766758:DWORD:DWORD
.CODE
FUN_100413c0 PROC
    push push ebp
    mov mov ebp, esp
    and and esp, -8
    sub sub esp, 20
    mov mov eax, dword ptr [g_1072D9D0]
    push push ebx
    xor xor ebx, ebx
    cmp cmp eax, ebx
    push push esi
    push push edi
    jne L0
    cmp cmp dword ptr [g_1072D9E0], ebx
    je L1
    call sub_1003A8F4
    mov mov eax, dword ptr [g_101CE7EC]
    cmp cmp dword ptr [eax + 8], ebx
    je L2
    mov mov ecx, dword ptr [g_1072D9BC]
    mov mov edx, dword ptr [ecx]
L0:
    push push edx
    push push 01019A3DCh
    call sub_10060CB1
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
    call sub_100F6D71
    mov mov edx, dword ptr [g_10764584]
    add add esp, 12
    push push edx
    call sub_100F6CB8
    add add esp, 4
    mov mov eax, dword ptr [ebp + 8]
    mov mov edi, dword ptr [eax + 4]
    movsx movsx ecx, word ptr [edi + 2]
    movsx movsx edx, word ptr [edi + 4]
    mov mov esi, dword ptr [edi + 20]
    cmp cmp dword ptr [g_1076674C], esi
    mov mov dword ptr [esp + 28], ebx
    mov mov dword ptr [esp + 24], ebx
    mov mov dword ptr [esp + 12], ebx
    mov mov dword ptr [esp + 16], ecx
    mov mov dword ptr [esp + 20], edx
    je sub_1004151B
    call sub_1003ED60
    mov mov edx, dword ptr [g_101CE708]
    mov mov esi, dword ptr [edx + 8]
    mov mov eax, dword ptr [edi + 16]
    xor xor ecx, ecx
    cmp cmp esi, 2
    setne setne cl
    dec dec ecx
    and and ecx, -28
    add add ecx, 64
    mov mov edi, ecx
    cmp cmp dword ptr [g_10766750], eax
    jne sub_1004157A
    cmp cmp dword ptr [g_10766754], ebx
    jne sub_10041582
    cmp cmp dword ptr [g_10766758], edi
    je sub_10041597
    push push eax
    xor xor ebx, ebx
    xor xor esi, esi
    call sub_1003EE0F
    add add esp, 4
    mov mov eax, dword ptr [g_10730550]
    imul imul eax, eax, 0CD0h
    lea lea esi, [eax + 01072DEE0h]
    lea lea edi, [eax + 01072EBB0h]
    mov mov ecx, 0334h
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov eax, dword ptr [g_10730550]
    mov mov ecx, dword ptr [ebp + 8]
    inc inc eax
    mov mov dword ptr [g_10730550], eax
    mov mov eax, dword ptr [g_1072DE40]
    push push eax
    call sub_1003EFC9
    add add esp, 4
    lea lea ecx, [esp + 12]
    push push ecx
    push push ebx
    call sub_1003A6B7
    add add esp, 8
    call sub_1003E5EF
    pop pop edi
    pop pop esi
    pop pop ebx
    mov mov esp, ebp
    pop pop ebp
    ret ret
FUN_100413c0 ENDP
END
