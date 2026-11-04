; FUN_10035bd0 @ 0x10035bd0 — auto-synthesized
    EXTRN g_10764578:DWORD
    EXTRN g_1076457c:DWORD
    sub_100f67cf PROTO C
.CODE
FUN_10035bd0 PROC
    mov eax, dword ptr [g_1076457c]
    cmp eax, 0x400000
    jl L0
    xor al, al
    ret
    mov ecx, dword ptr [g_10764578]
    push esi
    lea esi, [edx + edx*2]
    sub eax, edx
    lea edx, [eax + eax*2]
    shl edx, 1
    shl esi, 1
    add ecx, esi
    push edx
    push ecx
    add ecx, 6
    push ecx
    call sub_100f67cf
    mov eax, dword ptr [g_10764578]
    mov cx, word ptr [esp + 0x14]
    mov word ptr [esi + eax], cx
    mov edx, dword ptr [g_10764578]
    mov ax, word ptr [esp + 0x18]
    mov word ptr [esi + edx + 2], ax
    mov ecx, dword ptr [g_10764578]
    mov dx, word ptr [esp + 0x1c]
    mov word ptr [esi + ecx + 4], dx
    mov eax, dword ptr [g_1076457c]
    add esp, 0xc
    inc eax
    mov dword ptr [g_1076457c], eax
    mov al, 1
    pop esi
    ret
FUN_10035bd0 ENDP
END