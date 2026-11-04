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
EXTRN sub_10024F9D:PROC
EXTRN sub_10024FCB:PROC
EXTRN sub_10025000:PROC
EXTRN sub_1002504D:PROC
EXTRN sub_1002509F:PROC
EXTRN EXTRN g_101CE694:DWORD:DWORD
EXTRN EXTRN g_101CE708:DWORD:DWORD
EXTRN EXTRN g_101D4818:DWORD:DWORD
EXTRN EXTRN g_101D489C:DWORD:DWORD
EXTRN EXTRN g_101D4C6C:DWORD:DWORD
EXTRN EXTRN g_101D4C70:DWORD:DWORD
EXTRN EXTRN g_10678500:DWORD:DWORD
EXTRN EXTRN g_10696C94:DWORD:DWORD
EXTRN EXTRN g_10696C98:DWORD:DWORD
EXTRN EXTRN g_10696CAC:DWORD:DWORD
EXTRN EXTRN g_10696CB0:DWORD:DWORD
EXTRN EXTRN g_10696CB4:DWORD:DWORD
.CODE
FUN_10024d90 PROC
    mov mov eax, dword ptr [g_10696C98]
    sub sub esp, 16
    cmp cmp eax, -1
    push push ebp
    mov mov ebp, dword ptr [esp + 24]
    push push esi
    push push edi
    jne L0
    mov mov byte ptr [g_10696C94], 1
    call sub_10020F30
    xor xor esi, esi
    mov mov dword ptr [g_10696C98], eax
    call sub_1002186C
    mov mov eax, dword ptr [g_101D4C70]
    mov mov ecx, dword ptr [g_101D4C6C]
    push push eax
    push push ecx
    push push esi
    push push esi
    call sub_10021C30
    mov mov eax, dword ptr [g_101D4818]
    add add esp, 16
    test test eax, eax
    je L1
    mov mov edx, dword ptr [g_101CE708]
    cmp cmp dword ptr [edx + 8], 2
    je L2
    mov mov eax, dword ptr [g_101CE694]
    mov mov cl, byte ptr [eax + 8]
    test test cl, cl
    je L3
    mov mov eax, dword ptr [g_101D489C]
    test test eax, eax
    mov mov esi, 1
    jne L4
    mov mov esi, 7
    lea lea eax, [esp + 12]
    call sub_100249A0
    push push 0
    push push 03F800000h
    mov mov ecx, eax
    push push ecx
    push push esi
    call sub_100222B0
    add add esp, 16
    mov mov al, byte ptr [g_10696C94]
    test test al, al
    je L5
    mov mov edx, dword ptr [g_10696C98]
    push push edx
    call sub_10021018
    add add esp, 4
    mov mov byte ptr [g_10696C94], 0
    call sub_10020FC7
    mov mov ecx, dword ptr [g_10678500]
    mov mov dword ptr [ebp*4 + 010696C9Ch], eax
    mov mov eax, dword ptr [esp + 36]
    push push eax
    push push ecx
L2:
    mov mov esi, 0101D7E7Ch
    mov mov edi, 010678504h
    call sub_10021C29
    mov mov edx, dword ptr [esp + 52]
    mov mov eax, dword ptr [esp + 48]
    push push 0
    push push 3
    push push edx
    push push eax
    call sub_1002197C
    add add esp, 24
    mov mov esi, ebp
    call sub_10021A16
    mov mov eax, dword ptr [ebp*4 + 010696C9Ch]
    cmp cmp eax, -1
    je sub_10024F9D
    push push eax
    call sub_10021078
    add add esp, 4
    mov mov eax, dword ptr [g_10696CAC]
    cmp cmp eax, -1
    jne sub_10024FCB
    mov mov byte ptr [g_10696C94], 1
    call sub_10021031
    mov mov dword ptr [g_10696CAC], eax
    mov mov cl, byte ptr [g_10696C94]
    test test cl, cl
    je sub_10025000
    push push eax
    call sub_100210A6
    add add esp, 4
    mov mov byte ptr [g_10696C94], 0
    cmp cmp dword ptr [g_10696CB4], -1
    jne sub_1002504D
    mov mov byte ptr [g_10696CB0], 1
    call sub_10021065
    mov mov ecx, dword ptr [g_101D4C70]
    mov mov edx, dword ptr [g_101D4C6C]
    push push ecx
    push push edx
    push push 0
    push push 0
    mov mov dword ptr [g_10696CB4], eax
    call sub_10021D61
    add add esp, 16
    mov mov al, byte ptr [g_10696CB0]
    test test al, al
    je sub_1002509F
    mov mov eax, dword ptr [g_10696CB4]
    push push eax
    call sub_100210F8
    add add esp, 4
    mov mov byte ptr [g_10696CB0], 0
    call sub_100210A7
    mov mov ecx, dword ptr [esp + 36]
    mov mov edx, dword ptr [g_10678500]
    push push ecx
    push push edx
    mov mov esi, 0101D7E7Ch
    mov mov edi, 010678504h
    mov mov dword ptr [ebp*4 + 010696CB8h], eax
    call sub_10021D09
    add add esp, 8
    pop pop edi
    pop pop esi
    pop pop ebp
    add add esp, 16
    ret ret
FUN_10024d90 ENDP
END
