.686
.MODEL FLAT, C
EXTRN sub_10063ACA:PROC
EXTRN sub_10067C6A:PROC
.CODE
FUN_100643fc PROC
    mov mov edi, edi
    push push esi
    mov mov esi, ecx
    mov mov eax, dword ptr [esi + 0268h]
    mov mov ecx, dword ptr [eax + 56]
    test test ecx, ecx
    jne L0
    push push 01010C6DCh
    push push 05E6h
    lea lea eax, [esi + 0278h]
    push push eax
    lea lea eax, [esi + 24]
    push push eax
    call sub_10067C6A
    add add esp, 16
    mov mov dword ptr [esi + 68], 1
    mov mov eax, 080004005h
    pop pop esi
    ret ret
    mov mov edx, dword ptr [ecx + 4]
    mov mov dword ptr [esi + 84], edx
    mov mov edx, dword ptr [ecx + 12]
    mov mov dword ptr [eax + 56], edx
    and and dword ptr [ecx + 12], 0
    push push 1
L0:
    call sub_10063ACA
    xor xor eax, eax
    pop pop esi
    ret ret
FUN_100643fc ENDP
END
