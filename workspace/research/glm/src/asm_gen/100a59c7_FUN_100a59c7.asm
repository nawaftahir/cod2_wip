; FUN_100a59c7 @ 0x100a59c7 — auto-synthesized
    sub_1008b070 PROTO C
    sub_100c513f PROTO C
    sub_100f78f1 PROTO C
.CODE
FUN_100a59c7 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    mov eax, dword ptr [edi + 4]
    mov esi, ecx
    cmp eax, dword ptr [esi + 0x80]
    je L0
    cmp eax, dword ptr [esi + 0x84]
    jne L1
    push dword ptr [edi + 0x6c]
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x54]
    push eax
    push 0x101a3c68
    mov ecx, esi
    call sub_100c513f
    mov ebx, eax
    cmp dword ptr [ebx + 0x10], -1
    jne L2
    push dword ptr [ebp + 0x10]
    mov ecx, esi
    push dword ptr [ebp + 0xc]
    push edi
    call sub_1008b070
    jmp L3
    push dword ptr [edi + 0x6c]
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x58]
    mov ecx, dword ptr [esi + 0x10]
    mov esi, dword ptr [ebp + 0x10]
    push eax
    push dword ptr [ebx]
    mov eax, dword ptr [edi + 4]
    mov eax, dword ptr [ecx + eax*4]
    push dword ptr [eax]
    mov edi, dword ptr [ebp + 0xc]
    push 0x10114770
    push esi
    push edi
    call sub_100f78f1
    add esp, 0x18
    mov byte ptr [edi + esi - 1], 0
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 0xc
FUN_100a59c7 ENDP
END