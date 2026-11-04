.686
.MODEL FLAT, C
EXTRN sub_100F6CA4:PROC
EXTRN sub_100F6D60:PROC
EXTRN g_101CE7EC:DWORD
EXTRN g_101D1BF8:DWORD
EXTRN g_101D4824:DWORD
EXTRN g_10764584:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_1002f110 PROC
    sub esp, 36
    push ebx
    mov ebx, dword ptr [esp + 60]
    push esi
    push edi
    push 0
    lea edx, [esp + 20]
    push edx
    push 0
    push 22
    mov edi, ecx
    push edi
    mov esi, eax
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push ebx
    push eax
    call dword ptr [ecx + 0x90]
    test eax, eax
    jl L6
L0:
    mov eax, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L1
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L1
    push 010198078h
    push 010193358h
    push eax
    call sub_100F6D60
    mov ecx, dword ptr [g_10764584]
    push ecx
    call sub_100F6CA4
    add esp, 16
L1:
    mov eax, dword ptr [esp + 16]
    mov edx, dword ptr [eax]
    push 000002000h
    push 0
    lea ecx, [esp + 32]
    push ecx
    push eax
    call dword ptr [edx + 0x34]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L0
    mov eax, dword ptr [esp + 28]
    push ebp
    mov ebp, dword ptr [esp + 28]
    lea edx, [ebx*4]
    sub ebp, edx
    test edi, edi
    jle L5
    mov dword ptr [esp + 24], edi
L2:
    test ebx, ebx
    jle L4
    mov edi, ebx
    lea esp, [esp]
L3:
    mov bl, byte ptr [esi + 1]
    mov cl, byte ptr [esi + 3]
    mov dl, byte ptr [esi + 2]
    mov byte ptr [esp + 16], bl
    mov bl, byte ptr [esi]
    mov byte ptr [eax + 2], bl
    mov bl, byte ptr [esp + 16]
    mov byte ptr [eax + 1], bl
    mov byte ptr [eax], dl
    mov byte ptr [eax + 3], cl
    add esi, 4
    add eax, 4
    dec edi
    jne L3
    mov ebx, dword ptr [esp + 72]
L4:
    mov ecx, dword ptr [esp + 24]
    add eax, ebp
    dec ecx
    mov dword ptr [esp + 24], ecx
    jne L2
L5:
    mov eax, dword ptr [esp + 20]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 0x38]
    mov ecx, dword ptr [esp + 56]
    mov edx, dword ptr [esp + 64]
    mov eax, dword ptr [esp + 60]
    mov dword ptr [esp + 36], ecx
    add ecx, edx
    mov dword ptr [esp + 44], ecx
    mov ecx, dword ptr [esp + 68]
    mov dword ptr [esp + 40], eax
    add eax, ecx
    push 2
    lea ecx, [esp + 40]
    push ecx
    mov ecx, dword ptr [g_101D4824]
    push ecx
    mov ecx, dword ptr [esp + 32]
    push 0
    mov dword ptr [esp + 64], eax
    mov eax, dword ptr [g_101D1BF8]
    mov edx, dword ptr [eax]
    push ecx
    push eax
    call dword ptr [edx + 0x88]
    mov eax, dword ptr [esp + 20]
    mov edx, dword ptr [eax]
    push eax
    call dword ptr [edx + 8]
    pop ebp
L6:
    pop edi
    pop esi
    pop ebx
    add esp, 36
    ret
FUN_1002f110 ENDP
END
