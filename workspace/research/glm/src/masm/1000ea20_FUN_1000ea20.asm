.686
.MODEL FLAT, C
EXTRN sub_1000E9B2:PROC
EXTRN sub_1000EA83:PROC
EXTRN sub_100F6CB3:PROC
EXTRN sub_100F6D28:PROC
EXTRN sub_100F6D6F:PROC
EXTRN sub_100F6D83:PROC
EXTRN sub_100F6DE5:PROC
EXTRN sub_100F6DF9:PROC
EXTRN sub_100F6E40:PROC
EXTRN sub_100F6EB5:PROC
EXTRN g_101CE7EC:DWORD
EXTRN g_10764584:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_1000ea20 PROC
    sub esp, 12
    movzx eax, word ptr [esi + 24]
    movzx edx, di
    mov cl, dl
    shr eax, cl
    push ebp
    mov ebp, 1
    mov ecx, ebp
    sub ecx, eax
    mov dword ptr [esp + 4], ebp
    jns L0
    mov dword ptr [esp + 4], eax
L0:
    movzx eax, word ptr [esi + 26]
    mov cl, dl
    shr eax, cl
    mov edx, ebp
    sub edx, eax
    jns L1
    mov ebp, eax
L1:
    cmp dword ptr [esi], 3
    jne L6
    jmp L2
    lea ecx, [ecx]
L2:
    mov eax, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L3
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L3
    push 010193854h
    push 010193358h
    push eax
    call sub_100F6D6F
    mov ecx, dword ptr [g_10764584]
    push ecx
    call sub_100F6CB3
    add esp, 16
L3:
    mov eax, dword ptr [esi + 4]
    mov edx, dword ptr [eax]
    push 0
    push 0
    lea ecx, [esp + 16]
    push ecx
    push edi
    push eax
    call dword ptr [edx + 0x4c]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L2
    mov edx, dword ptr [esp + 12]
    mov eax, dword ptr [esp + 8]
    mov ecx, dword ptr [esp + 24]
    push edx
    mov edx, dword ptr [esp + 8]
    push eax
    mov eax, dword ptr [esp + 28]
    push ecx
    push ebp
    call sub_1000E9B2
    add esp, 16
L4:
    mov edx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L5
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L5
    push 010193828h
    push 010193358h
    push eax
    call sub_100F6DE5
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100F6D28
    add esp, 16
L5:
    mov eax, dword ptr [esi + 4]
    mov ecx, dword ptr [eax]
    push edi
    push eax
    call dword ptr [ecx + 0x50]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L4
    pop ebp
    add esp, 12
    ret
    jmp L6
    lea esp, [esp]
    nop
L6:
    mov edx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L7
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L7
    push 0101937D8h
    push 010193358h
    push eax
    call sub_100F6E40
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100F6D83
    add esp, 16
L7:
    mov eax, dword ptr [esi + 4]
    mov ecx, dword ptr [eax]
    push 0
    push 0
    lea edx, [esp + 16]
    push edx
    push edi
    push ebx
    push eax
    call dword ptr [ecx + 0x4c]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L6
    mov eax, dword ptr [esp + 12]
    mov ecx, dword ptr [esp + 8]
    mov edx, dword ptr [esp + 24]
    push eax
    mov eax, dword ptr [esp + 24]
    push ecx
    push edx
    mov edx, dword ptr [esp + 16]
    push ebp
    call sub_1000EA83
    add esp, 16
    mov eax, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L8
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L8
    push 010193798h
    push 010193358h
    push eax
    call sub_100F6EB5
    mov ecx, dword ptr [g_10764584]
    push ecx
    call sub_100F6DF9
    add esp, 16
L8:
    mov eax, dword ptr [esi + 4]
    mov edx, dword ptr [eax]
    push edi
    push ebx
    push eax
    call dword ptr [edx + 0x50]
FUN_1000ea20 ENDP
END
