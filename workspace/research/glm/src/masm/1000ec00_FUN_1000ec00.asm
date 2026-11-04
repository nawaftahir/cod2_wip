.686
.MODEL FLAT, C
EXTRN sub_1000E8A4:PROC
EXTRN sub_1000E9E9:PROC
EXTRN sub_100F6CD9:PROC
EXTRN sub_100F6D77:PROC
EXTRN sub_100F6D95:PROC
EXTRN sub_100F6E33:PROC
EXTRN g_101CE7EC:DWORD
EXTRN g_10764584:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_1000ec00 PROC
    sub esp, 20
    push ebx
    push ebp
    push esi
    mov esi, dword ptr [esp + 44]
    push edi
    mov edi, dword ptr [esp + 40]
    movzx eax, word ptr [edi + 24]
    movzx edx, si
    mov cl, dl
    shr eax, cl
    mov ebx, 1
    mov ecx, ebx
    mov dword ptr [esp + 16], ebx
    sub ecx, eax
    jns L0
    mov dword ptr [esp + 16], eax
L0:
    movzx eax, word ptr [edi + 26]
    mov cl, dl
    shr eax, cl
    mov ecx, ebx
    mov ebp, ebx
    sub ecx, eax
    jns L1
    mov ebp, eax
L1:
    movzx eax, word ptr [edi + 28]
    mov cl, dl
    shr eax, cl
    mov edx, ebx
    mov dword ptr [esp + 20], ebx
    sub edx, eax
    jns L2
    mov dword ptr [esp + 20], eax
L2:
    mov eax, dword ptr [esp + 16]
    mov ecx, dword ptr [esp + 44]
    mov edx, ebp
    call sub_1000E8A4
    mov ebx, eax
L3:
    mov eax, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L4
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L4
    push 010193758h
    push 010193358h
    push eax
    call sub_100F6D95
    mov ecx, dword ptr [g_10764584]
    push ecx
    call sub_100F6CD9
    add esp, 16
L4:
    mov eax, dword ptr [edi + 4]
    mov edx, dword ptr [eax]
    push 0
    push 0
    lea ecx, [esp + 32]
    push ecx
    push esi
    push eax
    call dword ptr [edx + 0x4c]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L3
    mov eax, dword ptr [esp + 20]
    test eax, eax
    mov esi, dword ptr [esp + 32]
    jle L6
    mov edi, eax
    lea esp, [esp]
L5:
    mov edx, dword ptr [esp + 24]
    mov eax, dword ptr [esp + 52]
    push esi
    push edx
    mov edx, dword ptr [esp + 24]
    push eax
    mov eax, dword ptr [esp + 56]
    push ebp
    call sub_1000E9E9
    mov edx, dword ptr [esp + 68]
    mov ecx, dword ptr [esp + 44]
    add edx, ebx
    add esp, 16
    add esi, ecx
    dec edi
    mov dword ptr [esp + 52], edx
    jne L5
    mov edi, dword ptr [esp + 40]
L6:
    mov ecx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [ecx + 8]
    test eax, eax
    je L7
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L7
    push 010193728h
    push 010193358h
    push eax
    call sub_100F6E33
    mov edx, dword ptr [g_10764584]
    push edx
    call sub_100F6D77
    add esp, 16
L7:
    mov edx, dword ptr [esp + 48]
    mov eax, dword ptr [edi + 4]
    mov ecx, dword ptr [eax]
    push edx
    push eax
    call dword ptr [ecx + 0x50]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L6
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 20
    ret
FUN_1000ec00 ENDP
END
