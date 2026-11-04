; FUN_100cc1bb @ 0x100cc1bb — auto-synthesized
    sub_10086963 PROTO C
    sub_100cbc1f PROTO C
    sub_100cbd80 PROTO C
.CODE
FUN_100cc1bb PROC
    mov edi, edi
    push esi
    mov esi, ecx
    push edi
    lea eax, [esi + 0x4c]
    push eax
    lea eax, [esi + 0x50]
    push eax
    call sub_100cbc1f
    xor eax, eax
    cmp dword ptr [esi + 0x38], eax
    jbe L0
    mov ecx, dword ptr [esi + 0x30]
    mov dword ptr [ecx + eax*4], eax
    mov ecx, dword ptr [esi + 0x3c]
    mov ecx, dword ptr [ecx + eax*4]
    mov edx, dword ptr [esi + 0x40]
    mov dword ptr [edx + eax*4], ecx
    inc eax
    cmp eax, dword ptr [esi + 0x38]
    jb L1
    push esi
    push dword ptr [esi + 0x38]
    push dword ptr [esi + 0x30]
    push 0x100cbb65
    call sub_10086963
    xor edi, edi
    cmp dword ptr [esi + 0x38], edi
    jbe L2
    mov eax, dword ptr [esi + 0x30]
    push dword ptr [eax + edi*4]
    mov ecx, esi
    call sub_100cbd80
    test eax, eax
    jl L3
    je L4
    inc edi
    cmp edi, dword ptr [esi + 0x38]
    jb L5
    xor eax, eax
    inc eax
    pop edi
    pop esi
    ret
    xor eax, eax
    jmp L3
FUN_100cc1bb ENDP
END