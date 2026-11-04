.686
.MODEL FLAT, C
EXTRN sub_10064CAB:PROC
EXTRN sub_10064D3D:PROC
EXTRN sub_100651ED:PROC
EXTRN sub_10067D97:PROC
.CODE
FUN_100652c0 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    push dword ptr [edi]
    mov esi, ecx
    mov dword ptr [ebp - 4], esi
    call sub_10064CAB
    lea esi, [esi + eax*4 + 108]
    cmp dword ptr [esi], 0
    je L8
    push ebx
L0:
    mov ecx, dword ptr [esi]
    mov eax, dword ptr [ecx]
    mov edi, dword ptr [edi]
L1:
    mov bl, byte ptr [edi]
    mov dl, bl
    cmp bl, byte ptr [eax]
    jne L3
    test dl, dl
    je L2
    mov bl, byte ptr [edi + 1]
    mov dl, bl
    cmp bl, byte ptr [eax + 1]
    jne L3
    inc edi
    inc edi
    inc eax
    inc eax
    test dl, dl
    jne L1
L2:
    xor eax, eax
    jmp L4
L3:
    sbb eax, eax
    sbb eax, -1
L4:
    test eax, eax
    mov edi, dword ptr [ebp + 8]
    jl L7
    je L5
    lea esi, [ecx + 12]
    cmp dword ptr [esi], 0
    jne L0
    jmp L7
L5:
    mov ebx, dword ptr [ebp - 4]
    push edi
    push dword ptr [esi]
    mov ecx, ebx
    call sub_10064D3D
    test eax, eax
    jne L6
    push dword ptr [edi]
    lea eax, [ebx + 000000278h]
    push 01010C770h
    push 0000005EFh
    push eax
    add ebx, 24
    push ebx
    call sub_10067D97
    add esp, 20
L6:
    mov ecx, dword ptr [esi]
    mov eax, dword ptr [ecx + 12]
    mov dword ptr [esi], eax
    and dword ptr [ecx + 12], 0
    push 1
    call sub_100651ED
L7:
    pop ebx
L8:
    mov eax, dword ptr [esi]
    mov dword ptr [edi + 12], eax
    mov dword ptr [esi], edi
    pop edi
    xor eax, eax
    pop esi
    leave
    ret 4
FUN_100652c0 ENDP
END
