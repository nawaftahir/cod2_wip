.686
.MODEL FLAT, C
EXTRN sub_10020F30:PROC
EXTRN sub_10020FC7:PROC
EXTRN sub_10021018:PROC
EXTRN sub_10021031:PROC
EXTRN sub_10021065:PROC
EXTRN sub_10021078:PROC
EXTRN sub_100210A6:PROC
EXTRN sub_100210A7:PROC
EXTRN sub_100210F8:PROC
EXTRN sub_1002186C:PROC
EXTRN sub_1002197C:PROC
EXTRN sub_10021A16:PROC
EXTRN sub_10021C29:PROC
EXTRN sub_10021C30:PROC
EXTRN sub_10021D09:PROC
EXTRN sub_10021D61:PROC
EXTRN sub_100222B0:PROC
EXTRN sub_100249A0:PROC
EXTRN g_101CE694:DWORD
EXTRN g_101CE708:DWORD
EXTRN g_101D4818:DWORD
EXTRN g_101D489C:DWORD
EXTRN g_101D4C6C:DWORD
EXTRN g_101D4C70:DWORD
EXTRN g_10678500:DWORD
EXTRN g_10696C94:DWORD
EXTRN g_10696C98:DWORD
EXTRN g_10696CAC:DWORD
EXTRN g_10696CB0:DWORD
EXTRN g_10696CB4:DWORD
.CODE
FUN_10024d90 PROC
    mov eax, dword ptr [g_10696C98]
    sub esp, 16
    cmp eax, -1
    push ebp
    mov ebp, dword ptr [esp + 24]
    push esi
    push edi
    jne L2
    mov byte ptr [g_10696C94], 1
    call sub_10020F30
    xor esi, esi
    mov dword ptr [g_10696C98], eax
    call sub_1002186C
    mov eax, dword ptr [g_101D4C70]
    mov ecx, dword ptr [g_101D4C6C]
    push eax
    push ecx
    push esi
    push esi
    call sub_10021C30
    mov eax, dword ptr [g_101D4818]
    add esp, 16
    test eax, eax
    je L0
    mov edx, dword ptr [g_101CE708]
    cmp dword ptr [edx + 8], 2
    je L0
    mov eax, dword ptr [g_101CE694]
    mov cl, byte ptr [eax + 8]
    test cl, cl
    je L0
    mov eax, dword ptr [g_101D489C]
    test eax, eax
    mov esi, 1
    jne L1
L0:
    mov esi, 7
L1:
    lea eax, [esp + 12]
    call sub_100249A0
    push 0
    push 03F800000h
    mov ecx, eax
    push ecx
    push esi
    call sub_100222B0
    add esp, 16
L2:
    mov al, byte ptr [g_10696C94]
    test al, al
    je L3
    mov edx, dword ptr [g_10696C98]
    push edx
    call sub_10021018
    add esp, 4
    mov byte ptr [g_10696C94], 0
L3:
    call sub_10020FC7
    mov ecx, dword ptr [g_10678500]
    mov dword ptr [ebp*4 + 010696C9Ch], eax
    mov eax, dword ptr [esp + 36]
    push eax
    push ecx
    mov esi, 0101D7E7Ch
    mov edi, 010678504h
    call sub_10021C29
    mov edx, dword ptr [esp + 52]
    mov eax, dword ptr [esp + 48]
    push 0
    push 3
    push edx
    push eax
    call sub_1002197C
    add esp, 24
    mov esi, ebp
    call sub_10021A16
    mov eax, dword ptr [ebp*4 + 010696C9Ch]
    cmp eax, -1
    je L4
    push eax
    call sub_10021078
    add esp, 4
L4:
    mov eax, dword ptr [g_10696CAC]
    cmp eax, -1
    jne L5
    mov byte ptr [g_10696C94], 1
    call sub_10021031
    mov dword ptr [g_10696CAC], eax
L5:
    mov cl, byte ptr [g_10696C94]
    test cl, cl
    je L6
    push eax
    call sub_100210A6
    add esp, 4
    mov byte ptr [g_10696C94], 0
L6:
    cmp dword ptr [g_10696CB4], -1
    jne L7
    mov byte ptr [g_10696CB0], 1
    call sub_10021065
    mov ecx, dword ptr [g_101D4C70]
    mov edx, dword ptr [g_101D4C6C]
    push ecx
    push edx
    push 0
    push 0
    mov dword ptr [g_10696CB4], eax
    call sub_10021D61
    add esp, 16
L7:
    mov al, byte ptr [g_10696CB0]
    test al, al
    je L8
    mov eax, dword ptr [g_10696CB4]
    push eax
    call sub_100210F8
    add esp, 4
    mov byte ptr [g_10696CB0], 0
L8:
    call sub_100210A7
    mov ecx, dword ptr [esp + 36]
    mov edx, dword ptr [g_10678500]
    push ecx
    push edx
    mov esi, 0101D7E7Ch
    mov edi, 010678504h
    mov dword ptr [ebp*4 + 010696CB8h], eax
    call sub_10021D09
    add esp, 8
    pop edi
    pop esi
    pop ebp
    add esp, 16
    ret
FUN_10024d90 ENDP
END
