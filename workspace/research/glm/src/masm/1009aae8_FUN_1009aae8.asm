.686
.MODEL FLAT, C
EXTRN sub_10099599:PROC
EXTRN sub_10099707:PROC
.CODE
FUN_1009aae8 PROC
    mov edi, edi
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 16]
    test eax, eax
    jne L0
    push 0101149B4h
    push eax
    push eax
    push esi
    call sub_10099599
    add esp, 16
    mov eax, 080004005h
    pop esi
    ret
L0:
    cmp dword ptr [eax + 16], 4
    push edi
    jne L3
    mov ecx, dword ptr [eax + 32]
    test ecx, ecx
    je L3
    cmp dword ptr [ecx + 16], 4
    je L3
    lea edi, [eax + 24]
    jmp L2
L1:
    mov eax, dword ptr [eax + 8]
    mov dword ptr [eax + 44], 1
    mov eax, dword ptr [edi]
    push dword ptr [eax + 8]
    mov eax, dword ptr [esi + 16]
    push dword ptr [eax + 32]
    mov ecx, esi
    call sub_10099707
    test eax, eax
    jl L4
    mov edi, dword ptr [edi]
    add edi, 12
L2:
    mov eax, dword ptr [edi]
    test eax, eax
    jne L1
    mov eax, dword ptr [esi + 16]
    mov eax, dword ptr [eax + 32]
    mov eax, dword ptr [eax + 24]
    mov dword ptr [edi], eax
    mov eax, dword ptr [esi + 16]
    mov ecx, dword ptr [eax + 32]
    mov eax, dword ptr [eax + 24]
    mov dword ptr [ecx + 24], eax
    mov eax, dword ptr [esi + 16]
    and dword ptr [eax + 24], 0
L3:
    mov eax, dword ptr [esi + 16]
    mov ecx, dword ptr [eax + 32]
    mov dword ptr [esi + 16], ecx
    and dword ptr [eax + 32], 0
    xor eax, eax
L4:
    pop edi
    pop esi
    ret
FUN_1009aae8 ENDP
END
