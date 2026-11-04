.686
.MODEL FLAT, C
EXTRN sub_1003A6B7:PROC
EXTRN sub_1003A8F4:PROC
EXTRN sub_1003E5EF:PROC
EXTRN sub_1003ED60:PROC
EXTRN sub_1003EE0F:PROC
EXTRN sub_1003EFC9:PROC
EXTRN sub_10060CB1:PROC
EXTRN sub_100F6CB8:PROC
EXTRN sub_100F6D71:PROC
EXTRN g_101CE708:DWORD
EXTRN g_101CE7EC:DWORD
EXTRN g_1072D9BC:DWORD
EXTRN g_1072D9D0:DWORD
EXTRN g_1072D9E0:DWORD
EXTRN g_1072DE40:DWORD
EXTRN g_10730550:DWORD
EXTRN g_10764584:DWORD
EXTRN g_1076674C:DWORD
EXTRN g_10766750:DWORD
EXTRN g_10766754:DWORD
EXTRN g_10766758:DWORD
.CODE
FUN_100413c0 PROC
    push ebp
    mov ebp, esp
    and esp, 0FFFFFFF8h
    sub esp, 20
    mov eax, dword ptr [g_1072D9D0]
    push ebx
    xor ebx, ebx
    cmp eax, ebx
    push esi
    push edi
    jne L0
    cmp dword ptr [g_1072D9E0], ebx
    je L1
L0:
    call sub_1003A8F4
L1:
    mov eax, dword ptr [g_101CE7EC]
    cmp dword ptr [eax + 8], ebx
    je L2
    mov ecx, dword ptr [g_1072D9BC]
    mov edx, dword ptr [ecx]
    push edx
    push 01019A3DCh
    call sub_10060CB1
    mov ecx, dword ptr [g_101CE7EC]
    mov edx, dword ptr [ecx + 8]
    add esp, 8
    cmp edx, ebx
    je L2
    mov edx, dword ptr [g_10764584]
    cmp edx, ebx
    setne cl
    cmp cl, bl
    je L2
    push eax
    push 010193358h
    push edx
    call sub_100F6D71
    mov edx, dword ptr [g_10764584]
    add esp, 12
    push edx
    call sub_100F6CB8
    add esp, 4
L2:
    mov eax, dword ptr [ebp + 8]
    mov edi, dword ptr [eax + 4]
    movsx ecx, word ptr [edi + 2]
    movsx edx, word ptr [edi + 4]
    mov esi, dword ptr [edi + 20]
    cmp dword ptr [g_1076674C], esi
    mov dword ptr [esp + 28], ebx
    mov dword ptr [esp + 24], ebx
    mov dword ptr [esp + 12], ebx
    mov dword ptr [esp + 16], ecx
    mov dword ptr [esp + 20], edx
    je L3
    call sub_1003ED60
L3:
    mov edx, dword ptr [g_101CE708]
    mov esi, dword ptr [edx + 8]
    mov eax, dword ptr [edi + 16]
    xor ecx, ecx
    cmp esi, 2
    setne cl
    dec ecx
    and ecx, 0FFFFFFE4h
    add ecx, 64
    mov edi, ecx
    cmp dword ptr [g_10766750], eax
    jne L4
    cmp dword ptr [g_10766754], ebx
    jne L4
    cmp dword ptr [g_10766758], edi
    je L5
L4:
    push eax
    xor ebx, ebx
    xor esi, esi
    call sub_1003EE0F
    add esp, 4
L5:
    mov eax, dword ptr [g_10730550]
    imul eax, eax, 000000CD0h
    lea esi, [eax + 01072DEE0h]
    lea edi, [eax + 01072EBB0h]
    mov ecx, 000000334h
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov eax, dword ptr [g_10730550]
    mov ecx, dword ptr [ebp + 8]
    inc eax
    mov dword ptr [g_10730550], eax
    mov eax, dword ptr [g_1072DE40]
    push eax
    call sub_1003EFC9
    add esp, 4
    lea ecx, [esp + 12]
    push ecx
    push ebx
    call sub_1003A6B7
    add esp, 8
    call sub_1003E5EF
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret
FUN_100413c0 ENDP
END
