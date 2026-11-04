; FUN_10036320 @ 0x10036320 — auto-synthesized
    EXTRN g_101ce758:DWORD
    EXTRN g_101d1b9c:DWORD
    sub_10035fe5 PROTO C
    sub_10036158 PROTO C
.CODE
FUN_10036320 PROC
    push ecx
    mov eax, dword ptr [g_101d1b9c]
    test eax, eax
    je L0
    mov eax, dword ptr [g_101ce758]
    mov cl, byte ptr [eax + 8]
    test cl, cl
    jne L1
    cmp dword ptr [esi], 0
    jne L2
    xor al, al
    pop ecx
    ret
    mov eax, dword ptr [esp + 8]
    push edi
    lea ecx, [esp + 4]
    push ecx
    push edx
    mov edx, dword ptr [esp + 0x18]
    mov ecx, esi
    call sub_10035fe5
    mov eax, dword ptr [esi + 4]
    mov edi, dword ptr [esp + 0xc]
    movzx eax, word ptr [eax + edi*8 + 6]
    mov edx, dword ptr [esi + 0xc]
    lea ecx, [eax + eax*2]
    mov eax, dword ptr [esp + 0x1c]
    push 0x3f800000
    lea ecx, [edx + ecx*8]
    call sub_10036158
    mov ecx, dword ptr [esi + 4]
    mov dl, byte ptr [ecx + edi*8 + 4]
    add esp, 0xc
    mov al, 1
    test al, dl
    pop edi
    je L3
    mov dword ptr [ebx], 0x3f800000
    pop ecx
    ret
    mov dword ptr [ebx], 0
    pop ecx
    ret
FUN_10036320 ENDP
END