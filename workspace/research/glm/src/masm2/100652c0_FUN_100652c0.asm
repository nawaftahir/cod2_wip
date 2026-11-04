.686
.MODEL FLAT, C
EXTRN sub_10064CAB:PROC
EXTRN sub_10064D3D:PROC
EXTRN sub_100651ED:PROC
EXTRN sub_10065380:PROC
EXTRN sub_1006538C:PROC
EXTRN sub_100653C0:PROC
EXTRN sub_100653CB:PROC
EXTRN sub_100653CC:PROC
EXTRN sub_10067D97:PROC
.CODE
FUN_100652c0 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push esi
    push push edi
    mov mov edi, dword ptr [ebp + 8]
    push push dword ptr [edi]
    mov mov esi, ecx
    mov mov dword ptr [ebp - 4], esi
    call sub_10064CAB
    lea lea esi, [esi + eax*4 + 108]
    cmp cmp dword ptr [esi], 0
    je sub_1006538C
    push push ebx
    mov mov ecx, dword ptr [esi]
    mov mov eax, dword ptr [ecx]
    mov mov edi, dword ptr [edi]
    mov mov bl, byte ptr [edi]
    mov mov dl, bl
    cmp cmp bl, byte ptr [eax]
    jne L1
    test test dl, dl
    je L1
    mov mov bl, byte ptr [edi + 1]
    mov mov dl, bl
    cmp cmp bl, byte ptr [eax + 1]
    jne L3
    inc inc edi
    inc inc edi
    inc inc eax
    inc inc eax
    test test dl, dl
    jne L0
    xor xor eax, eax
    jmp L4
    sbb sbb eax, eax
    sbb sbb eax, -1
    test test eax, eax
    mov mov edi, dword ptr [ebp + 8]
    jl sub_100653C0
    je sub_10065380
    lea lea esi, [ecx + 12]
    cmp cmp dword ptr [esi], 0
    jne L2
    jmp sub_100653CC
    mov mov ebx, dword ptr [ebp - 4]
    push push edi
    push push dword ptr [esi]
    mov mov ecx, ebx
    call sub_10064D3D
    test test eax, eax
L0:
    jne sub_100653CB
    push push dword ptr [edi]
    lea lea eax, [ebx + 0278h]
    push push 01010C770h
    push push 05EFh
L2:
    push push eax
    add add ebx, 24
    push push ebx
    call sub_10067D97
    add add esp, 20
    mov mov ecx, dword ptr [esi]
    mov mov eax, dword ptr [ecx + 12]
    mov mov dword ptr [esi], eax
    and and dword ptr [ecx + 12], 0
    push push 1
    call sub_100651ED
    pop pop ebx
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [edi + 12], eax
    mov mov dword ptr [esi], edi
    pop pop edi
    xor xor eax, eax
    pop pop esi
    leave leave
    ret ret 4
FUN_100652c0 ENDP
END
