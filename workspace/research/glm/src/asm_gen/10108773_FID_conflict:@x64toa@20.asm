; FID_conflict:@x64toa@20 @ 0x10108773 — auto-synthesized
    sub_10106bf3 PROTO C
.CODE
FID_conflict:@x64toa@20 PROC
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    push ebx
    mov ebx, dword ptr [ebp + 8]
    push esi
    xor ecx, ecx
    cmp dword ptr [ebp + 0x14], ecx
    mov esi, eax
    mov eax, dword ptr [ebp + 0xc]
    push edi
    je L0
    mov byte ptr [esi], 0x2d
    inc esi
    neg ebx
    adc eax, ecx
    neg eax
    mov edi, esi
    mov dword ptr [ebp + 0xc], ecx
    push dword ptr [ebp + 0xc]
    push dword ptr [ebp + 0x10]
    push eax
    push ebx
    call sub_10106bf3
    cmp ecx, 9
    mov dword ptr [ebp - 4], ebx
    mov ebx, eax
    mov eax, edx
    jbe L1
    add cl, 0x57
    jmp L2
    add cl, 0x30
    mov byte ptr [esi], cl
    inc esi
    test eax, eax
    ja L3
    jb L4
    test ebx, ebx
    ja L3
    mov byte ptr [esi], 0
    dec esi
    mov cl, byte ptr [edi]
    mov al, byte ptr [esi]
    mov byte ptr [esi], cl
    dec esi
    mov byte ptr [edi], al
    inc edi
    cmp edi, esi
    jb L5
    pop edi
    pop esi
    pop ebx
    leave
    ret 0x10
FID_conflict:@x64toa@20 ENDP
END