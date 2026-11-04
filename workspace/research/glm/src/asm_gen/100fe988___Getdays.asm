; __Getdays @ 0x100fe988 — auto-synthesized
    EXTRN g_101a4fd0:DWORD
    sub_100fa217 PROTO C
    sub_100fa221 PROTO C
    sub_100fa254 PROTO C
    sub_100fa26a PROTO C
    sub_100fc49a PROTO C
    sub_100fe8de PROTO C
    sub_100fe8f4 PROTO C
.CODE
__Getdays PROC
    push ebx
    push ebp
    push esi
    push edi
    mov edi, dword ptr [g_101a4fd0]
    xor esi, esi
    xor ebx, ebx
    push dword ptr [edi + ebx*4 + 0x1c]
    call sub_100fa217
    push dword ptr [edi + ebx*4]
    mov ebp, eax
    call sub_100fa221
    add eax, esi
    inc ebx
    cmp ebx, 7
    pop ecx
    pop ecx
    lea esi, [eax + ebp + 2]
    jb L0
    inc esi
    push esi
    call sub_100fc49a
    mov ebp, eax
    test ebp, ebp
    pop ecx
    je L1
    mov esi, ebp
    xor ebx, ebx
    mov byte ptr [esi], 0x3a
    push dword ptr [edi + ebx*4]
    inc esi
    push esi
    call sub_100fe8de
    push eax
    call sub_100fa254
    add esi, eax
    mov byte ptr [esi], 0x3a
    push dword ptr [edi + ebx*4 + 0x1c]
    inc esi
    push esi
    call sub_100fe8f4
    push eax
    call sub_100fa26a
    add esp, 0x18
    add esi, eax
    inc ebx
    cmp ebx, 7
    jb L2
    mov byte ptr [esi], 0
    pop edi
    pop esi
    mov eax, ebp
    pop ebp
    pop ebx
    ret
__Getdays ENDP
END