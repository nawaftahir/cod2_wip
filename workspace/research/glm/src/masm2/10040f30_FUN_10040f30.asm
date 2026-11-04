.686
.MODEL FLAT, C
EXTRN sub_1003A66B:PROC
EXTRN sub_1003A8EE:PROC
EXTRN sub_1003ED60:PROC
EXTRN sub_1003EDFC:PROC
EXTRN sub_10040E8D:PROC
EXTRN sub_1004108B:PROC
EXTRN sub_100410C4:PROC
EXTRN sub_100410CC:PROC
EXTRN sub_100410E1:PROC
EXTRN sub_10060CAB:PROC
EXTRN sub_100F6CB2:PROC
EXTRN sub_100F6D6B:PROC
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_101D49A8:DWORD:DWORD
EXTRN EXTRN g_101D49AC:DWORD:DWORD
EXTRN EXTRN g_1072D9BC:DWORD:DWORD
EXTRN EXTRN g_1072D9D0:DWORD:DWORD
EXTRN EXTRN g_1072D9E0:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
EXTRN EXTRN g_1076674C:DWORD:DWORD
EXTRN EXTRN g_10766750:DWORD:DWORD
EXTRN EXTRN g_10766754:DWORD:DWORD
EXTRN EXTRN g_10766758:DWORD:DWORD
.CODE
FUN_10040f30 PROC
    mov mov eax, dword ptr [g_1072D9D0]
    sub sub esp, 20
    push push ebx
    xor xor ebx, ebx
    cmp cmp eax, ebx
    push push esi
    push push edi
    jne L0
    cmp cmp dword ptr [g_1072D9E0], ebx
    je L1
    call sub_1003A8EE
    mov mov eax, dword ptr [g_101CE7EC]
    cmp cmp dword ptr [eax + 8], ebx
    je L2
    mov mov ecx, dword ptr [g_1072D9BC]
    mov mov edx, dword ptr [ecx]
    push push edx
    push push 01019A458h
    call sub_10060CAB
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
    call sub_100F6D6B
    mov mov edx, dword ptr [g_10764584]
    add add esp, 12
    push push edx
    call sub_100F6CB2
    add add esp, 4
    mov mov edi, dword ptr [esp + 36]
    mov mov dword ptr [esp + 24], ebx
    mov mov dword ptr [esp + 28], ebx
    mov mov dword ptr [esp + 12], ebx
    mov mov dword ptr [esp + 16], 01000h
    mov mov dword ptr [esp + 20], 0800h
    call sub_10040E8D
    mov mov esi, dword ptr [g_101D49AC]
    cmp cmp dword ptr [g_1076674C], esi
    je sub_1004108B
    call sub_1003ED60
    mov mov eax, dword ptr [g_101D49A8]
    cmp cmp dword ptr [g_10766750], eax
    mov mov edi, 20
    jne sub_100410C4
    cmp cmp dword ptr [g_10766754], ebx
    jne sub_100410CC
    cmp cmp dword ptr [g_10766758], edi
    je sub_100410E1
L4:
    push push eax
    xor xor ebx, ebx
    xor xor esi, esi
    call sub_1003EDFC
    add add esp, 4
    lea lea eax, [esp + 12]
    push push eax
    push push 2
    call sub_1003A66B
    add add esp, 8
    pop pop edi
    pop pop esi
    pop pop ebx
    add add esp, 20
    ret ret
FUN_10040f30 ENDP
END
