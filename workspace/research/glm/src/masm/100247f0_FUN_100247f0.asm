.686
.MODEL FLAT, C
EXTRN sub_1002181F:PROC
EXTRN g_101D1B48:DWORD
EXTRN g_1042E778:DWORD
EXTRN g_10678ABC:DWORD
.CODE
FUN_100247f0 PROC
    sub esp, 12
    test eax, eax
    jle L5
    push ebx
    push ebp
    push esi
    mov esi, dword ptr [g_1042E778]
    push edi
    mov edi, ecx
    add edi, 8
    mov dword ptr [esp + 16], eax
    mov edi, edi
L0:
    mov edx, dword ptr [g_10678ABC]
    mov eax, dword ptr [edi - 4]
    mov ebx, dword ptr [esi + 000030004h]
    mov ecx, dword ptr [edi - 8]
    mov ebp, dword ptr [g_101D1B48]
    lea eax, [edx + eax*8]
    mov edx, dword ptr [edi]
    mov dword ptr [esp + 20], eax
    mov dword ptr [esp + 24], edx
    mov edx, dword ptr [esi + 000030000h]
    mov eax, 000030000h
    sub eax, edx
    lea eax, [eax + ebx - 000002000h]
    cmp eax, 28
    jge L1
    xor ebx, ebx
    mov dword ptr [esi + 000030008h], ebx
    jmp L2
L1:
    lea eax, [edx + esi]
    mov dword ptr [esi + 000030008h], eax
    add edx, 28
    mov dword ptr [esi + 000030000h], edx
    mov word ptr [eax], 20
    mov word ptr [eax + 2], 28
    mov edx, 03F800000h
    mov dword ptr [eax + 16], edx
    mov dword ptr [eax + 20], edx
    mov dl, 0000000FFh
    mov dword ptr [eax + 4], ebp
    xor ebx, ebx
    mov dword ptr [eax + 8], ebx
    mov dword ptr [eax + 12], ebx
    mov byte ptr [eax + 24], dl
    mov byte ptr [eax + 25], dl
    mov byte ptr [eax + 26], dl
    mov byte ptr [eax + 27], dl
L2:
    push ebx
    call sub_1002181F
    mov ecx, dword ptr [esi + 000030000h]
    mov edx, dword ptr [esi + 000030004h]
    mov eax, 000030000h
    sub eax, ecx
    lea eax, [eax + edx - 000002000h]
    add esp, 4
    cmp eax, 20
    jge L3
    mov dword ptr [esi + 000030008h], ebx
    jmp L4
L3:
    mov edx, dword ptr [esp + 24]
    lea eax, [ecx + esi]
    mov dword ptr [esi + 000030008h], eax
    add ecx, 20
    mov dword ptr [esi + 000030000h], ecx
    mov ecx, dword ptr [esp + 20]
    mov word ptr [eax], 23
    mov word ptr [eax + 2], 20
    mov dword ptr [eax + 4], ebx
    mov dword ptr [eax + 8], ecx
    mov dword ptr [eax + 12], edx
    mov dword ptr [eax + 16], 18
L4:
    mov eax, dword ptr [esp + 16]
    add edi, 12
    dec eax
    mov dword ptr [esp + 16], eax
    jne L0
    pop edi
    pop esi
    pop ebp
    pop ebx
L5:
    add esp, 12
    ret
FUN_100247f0 ENDP
END
