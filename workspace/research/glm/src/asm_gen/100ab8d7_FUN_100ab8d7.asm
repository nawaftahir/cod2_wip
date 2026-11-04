; FUN_100ab8d7 @ 0x100ab8d7 — auto-synthesized
    sub_1008b0f3 PROTO C
    sub_100a6e33 PROTO C
.CODE
FUN_100ab8d7 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    push esi
    mov esi, dword ptr [ebp + 8]
    mov eax, dword ptr [esi]
    push edi
    and eax, 0xfff00000
    push eax
    mov ebx, ecx
    call sub_100a6e33
    xor edi, edi
    test eax, eax
    je L0
    cmp dword ptr [esi + 0x14], edi
    je L1
    cmp dword ptr [ebp + 0xc], 1
    jb L2
    push 0x10117154
    push 0x1194
    push dword ptr [esi + 0x3c]
    push ebx
    call sub_1008b0f3
    add esp, 0x10
    xor eax, eax
    jmp L3
    inc dword ptr [ebp + 0xc]
    cmp dword ptr [esi + 0x14], edi
    jbe L1
    mov eax, dword ptr [esi + 0x18]
    push dword ptr [ebp + 0xc]
    mov ecx, dword ptr [ebx + 0x18]
    mov eax, dword ptr [eax + edi*4]
    push dword ptr [ecx + eax*4]
    mov ecx, ebx
    call L4
    test eax, eax
    je L5
    inc edi
    cmp edi, dword ptr [esi + 0x14]
    jb L6
    xor eax, eax
    inc eax
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 8
FUN_100ab8d7 ENDP
END