.686
.MODEL FLAT, C
EXTRN sub_10012B6F:PROC
EXTRN EXTRN fp_1010C07C:DWORD:DWORD
EXTRN EXTRN fp_1010C1D8:DWORD:DWORD
EXTRN EXTRN fp_1010C1E4:DWORD:DWORD
EXTRN EXTRN fp_101D49C8:DWORD:DWORD
.CODE
FUN_100129c0 PROC
    mov mov al, byte ptr [esi + 8]
    sub sub esp, 16
    test test al, al
    push push ebp
    push push edi
    je L0
    mov mov eax, dword ptr [esi + 4]
    mov mov ecx, dword ptr [esi + 24]
    mov mov edx, dword ptr [esi + 20]
    push push eax
    push push ecx
    push push edx
    push push 010193B9Ch
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 20
    mov mov edi, 8
    mov mov ebp, 080000000h
    jmp L1
    mov mov eax, dword ptr [esi + 16]
    mov mov ecx, dword ptr [esi + 12]
    mov mov edx, dword ptr [esi + 24]
    push push eax
    mov mov eax, dword ptr [esi + 20]
    push push ecx
    push push edx
    push push eax
    push push 010193B74h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 24
    xor xor edi, edi
    mov mov ebp, 0C80000h
    mov mov ecx, dword ptr [esi + 20]
    mov mov edx, dword ptr [esi + 24]
    push push edi
    push push 0
    push push ebp
    lea lea eax, [esp + 20]
    push push eax
    mov mov dword ptr [esp + 24], 0
    mov mov dword ptr [esp + 32], ecx
    mov mov dword ptr [esp + 28], 0
    mov mov dword ptr [esp + 36], edx
    call dword ptr [fp_1010C1E4]
    push push 0
    call dword ptr [fp_1010C07C]
    mov mov ecx, dword ptr [esp + 20]
    mov mov edx, dword ptr [esp + 16]
    push push 0
    push push eax
    mov mov eax, dword ptr [esp + 20]
    push push 0
    push push 0
    sub sub ecx, eax
    mov mov eax, dword ptr [esi + 16]
    push push ecx
    sub sub edx, dword ptr [esp + 28]
    mov mov ecx, dword ptr [esi + 12]
    push push edx
    push push eax
    push push ecx
    push push ebp
    push push 010193B58h
    push push 010193B50h
    push push edi
    call dword ptr [fp_1010C1D8]
    test test eax, eax
    pop pop edi
    mov mov dword ptr [esi], eax
    pop pop ebp
    jne sub_10012B6F
    push push 010193B34h
    push push eax
    call dword ptr [fp_101D49C8]
    add add esp, 8
    xor xor al, al
    add add esp, 16
    ret ret
    push push 010193B10h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 8
    mov mov al, 1
    add add esp, 16
    ret ret
FUN_100129c0 ENDP
END
