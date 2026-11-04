; FUN_10086309 @ 0x10086309 — auto-synthesized
    sub_1006c49c PROTO C
    sub_1006db8d PROTO C
    sub_10085e13 PROTO C
    sub_100f789f PROTO C
    sub_100f78cb PROTO C
    sub_100f78f7 PROTO C
.CODE
FUN_10086309 PROC
    mov edi, edi
    push ebx
    push esi
    mov esi, ecx
    xor ebx, ebx
    cmp dword ptr [esi + 0x10], ebx
    push edi
    mov dword ptr [esi], 0x101103f8
    je L0
    xor edi, edi
    cmp dword ptr [esi + 4], ebx
    jbe L1
    mov eax, dword ptr [esi + 0x10]
    mov ecx, dword ptr [eax + edi*4]
    cmp ecx, ebx
    je L2
    push 1
    call sub_10085e13
    inc edi
    cmp edi, dword ptr [esi + 4]
    jb L3
    push dword ptr [esi + 0x10]
    call sub_100f789f
    pop ecx
    cmp dword ptr [esi + 0x14], ebx
    je L4
    xor edi, edi
    cmp dword ptr [esi + 8], ebx
    jbe L5
    mov eax, dword ptr [esi + 0x14]
    mov ecx, dword ptr [eax + edi*4]
    cmp ecx, ebx
    je L6
    push 1
    call sub_1006db8d
    inc edi
    cmp edi, dword ptr [esi + 8]
    jb L7
    push dword ptr [esi + 0x14]
    call sub_100f78cb
    pop ecx
    cmp dword ptr [esi + 0x18], ebx
    je L8
    xor edi, edi
    cmp dword ptr [esi + 0xc], ebx
    jbe L9
    mov eax, dword ptr [esi + 0x18]
    mov ecx, dword ptr [eax + edi*4]
    cmp ecx, ebx
    je L10
    push 1
    call sub_1006c49c
    inc edi
    cmp edi, dword ptr [esi + 0xc]
    jb L11
    push dword ptr [esi + 0x18]
    call sub_100f78f7
    pop ecx
    pop edi
    pop esi
    pop ebx
    ret
FUN_10086309 ENDP
END