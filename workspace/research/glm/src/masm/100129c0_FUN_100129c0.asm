.686
.MODEL FLAT, C
EXTRN fp_1010C07C:DWORD
EXTRN fp_1010C1D8:DWORD
EXTRN fp_1010C1E4:DWORD
EXTRN fp_101D49C8:DWORD
.CODE
FUN_100129c0 PROC
    mov al, byte ptr [esi + 8]
    sub esp, 16
    test al, al
    push ebp
    push edi
    je L0
    mov eax, dword ptr [esi + 4]
    mov ecx, dword ptr [esi + 24]
    mov edx, dword ptr [esi + 20]
    push eax
    push ecx
    push edx
    push 010193B9Ch
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 20
    mov edi, 8
    mov ebp, 080000000h
    jmp L1
L0:
    mov eax, dword ptr [esi + 16]
    mov ecx, dword ptr [esi + 12]
    mov edx, dword ptr [esi + 24]
    push eax
    mov eax, dword ptr [esi + 20]
    push ecx
    push edx
    push eax
    push 010193B74h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 24
    xor edi, edi
    mov ebp, 000C80000h
L1:
    mov ecx, dword ptr [esi + 20]
    mov edx, dword ptr [esi + 24]
    push edi
    push 0
    push ebp
    lea eax, [esp + 20]
    push eax
    mov dword ptr [esp + 24], 0
    mov dword ptr [esp + 32], ecx
    mov dword ptr [esp + 28], 0
    mov dword ptr [esp + 36], edx
    call dword ptr [fp_1010C1E4]
    push 0
    call dword ptr [fp_1010C07C]
    mov ecx, dword ptr [esp + 20]
    mov edx, dword ptr [esp + 16]
    push 0
    push eax
    mov eax, dword ptr [esp + 20]
    push 0
    push 0
    sub ecx, eax
    mov eax, dword ptr [esi + 16]
    push ecx
    sub edx, dword ptr [esp + 28]
    mov ecx, dword ptr [esi + 12]
    push edx
    push eax
    push ecx
    push ebp
    push 010193B58h
    push 010193B50h
    push edi
    call dword ptr [fp_1010C1D8]
    test eax, eax
    pop edi
    mov dword ptr [esi], eax
    pop ebp
    jne L2
    push 010193B34h
    push eax
    call dword ptr [fp_101D49C8]
    add esp, 8
    xor al, al
    add esp, 16
    ret
L2:
    push 010193B10h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 8
    mov al, 1
    add esp, 16
    ret
FUN_100129c0 ENDP
END
