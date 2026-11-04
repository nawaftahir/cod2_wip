.686
.MODEL FLAT, C
EXTRN sub_1000E8A4:PROC
EXTRN sub_1000E9E9:PROC
EXTRN sub_1000EDCA:PROC
EXTRN sub_1000EDCF:PROC
EXTRN sub_1000EE4D:PROC
EXTRN sub_1000EE57:PROC
EXTRN sub_1000EE5B:PROC
EXTRN sub_100F6CD9:PROC
EXTRN sub_100F6D77:PROC
EXTRN sub_100F6D95:PROC
EXTRN sub_100F6E33:PROC
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_1000ec00 PROC
    sub sub esp, 20
    push push ebx
    push push ebp
    push push esi
    mov mov esi, dword ptr [esp + 44]
    push push edi
    mov mov edi, dword ptr [esp + 40]
    movzx movzx eax, word ptr [edi + 24]
    movzx movzx edx, si
    mov mov cl, dl
    shr shr eax, cl
    mov mov ebx, 1
    mov mov ecx, ebx
    mov mov dword ptr [esp + 16], ebx
    sub sub ecx, eax
    jns L0
    mov mov dword ptr [esp + 16], eax
    movzx movzx eax, word ptr [edi + 26]
    mov mov cl, dl
    shr shr eax, cl
    mov mov ecx, ebx
    mov mov ebp, ebx
    sub sub ecx, eax
    jns L1
    mov mov ebp, eax
    movzx movzx eax, word ptr [edi + 28]
    mov mov cl, dl
    shr shr eax, cl
    mov mov edx, ebx
    mov mov dword ptr [esp + 20], ebx
    sub sub edx, eax
    jns L2
    mov mov dword ptr [esp + 20], eax
    mov mov eax, dword ptr [esp + 16]
    mov mov ecx, dword ptr [esp + 44]
    mov mov edx, ebp
    call sub_1000E8A4
    mov mov ebx, eax
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je L3
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
L1:
    test test cl, cl
    je L4
    push push 010193758h
    push push 010193358h
    push push eax
    call sub_100F6D95
    mov mov ecx, dword ptr [g_10764584]
    push push ecx
    call sub_100F6CD9
    add add esp, 16
    mov mov eax, dword ptr [edi + 4]
    mov mov edx, dword ptr [eax]
    push push 0
L2:
    push push 0
    lea lea ecx, [esp + 32]
    push push ecx
    push push esi
    push push eax
    call call dword ptr [edx + 76]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne L5
    mov mov eax, dword ptr [esp + 20]
    test test eax, eax
    mov mov esi, dword ptr [esp + 32]
    jle sub_1000EDCA
    mov mov edi, eax
    lea lea esp, [esp]
    mov mov edx, dword ptr [esp + 24]
    mov mov eax, dword ptr [esp + 52]
    push push esi
    push push edx
    mov mov edx, dword ptr [esp + 24]
    push push eax
    mov mov eax, dword ptr [esp + 56]
    push push ebp
    call sub_1000E9E9
    mov mov edx, dword ptr [esp + 68]
    mov mov ecx, dword ptr [esp + 44]
    add add edx, ebx
    add add esp, 16
    add add esi, ecx
    dec dec edi
    mov mov dword ptr [esp + 52], edx
    jne sub_1000EDCF
    mov mov edi, dword ptr [esp + 40]
    mov mov ecx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [ecx + 8]
    test test eax, eax
    je sub_1000EE4D
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je sub_1000EE5B
    push push 010193728h
    push push 010193358h
    push push eax
    call sub_100F6E33
    mov mov edx, dword ptr [g_10764584]
    push push edx
    call sub_100F6D77
    add add esp, 16
    mov mov edx, dword ptr [esp + 48]
    mov mov eax, dword ptr [edi + 4]
    mov mov ecx, dword ptr [eax]
    push push edx
    push push eax
    call call dword ptr [ecx + 80]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_1000EE57
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 20
    ret ret
FUN_1000ec00 ENDP
END
