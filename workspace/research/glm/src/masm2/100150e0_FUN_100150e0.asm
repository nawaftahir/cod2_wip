.686
.MODEL FLAT, C
EXTRN sub_100151F6:PROC
EXTRN sub_10060B68:PROC
EXTRN sub_10060C7E:PROC
EXTRN EXTRN fp_101D49D4:DWORD:DWORD
EXTRN EXTRN fp_101D4AFC:DWORD:DWORD
EXTRN EXTRN fp_101D4B00:DWORD:DWORD
.CODE
FUN_100150e0 PROC
    push push ecx
    push push ebx
    push push esi
    push push edi
    push push 0101942B4h
    call sub_10060C7E
    lea lea ecx, [esp + 16]
    push push ecx
    push push eax
    call dword ptr [fp_101D4AFC]
    add add esp, 16
    test test eax, eax
    jl L2
    jne L3
    mov mov edx, dword ptr [esp + 8]
    push push edx
    call dword ptr [fp_101D4B00]
    add add esp, 4
L1:
    xor xor eax, eax
    pop pop esi
    pop pop ebx
    pop pop ecx
    ret ret
    push push 24
    call dword ptr [fp_101D49D4]
    mov mov esi, eax
    mov mov eax, edi
    add add esp, 4
    lea lea edx, [eax + 1]
    lea lea esp, [esp]
    mov mov cl, byte ptr [eax]
L2:
    inc inc eax
    test test cl, cl
    jne L4
    sub sub eax, edx
    inc inc eax
L3:
    push push eax
    call dword ptr [fp_101D49D4]
    mov mov dword ptr [esi + 20], eax
    mov mov eax, dword ptr [esp + 12]
    movzx movzx ecx, byte ptr [eax]
    add add esp, 4
    lea lea ebx, [esi + 4]
    inc inc eax
    mov mov dword ptr [esi], ecx
    call L0
    lea lea ebx, [esi + 12]
    call L1
    mov mov ecx, dword ptr [esi + 20]
    mov mov eax, edi
    mov mov dl, byte ptr [eax]
    inc inc eax
    mov mov byte ptr [ecx], dl
    inc inc ecx
    test test dl, dl
    jne sub_100151F6
    mov mov eax, dword ptr [esi + 20]
    call sub_10060B68
    mov mov edx, dword ptr [esp + 8]
    push push edx
    call dword ptr [fp_101D4B00]
    add add esp, 4
    mov mov eax, esi
    pop pop esi
    pop pop ebx
    pop pop ecx
    ret ret
FUN_100150e0 ENDP
END
