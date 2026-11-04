.686
.MODEL FLAT, C
EXTRN sub_1003A66B:PROC
EXTRN sub_1003A8EE:PROC
EXTRN sub_1003ED60:PROC
EXTRN sub_1003EDFC:PROC
EXTRN sub_10040E8D:PROC
EXTRN sub_10060CAB:PROC
EXTRN sub_100F6CB2:PROC
EXTRN sub_100F6D6B:PROC
EXTRN g_101CE7EC:DWORD
EXTRN g_101D49A8:DWORD
EXTRN g_101D49AC:DWORD
EXTRN g_1072D9BC:DWORD
EXTRN g_1072D9D0:DWORD
EXTRN g_1072D9E0:DWORD
EXTRN g_10764584:DWORD
EXTRN g_1076674C:DWORD
EXTRN g_10766750:DWORD
EXTRN g_10766754:DWORD
EXTRN g_10766758:DWORD
.CODE
FUN_10040f30 PROC
    mov eax, dword ptr [g_1072D9D0]
    sub esp, 20
    push ebx
    xor ebx, ebx
    cmp eax, ebx
    push esi
    push edi
    jne L0
    cmp dword ptr [g_1072D9E0], ebx
    je L1
L0:
    call sub_1003A8EE
L1:
    mov eax, dword ptr [g_101CE7EC]
    cmp dword ptr [eax + 8], ebx
    je L2
    mov ecx, dword ptr [g_1072D9BC]
    mov edx, dword ptr [ecx]
    push edx
    push 01019A458h
    call sub_10060CAB
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
    call sub_100F6D6B
    mov edx, dword ptr [g_10764584]
    add esp, 12
    push edx
    call sub_100F6CB2
    add esp, 4
L2:
    mov edi, dword ptr [esp + 36]
    mov dword ptr [esp + 24], ebx
    mov dword ptr [esp + 28], ebx
    mov dword ptr [esp + 12], ebx
    mov dword ptr [esp + 16], 000001000h
    mov dword ptr [esp + 20], 000000800h
    call sub_10040E8D
    mov esi, dword ptr [g_101D49AC]
    cmp dword ptr [g_1076674C], esi
    je L3
    call sub_1003ED60
L3:
    mov eax, dword ptr [g_101D49A8]
    cmp dword ptr [g_10766750], eax
    mov edi, 20
    jne L4
    cmp dword ptr [g_10766754], ebx
    jne L4
    cmp dword ptr [g_10766758], edi
    je L5
L4:
    push eax
    xor ebx, ebx
    xor esi, esi
    call sub_1003EDFC
    add esp, 4
L5:
    lea eax, [esp + 12]
    push eax
    push 2
    call sub_1003A66B
    add esp, 8
    pop edi
    pop esi
    pop ebx
    add esp, 20
    ret
FUN_10040f30 ENDP
END
