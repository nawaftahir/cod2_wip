.686
.MODEL FLAT, C
EXTRN sub_10063ACA:PROC
EXTRN sub_10067C6A:PROC
.CODE
FUN_100643fc PROC
    mov edi, edi
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 000000268h]
    mov ecx, dword ptr [eax + 56]
    test ecx, ecx
    jne L0
    push 01010C6DCh
    push 0000005E6h
    lea eax, [esi + 000000278h]
    push eax
    lea eax, [esi + 24]
    push eax
    call sub_10067C6A
    add esp, 16
    mov dword ptr [esi + 68], 1
    mov eax, 080004005h
    pop esi
    ret
L0:
    mov edx, dword ptr [ecx + 4]
    mov dword ptr [esi + 84], edx
    mov edx, dword ptr [ecx + 12]
    mov dword ptr [eax + 56], edx
    and dword ptr [ecx + 12], 0
    push 1
    call sub_10063ACA
    xor eax, eax
    pop esi
    ret
FUN_100643fc ENDP
END
