; FUN_10009690 @ 0x10009690 — auto-synthesized
    EXTRN g_101d7e9c:DWORD
    EXTRN g_10678500:DWORD
    sub_100093cb PROTO C
.CODE
FUN_10009690 PROC
    mov eax, dword ptr [ecx + 0x28]
    test eax, eax
    push esi
    mov esi, dword ptr [ecx + 0x2c]
    je L0
    push ebp
    mov ebp, eax
    mov edi, edi
    mov ecx, dword ptr [g_101d7e9c]
    mov eax, dword ptr [esi]
    mov edx, dword ptr [ecx + eax*4]
    cmp edx, dword ptr [g_10678500]
    je L1
    push edi
    mov ecx, ebx
    call sub_100093cb
    add esp, 4
    add esi, 4
    dec ebp
    jne L2
    pop ebp
    pop esi
    ret
FUN_10009690 ENDP
END