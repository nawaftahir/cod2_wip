; __fptostr @ 0x1010837e — auto-synthesized
    sub_100f680f PROTO C
    sub_100fa266 PROTO C
.CODE
__fptostr PROC
    push ebp
    mov ebp, esp
    mov edx, dword ptr [ebp + 0x10]
    mov ecx, dword ptr [edx + 0xc]
    push ebx
    mov ebx, dword ptr [ebp + 0xc]
    test ebx, ebx
    push esi
    mov esi, dword ptr [ebp + 8]
    push edi
    lea edi, [esi + 1]
    mov byte ptr [esi], 0x30
    mov eax, edi
    jle L0
    mov dword ptr [ebp + 8], ebx
    xor ebx, ebx
    mov dl, byte ptr [ecx]
    test dl, dl
    je L1
    movsx edx, dl
    inc ecx
    jmp L2
    push 0x30
    pop edx
    mov byte ptr [eax], dl
    inc eax
    dec dword ptr [ebp + 8]
    jne L3
    mov edx, dword ptr [ebp + 0x10]
    test ebx, ebx
    mov byte ptr [eax], 0
    jl L4
    cmp byte ptr [ecx], 0x35
    jl L4
    jmp L5
    mov byte ptr [eax], 0x30
    dec eax
    cmp byte ptr [eax], 0x39
    je L6
    inc byte ptr [eax]
    cmp byte ptr [esi], 0x31
    jne L7
    inc dword ptr [edx + 4]
    jmp L8
    push edi
    call sub_100fa266
    inc eax
    push eax
    push edi
    push esi
    call sub_100f680f
    add esp, 0x10
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret
__fptostr ENDP
END