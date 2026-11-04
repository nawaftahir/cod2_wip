; FUN_10086ca9 @ 0x10086ca9 — auto-synthesized
.CODE
FUN_10086ca9 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    cmp dword ptr [ebp + 0x14], 0
    push esi
    je L0
    mov edx, dword ptr [ebp + 8]
    mov eax, dword ptr [edx + 8]
    mov edx, dword ptr [edx + 0xc]
    push edi
    mov edi, dword ptr [ebp + 0x10]
    mov esi, dword ptr [eax + edi*4]
    add edx, edi
    cmp dword ptr [ebp + 0xc], 0
    mov eax, dword ptr [eax + edx*4]
    pop edi
    je L1
    cmp esi, eax
    jbe L2
    mov eax, esi
    jmp L2
    cmp esi, eax
    ja L2
    jmp L3
    mov eax, dword ptr [ebp + 8]
    mov edx, dword ptr [eax + 0xc]
    imul edx, dword ptr [ebp + 0xc]
    add edx, dword ptr [ebp + 0x10]
    mov eax, dword ptr [eax + 8]
    mov eax, dword ptr [eax + edx*4]
    mov ecx, dword ptr [ecx + 0x14]
    pop esi
    jmp L4
    mov eax, edx
    mov edx, dword ptr [ecx + eax*4]
    mov edx, dword ptr [edx + 0x30]
    cmp eax, edx
    jne L5
    pop ebp
    ret 0x10
FUN_10086ca9 ENDP
END