; FUN_1007d8da @ 0x1007d8da — auto-synthesized
    sub_100f7893 PROTO C
    sub_100f78a8 PROTO C
    sub_100f78d0 PROTO C
    sub_100f78e5 PROTO C
    sub_100f78ee PROTO C
.CODE
FUN_1007d8da PROC
    mov edi, edi
    push ebx
    push esi
    mov esi, ecx
    xor ebx, ebx
    cmp dword ptr [esi + 0x38], ebx
    push edi
    je L0
    mov eax, dword ptr [esi + 0x18]
    cmp word ptr [eax + 0xa], bx
    jbe L1
    mov eax, dword ptr [esi + 0x38]
    mov edi, dword ptr [eax + ebx*4]
    test edi, edi
    je L2
    mov ecx, edi
    call L3
    push edi
    call sub_100f7893
    pop ecx
    mov eax, dword ptr [esi + 0x18]
    movzx eax, word ptr [eax + 0xa]
    inc ebx
    cmp ebx, eax
    jb L4
    push dword ptr [esi + 0x38]
    call sub_100f78a8
    pop ecx
    xor edi, edi
    cmp dword ptr [esi + 0x3c], edi
    je L5
    mov eax, dword ptr [esi + 0x18]
    cmp word ptr [eax + 8], di
    jbe L6
    mov eax, dword ptr [esi + 0x3c]
    mov ebx, dword ptr [eax + edi*4]
    test ebx, ebx
    je L7
    mov ecx, ebx
    call L3
    push ebx
    call sub_100f78d0
    pop ecx
    mov eax, dword ptr [esi + 0x18]
    movzx eax, word ptr [eax + 8]
    inc edi
    cmp edi, eax
    jb L8
    push dword ptr [esi + 0x3c]
    call sub_100f78e5
    pop ecx
    push dword ptr [esi + 0x40]
    call sub_100f78ee
    pop ecx
    pop edi
    pop esi
    pop ebx
    ret
FUN_1007d8da ENDP
END