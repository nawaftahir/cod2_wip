; FUN_100ba089 @ 0x100ba089 — auto-synthesized
.CODE
FUN_100ba089 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    mov ebx, dword ptr [ebp + 0x10]
    push esi
    mov esi, dword ptr [ebp + 0xc]
    cmp dword ptr [esi + 0x24], ebx
    mov dword ptr [ebp - 4], ecx
    je L0
    push edi
    xor edi, edi
    cmp dword ptr [esi + 0x1c], edi
    mov dword ptr [esi + 0x24], ebx
    jbe L1
    mov eax, dword ptr [esi + 0x20]
    mov ecx, dword ptr [eax + edi*4]
    mov eax, dword ptr [ebp + 8]
    push ebx
    push dword ptr [eax + ecx*4]
    mov ecx, dword ptr [ebp - 4]
    push eax
    call L2
    inc edi
    cmp edi, dword ptr [esi + 0x1c]
    jb L3
    pop edi
    pop esi
    xor eax, eax
    pop ebx
    leave
    ret 0xc
FUN_100ba089 ENDP
END