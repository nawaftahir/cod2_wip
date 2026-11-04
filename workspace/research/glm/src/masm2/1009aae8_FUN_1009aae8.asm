.686
.MODEL FLAT, C
EXTRN sub_10099599:PROC
EXTRN sub_10099707:PROC
EXTRN sub_1009AB85:PROC
EXTRN sub_1009AB8B:PROC
EXTRN sub_1009AB97:PROC
EXTRN sub_1009AB9E:PROC
EXTRN sub_1009ABA4:PROC
EXTRN sub_1009ABD8:PROC
.CODE
FUN_1009aae8 PROC
    mov mov edi, edi
    push push esi
    mov mov esi, ecx
    mov mov eax, dword ptr [esi + 16]
    test test eax, eax
    jne L0
    push push 0101149B4h
    push push eax
    push push eax
    push push esi
    call sub_10099599
    add add esp, 16
    mov mov eax, 080004005h
    pop pop esi
    ret ret
    cmp cmp dword ptr [eax + 16], 4
    push push edi
    jne sub_1009AB97
    mov mov ecx, dword ptr [eax + 32]
    test test ecx, ecx
L0:
    je sub_1009AB9E
    cmp cmp dword ptr [ecx + 16], 4
    je sub_1009ABA4
    lea lea edi, [eax + 24]
    jmp sub_1009AB85
    mov mov eax, dword ptr [eax + 8]
    mov mov dword ptr [eax + 44], 1
    mov mov eax, dword ptr [edi]
    push push dword ptr [eax + 8]
    mov mov eax, dword ptr [esi + 16]
    push push dword ptr [eax + 32]
    mov mov ecx, esi
    call sub_10099707
    test test eax, eax
    jl sub_1009ABD8
    mov mov edi, dword ptr [edi]
    add add edi, 12
    mov mov eax, dword ptr [edi]
    test test eax, eax
    jne sub_1009AB8B
    mov mov eax, dword ptr [esi + 16]
    mov mov eax, dword ptr [eax + 32]
    mov mov eax, dword ptr [eax + 24]
    mov mov dword ptr [edi], eax
    mov mov eax, dword ptr [esi + 16]
    mov mov ecx, dword ptr [eax + 32]
    mov mov eax, dword ptr [eax + 24]
    mov mov dword ptr [ecx + 24], eax
    mov mov eax, dword ptr [esi + 16]
    and and dword ptr [eax + 24], 0
    mov mov eax, dword ptr [esi + 16]
    mov mov ecx, dword ptr [eax + 32]
    mov mov dword ptr [esi + 16], ecx
    and and dword ptr [eax + 32], 0
    xor xor eax, eax
    pop pop edi
    pop pop esi
    ret ret
FUN_1009aae8 ENDP
END
