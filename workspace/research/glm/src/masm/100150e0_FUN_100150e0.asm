.686
.MODEL FLAT, C
EXTRN sub_10015109:PROC
EXTRN sub_10015111:PROC
EXTRN sub_10060B68:PROC
EXTRN sub_10060C7E:PROC
EXTRN fp_101D49D4:DWORD
EXTRN fp_101D4AFC:DWORD
EXTRN fp_101D4B00:DWORD
.CODE
FUN_100150e0 PROC
    push ecx
    push ebx
    push esi
    push edi
    push 0101942B4h
    call sub_10060C7E
    lea ecx, [esp + 16]
    push ecx
    push eax
    call dword ptr [fp_101D4AFC]
    add esp, 16
    test eax, eax
    jl L0
    jne L1
    mov edx, dword ptr [esp + 8]
    push edx
    call dword ptr [fp_101D4B00]
    add esp, 4
L0:
    xor eax, eax
    pop esi
    pop ebx
    pop ecx
    ret
L1:
    push 24
    call dword ptr [fp_101D49D4]
    mov esi, eax
    mov eax, edi
    add esp, 4
    lea edx, [eax + 1]
    lea esp, [esp]
L2:
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L2
    sub eax, edx
    inc eax
    push eax
    call dword ptr [fp_101D49D4]
    mov dword ptr [esi + 20], eax
    mov eax, dword ptr [esp + 12]
    movzx ecx, byte ptr [eax]
    add esp, 4
    lea ebx, [esi + 4]
    inc eax
    mov dword ptr [esi], ecx
    call sub_10015109
    lea ebx, [esi + 12]
    call sub_10015111
    mov ecx, dword ptr [esi + 20]
    mov eax, edi
L3:
    mov dl, byte ptr [eax]
    inc eax
    mov byte ptr [ecx], dl
    inc ecx
    test dl, dl
    jne L3
    mov eax, dword ptr [esi + 20]
    call sub_10060B68
    mov edx, dword ptr [esp + 8]
    push edx
    call dword ptr [fp_101D4B00]
    add esp, 4
    mov eax, esi
    pop esi
    pop ebx
    pop ecx
    ret
FUN_100150e0 ENDP
END
