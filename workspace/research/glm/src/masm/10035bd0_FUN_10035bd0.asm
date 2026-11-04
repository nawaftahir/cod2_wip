.686
.MODEL FLAT, C
EXTRN sub_100F67CF:PROC
EXTRN g_10764578:DWORD
EXTRN g_1076457C:DWORD
.CODE
FUN_10035bd0 PROC
    mov eax, dword ptr [g_1076457C]
    cmp eax, 000400000h
    jl L0
    xor al, al
    ret
L0:
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
    call sub_100F67CF
    mov eax, dword ptr [g_10764578]
    mov cx, word ptr [esp + 20]
    mov word ptr [esi + eax], cx
    mov edx, dword ptr [g_10764578]
    mov ax, word ptr [esp + 24]
    mov word ptr [esi + edx + 2], ax
    mov ecx, dword ptr [g_10764578]
    mov dx, word ptr [esp + 28]
    mov word ptr [esi + ecx + 4], dx
    mov eax, dword ptr [g_1076457C]
    add esp, 12
    inc eax
    mov dword ptr [g_1076457C], eax
    mov al, 1
    pop esi
    ret
FUN_10035bd0 ENDP
END
