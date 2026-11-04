; FUN_100080d0 @ 0x100080d0 — auto-synthesized
    EXTRN g_101ce800:DWORD
    EXTRN g_101d1b9c:DWORD
    EXTRN g_101d7e98:DWORD
    EXTRN g_10678500:DWORD
    sub_10006342 PROTO C
    sub_100243fd PROTO C
.CODE
FUN_100080d0 PROC
    mov eax, dword ptr [g_101d7e98]
    mov ecx, dword ptr [eax + edi*4]
    cmp ecx, dword ptr [g_10678500]
    je L0
    mov edx, dword ptr [g_101d1b9c]
    mov eax, dword ptr [edx + 0x14]
    mov ecx, dword ptr [g_101ce800]
    mov dl, byte ptr [ecx + 8]
    push esi
    lea esi, [edi + edi*2]
    shl esi, 2
    test dl, dl
    mov eax, dword ptr [eax + esi + 8]
    je L1
    mov edx, dword ptr [esp + 0xc]
    mov ecx, dword ptr [esp + 8]
    push edx
    lea edx, [eax + 4]
    call sub_10006342
    add esp, 4
    test al, al
    jne L2
    mov eax, dword ptr [g_10678500]
    mov ecx, dword ptr [g_101d7e98]
    mov dword ptr [ecx + edi*4], eax
    mov edx, dword ptr [g_101d1b9c]
    mov eax, dword ptr [edx + 0x14]
    movzx ecx, word ptr [eax + esi + 6]
    mov edx, dword ptr [eax + esi + 8]
    add eax, esi
    movzx esi, word ptr [eax + 4]
    mov eax, dword ptr [eax]
    add ecx, 0x800
    push edx
    call sub_100243fd
    add esp, 4
    pop esi
    ret
FUN_100080d0 ENDP
END