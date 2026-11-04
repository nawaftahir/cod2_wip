; FUN_100652c0 @ 0x100652c0 — auto-synthesized
    sub_10064cab PROTO C
    sub_10064d3d PROTO C
    sub_100651ed PROTO C
    sub_10067d97 PROTO C
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
    call sub_10064cab
    lea esi, [esi + eax*4 + 0x6c]
    cmp dword ptr [esi], 0
    je L0
    push ebx
    mov ecx, dword ptr [esi]
    mov eax, dword ptr [ecx]
    mov edi, dword ptr [edi]
    mov bl, byte ptr [edi]
    mov dl, bl
    cmp bl, byte ptr [eax]
    jne L1
    test dl, dl
    je L2
    mov bl, byte ptr [edi + 1]
    mov dl, bl
    cmp bl, byte ptr [eax + 1]
    jne L1
    inc edi
    inc edi
    inc eax
    inc eax
    test dl, dl
    jne L3
    xor eax, eax
    jmp L4
    sbb eax, eax
    sbb eax, -1
    test eax, eax
    mov edi, dword ptr [ebp + 8]
    jl L5
    je L6
    lea esi, [ecx + 0xc]
    cmp dword ptr [esi], 0
    jne L7
    jmp L5
    mov ebx, dword ptr [ebp - 4]
    push edi
    push dword ptr [esi]
    mov ecx, ebx
    call sub_10064d3d
    test eax, eax
    jne L8
    push dword ptr [edi]
    lea eax, [ebx + 0x278]
    push 0x1010c770
    push 0x5ef
    push eax
    add ebx, 0x18
    push ebx
    call sub_10067d97
    add esp, 0x14
    mov ecx, dword ptr [esi]
    mov eax, dword ptr [ecx + 0xc]
    mov dword ptr [esi], eax
    and dword ptr [ecx + 0xc], 0
    push 1
    call sub_100651ed
    pop ebx
    mov eax, dword ptr [esi]
    mov dword ptr [edi + 0xc], eax
    mov dword ptr [esi], edi
    pop edi
    xor eax, eax
    pop esi
    leave
    ret 4
FUN_100652c0 ENDP
END