.686
.MODEL FLAT, C
EXTRN sub_100F67CF:PROC
EXTRN EXTRN g_10764578:DWORD:DWORD
EXTRN EXTRN g_1076457C:DWORD:DWORD
.CODE
FUN_10035bd0 PROC
    mov mov eax, dword ptr [g_1076457C]
    cmp cmp eax, 0400000h
    jl L0
    xor xor al, al
    ret ret
    mov mov ecx, dword ptr [g_10764578]
    push push esi
    lea lea esi, [edx + edx*2]
    sub sub eax, edx
L0:
    lea lea edx, [eax + eax*2]
    shl shl edx, 1
    shl shl esi, 1
    add add ecx, esi
    push push edx
    push push ecx
    add add ecx, 6
    push push ecx
    call sub_100F67CF
    mov mov eax, dword ptr [g_10764578]
    mov mov cx, word ptr [esp + 20]
    mov mov word ptr [esi + eax], cx
    mov mov edx, dword ptr [g_10764578]
    mov mov ax, word ptr [esp + 24]
    mov mov word ptr [esi + edx + 2], ax
    mov mov ecx, dword ptr [g_10764578]
    mov mov dx, word ptr [esp + 28]
    mov mov word ptr [esi + ecx + 4], dx
    mov mov eax, dword ptr [g_1076457C]
    add add esp, 12
    inc inc eax
    mov mov dword ptr [g_1076457C], eax
    mov mov al, 1
    pop pop esi
    ret ret
FUN_10035bd0 ENDP
END
