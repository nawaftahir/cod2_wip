; __setenvp @ 0x100fdace — auto-synthesized
    EXTRN g_101add80:DWORD
    EXTRN g_101ae02c:DWORD
    EXTRN g_1076ada0:DWORD
    EXTRN g_1076adac:DWORD
    sub_100f8567 PROTO C
    sub_100f858c PROTO C
    sub_100fa22b PROTO C
    sub_100fa264 PROTO C
    sub_100fc4a7 PROTO C
    sub_100fc4d7 PROTO C
    sub_100fe911 PROTO C
    sub_101071f0 PROTO C
.CODE
__setenvp PROC
    push ebx
    xor ebx, ebx
    cmp dword ptr [g_1076adac], ebx
    push esi
    push edi
    jne L0
    call sub_101071f0
    mov esi, dword ptr [g_101add80]
    xor edi, edi
    cmp esi, ebx
    jne L1
    jmp L2
    cmp al, 0x3d
    je L3
    inc edi
    push esi
    call sub_100fa22b
    pop ecx
    lea esi, [esi + eax + 1]
    mov al, byte ptr [esi]
    cmp al, bl
    jne L4
    lea eax, [edi*4 + 4]
    push eax
    call sub_100fc4a7
    mov edi, eax
    cmp edi, ebx
    pop ecx
    mov dword ptr [g_101ae02c], edi
    jne L5
    or eax, 0xffffffff
    jmp L6
    mov esi, dword ptr [g_101add80]
    push ebp
    jmp L7
    push esi
    call sub_100fa264
    mov ebp, eax
    inc ebp
    cmp byte ptr [esi], 0x3d
    pop ecx
    je L8
    push ebp
    call sub_100fc4d7
    cmp eax, ebx
    pop ecx
    mov dword ptr [edi], eax
    je L9
    push esi
    push eax
    call sub_100fe911
    pop ecx
    pop ecx
    add edi, 4
    add esi, ebp
    cmp byte ptr [esi], bl
    jne L10
    push dword ptr [g_101add80]
    call sub_100f8567
    mov dword ptr [g_101add80], ebx
    mov dword ptr [edi], ebx
    mov dword ptr [g_1076ada0], 1
    xor eax, eax
    pop ecx
    pop ebp
    pop edi
    pop esi
    pop ebx
    ret
    push dword ptr [g_101ae02c]
    call sub_100f858c
    mov dword ptr [g_101ae02c], ebx
    or eax, 0xffffffff
    jmp L11
__setenvp ENDP
END