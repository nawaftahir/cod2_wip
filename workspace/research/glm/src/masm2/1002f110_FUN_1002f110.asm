.686
.MODEL FLAT, C
EXTRN sub_1002F285:PROC
EXTRN sub_1002F292:PROC
EXTRN sub_1002F297:PROC
EXTRN sub_1002F29B:PROC
EXTRN sub_100F6CA4:PROC
EXTRN sub_100F6D60:PROC
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_101D4824:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_1002f110 PROC
    sub sub esp, 36
    push push ebx
    mov mov ebx, dword ptr [esp + 60]
    push push esi
    push push edi
    push push 0
    lea lea edx, [esp + 20]
    push push edx
    push push 0
    push push 22
    mov mov edi, ecx
    push push edi
    mov mov esi, eax
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push ebx
    push push eax
    call call dword ptr [ecx + 090h]
    test test eax, eax
    jl sub_1002F285
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je L0
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je L1
    push push 010198078h
    push push 010193358h
    push push eax
    call sub_100F6D60
    mov mov ecx, dword ptr [g_10764584]
    push push ecx
    call sub_100F6CA4
    add add esp, 16
    mov mov eax, dword ptr [esp + 16]
    mov mov edx, dword ptr [eax]
    push push 02000h
    push push 0
    lea lea ecx, [esp + 32]
    push push ecx
    push push eax
    call call dword ptr [edx + 52]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne L2
    mov mov eax, dword ptr [esp + 28]
    push push ebp
    mov mov ebp, dword ptr [esp + 28]
    lea lea edx, [ebx*4]
    sub sub ebp, edx
    test test edi, edi
    jle sub_1002F297
    mov mov dword ptr [esp + 24], edi
    test test ebx, ebx
    jle sub_1002F292
L0:
    mov mov edi, ebx
    lea lea esp, [esp]
    mov mov bl, byte ptr [esi + 1]
    mov mov cl, byte ptr [esi + 3]
    mov mov dl, byte ptr [esi + 2]
    mov mov byte ptr [esp + 16], bl
    mov mov bl, byte ptr [esi]
    mov mov byte ptr [eax + 2], bl
    mov mov bl, byte ptr [esp + 16]
    mov mov byte ptr [eax + 1], bl
    mov mov byte ptr [eax], dl
    mov mov byte ptr [eax + 3], cl
    add add esi, 4
    add add eax, 4
    dec dec edi
    jne sub_1002F297
    mov mov ebx, dword ptr [esp + 72]
    mov mov ecx, dword ptr [esp + 24]
    add add eax, ebp
    dec dec ecx
    mov mov dword ptr [esp + 24], ecx
    jne sub_1002F29B
    mov mov eax, dword ptr [esp + 20]
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 56]
    mov mov ecx, dword ptr [esp + 56]
    mov mov edx, dword ptr [esp + 64]
    mov mov eax, dword ptr [esp + 60]
    mov mov dword ptr [esp + 36], ecx
    add add ecx, edx
    mov mov dword ptr [esp + 44], ecx
    mov mov ecx, dword ptr [esp + 68]
    mov mov dword ptr [esp + 40], eax
    add add eax, ecx
    push push 2
    lea lea ecx, [esp + 40]
    push push ecx
    mov mov ecx, dword ptr [g_101D4824]
    push push ecx
    mov mov ecx, dword ptr [esp + 32]
    push push 0
    mov mov dword ptr [esp + 64], eax
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov edx, dword ptr [eax]
    push push ecx
    push push eax
    call call dword ptr [edx + 088h]
    mov mov eax, dword ptr [esp + 20]
    mov mov edx, dword ptr [eax]
    push push eax
    call call dword ptr [edx + 8]
    pop pop ebp
    pop pop edi
    pop pop esi
    pop pop ebx
    add add esp, 36
    ret ret
FUN_1002f110 ENDP
END
