.686
.MODEL FLAT, C
EXTRN sub_1003A68A:PROC
EXTRN sub_1003A8F0:PROC
EXTRN sub_1003ED7B:PROC
EXTRN sub_1003EE1B:PROC
EXTRN sub_10060CAD:PROC
EXTRN sub_100F6CB4:PROC
EXTRN sub_100F6D6D:PROC
EXTRN g_101CE708:DWORD
EXTRN g_101CE7EC:DWORD
EXTRN g_106D3194:DWORD
EXTRN g_1072D9BC:DWORD
EXTRN g_1072D9D0:DWORD
EXTRN g_1072D9E0:DWORD
EXTRN g_10764584:DWORD
EXTRN g_1076674C:DWORD
EXTRN g_10766750:DWORD
EXTRN g_10766754:DWORD
EXTRN g_10766758:DWORD
.CODE
FUN_10041140 PROC
    sub esp, 24
    push ebx
    push esi
    mov esi, eax
    mov eax, dword ptr [g_1072D9D0]
    xor ebx, ebx
    cmp eax, ebx
    push edi
    jne L0
    cmp dword ptr [g_1072D9E0], ebx
    je L1
L0:
    call sub_1003A8F0
L1:
    mov eax, dword ptr [g_101CE7EC]
    cmp dword ptr [eax + 8], ebx
    je L2
    mov ecx, dword ptr [g_1072D9BC]
    mov edx, dword ptr [ecx]
    push edx
    push 01019A42Ch
    call sub_10060CAD
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
    call sub_100F6D6D
    mov edx, dword ptr [g_10764584]
    add esp, 12
    push edx
    call sub_100F6CB4
    add esp, 4
L2:
    mov edx, dword ptr [g_101CE708]
    mov edi, dword ptr [edx + 8]
    xor eax, eax
    cmp edi, 2
    setne al
    mov ecx, dword ptr [esi + 4]
    mov dword ptr [esp + 32], ebx
    mov dword ptr [esp + 16], ebx
    dec eax
    and eax, 0FFFFFFE4h
    add eax, 64
    mov edi, eax
    mov eax, dword ptr [esi + 8]
    cdq
    idiv edi
    movsx edx, word ptr [ecx + 4]
    mov dword ptr [esp + 24], edx
    mov dword ptr [esp + 28], eax
    movsx eax, word ptr [ecx + 2]
    mov ecx, dword ptr [ecx + 20]
    mov dword ptr [esp + 20], eax
    cmp dword ptr [g_1076674C], ecx
    je L3
    mov esi, ecx
    call sub_1003ED7B
L3:
    mov eax, dword ptr [g_106D3194]
    mov ecx, dword ptr [eax + 000217C78h]
    mov eax, dword ptr [ecx + 8]
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
    call sub_1003EE1B
    add esp, 4
L5:
    lea edx, [esp + 16]
    push edx
    push 0
    call sub_1003A68A
    add esp, 8
    pop edi
    pop esi
    pop ebx
    add esp, 24
    ret
FUN_10041140 ENDP
END
