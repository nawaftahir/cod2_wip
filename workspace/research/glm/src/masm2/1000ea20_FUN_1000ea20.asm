.686
.MODEL FLAT, C
EXTRN sub_1000E9B2:PROC
EXTRN sub_1000EC38:PROC
EXTRN sub_1000EC86:PROC
EXTRN sub_1000EC94:PROC
EXTRN sub_1000EC96:PROC
EXTRN sub_1000ED71:PROC
EXTRN sub_1000ED7F:PROC
EXTRN sub_100F6CB3:PROC
EXTRN sub_100F6D28:PROC
EXTRN sub_100F6D6F:PROC
EXTRN sub_100F6D83:PROC
EXTRN sub_100F6DE5:PROC
EXTRN sub_100F6DF9:PROC
EXTRN sub_100F6E40:PROC
EXTRN sub_100F6EB5:PROC
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_1000ea20 PROC
    sub sub esp, 12
    movzx movzx eax, word ptr [esi + 24]
    movzx movzx edx, di
    mov mov cl, dl
    shr shr eax, cl
    push push ebp
    mov mov ebp, 1
    mov mov ecx, ebp
    sub sub ecx, eax
    mov mov dword ptr [esp + 4], ebp
    jns L0
    mov mov dword ptr [esp + 4], eax
    movzx movzx eax, word ptr [esi + 26]
    mov mov cl, dl
    shr shr eax, cl
    mov mov edx, ebp
    sub sub edx, eax
    jns L1
    mov mov ebp, eax
    cmp cmp dword ptr [esi], 3
    jne L7
    jmp L3
    lea lea ecx, [ecx]
L0:
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je L4
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je L5
    push push 010193854h
    push push 010193358h
    push push eax
    call sub_100F6D6F
    mov mov ecx, dword ptr [g_10764584]
    push push ecx
    call sub_100F6CB3
    add add esp, 16
    mov mov eax, dword ptr [esi + 4]
    mov mov edx, dword ptr [eax]
    push push 0
    push push 0
    lea lea ecx, [esp + 16]
    push push ecx
    push push edi
    push push eax
    call call dword ptr [edx + 76]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne L6
    mov mov edx, dword ptr [esp + 12]
    mov mov eax, dword ptr [esp + 8]
    mov mov ecx, dword ptr [esp + 24]
    push push edx
    mov mov edx, dword ptr [esp + 8]
    push push eax
    mov mov eax, dword ptr [esp + 28]
    push push ecx
    push push ebp
    call sub_1000E9B2
    add add esp, 16
    mov mov edx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [edx + 8]
    test test eax, eax
    je L8
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je L10
    push push 010193828h
L6:
    push push 010193358h
    push push eax
    call sub_100F6DE5
    mov mov eax, dword ptr [g_10764584]
    push push eax
    call sub_100F6D28
    add add esp, 16
    mov mov eax, dword ptr [esi + 4]
    mov mov ecx, dword ptr [eax]
    push push edi
    push push eax
    call call dword ptr [ecx + 80]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne L9
    pop pop ebp
    add add esp, 12
    ret ret
    jmp sub_1000EC38
    lea lea esp, [esp]
    nop nop
    mov mov edx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [edx + 8]
    test test eax, eax
    je sub_1000EC86
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je sub_1000EC94
    push push 0101937D8h
    push push 010193358h
    push push eax
    call sub_100F6E40
    mov mov eax, dword ptr [g_10764584]
    push push eax
    call sub_100F6D83
    add add esp, 16
    mov mov eax, dword ptr [esi + 4]
    mov mov ecx, dword ptr [eax]
    push push 0
    push push 0
    lea lea edx, [esp + 16]
    push push edx
    push push edi
    push push ebx
    push push eax
    call call dword ptr [ecx + 76]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_1000EC96
    mov mov eax, dword ptr [esp + 12]
    mov mov ecx, dword ptr [esp + 8]
    mov mov edx, dword ptr [esp + 24]
    push push eax
    mov mov eax, dword ptr [esp + 24]
    push push ecx
    push push edx
    mov mov edx, dword ptr [esp + 16]
    push push ebp
    call L2
    add add esp, 16
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je sub_1000ED71
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je sub_1000ED7F
    push push 010193798h
    push push 010193358h
    push push eax
    call sub_100F6EB5
L8:
    mov mov ecx, dword ptr [g_10764584]
L9:
    push push ecx
    call sub_100F6DF9
    add add esp, 16
    mov mov eax, dword ptr [esi + 4]
    mov mov edx, dword ptr [eax]
    push push edi
    push push ebx
    push push eax
    call call dword ptr [edx + 80]
FUN_1000ea20 ENDP
END
