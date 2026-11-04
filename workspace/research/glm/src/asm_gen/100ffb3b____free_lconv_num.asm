; ___free_lconv_num @ 0x100ffb3b — auto-synthesized
    EXTRN g_101a509c:DWORD
    EXTRN g_101a50a0:DWORD
    EXTRN g_101a50a4:DWORD
    EXTRN g_101a50cc:DWORD
    sub_100f84f3 PROTO C
    sub_100f8510 PROTO C
    sub_100f852c PROTO C
.CODE
___free_lconv_num PROC
    push esi
    mov esi, dword ptr [esp + 8]
    test esi, esi
    je L0
    mov eax, dword ptr [esi]
    mov ecx, dword ptr [g_101a50cc]
    cmp eax, dword ptr [ecx]
    je L1
    cmp eax, dword ptr [g_101a509c]
    je L1
    push eax
    call sub_100f84f3
    pop ecx
    mov eax, dword ptr [esi + 4]
    mov ecx, dword ptr [g_101a50cc]
    cmp eax, dword ptr [ecx + 4]
    je L2
    cmp eax, dword ptr [g_101a50a0]
    je L2
    push eax
    call sub_100f8510
    pop ecx
    mov esi, dword ptr [esi + 8]
    mov eax, dword ptr [g_101a50cc]
    cmp esi, dword ptr [eax + 8]
    je L0
    cmp esi, dword ptr [g_101a50a4]
    je L0
    push esi
    call sub_100f852c
    pop ecx
    pop esi
    ret
___free_lconv_num ENDP
END