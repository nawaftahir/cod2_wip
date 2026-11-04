; FUN_100cbab5 @ 0x100cbab5 — auto-synthesized
.CODE
FUN_100cbab5 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov edx, dword ptr [ebp + 8]
    mov eax, dword ptr [ebp + 0xc]
    push esi
    mov esi, dword ptr [ecx + 4]
    mov esi, dword ptr [esi + 0x14]
    mov eax, dword ptr [esi + eax*4]
    cmp dword ptr [eax + 0x74], edx
    jne L0
    mov esi, dword ptr [ecx + 0x28]
    lea esi, [esi + edx*4]
    inc dword ptr [esi]
    cmp dword ptr [eax + 0x54], 0
    je L1
    mov dword ptr [eax + 0x74], edx
    mov esi, dword ptr [ecx + 0x28]
    lea esi, [esi + edx*4]
    dec dword ptr [esi]
    mov eax, dword ptr [eax + 8]
    cmp eax, -1
    jne L2
    pop esi
    pop ebp
    ret 8
FUN_100cbab5 ENDP
END