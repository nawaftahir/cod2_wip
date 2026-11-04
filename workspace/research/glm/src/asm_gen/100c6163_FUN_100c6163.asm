; FUN_100c6163 @ 0x100c6163 — auto-synthesized
    sub_100be1a7 PROTO C
    sub_100c5c31 PROTO C
.CODE
FUN_100c6163 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 0x100]
    push edi
    xor edi, edi
    cmp dword ptr [eax + 4], edi
    mov dword ptr [ebp - 4], edi
    jbe L0
    mov edx, dword ptr [esi + 0x14]
    mov ecx, dword ptr [eax + 8]
    mov edi, dword ptr [ecx]
    mov edi, dword ptr [edx + edi*4]
    mov ebx, dword ptr [edi + 4]
    mov edi, dword ptr [esi + 0x10]
    mov edi, dword ptr [edi + ebx*4]
    test byte ptr [edi + 5], 2
    jne L1
    inc dword ptr [ebp - 4]
    mov edi, dword ptr [esi + 0x100]
    mov ebx, dword ptr [ebp - 4]
    add ecx, 4
    cmp ebx, dword ptr [edi + 4]
    jb L2
    xor edi, edi
    push edi
    push edi
    mov ecx, 0x100000
    push ecx
    mov dword ptr [esi + 0x15c], edi
    push dword ptr [eax + 8]
    push edi
    push ecx
    mov ecx, esi
    call sub_100c5c31
    cmp eax, edi
    jl L3
    mov ecx, esi
    call sub_100be1a7
    pop edi
    pop esi
    pop ebx
    leave
    ret
    xor eax, eax
    inc eax
    jmp L3
FUN_100c6163 ENDP
END