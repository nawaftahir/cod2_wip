.686
.MODEL FLAT, C
EXTRN g_1042E778:DWORD
.CODE
FUN_10021ae0 PROC
    mov eax, dword ptr [g_1042E778]
    mov edx, dword ptr [eax + 000030000h]
    push esi
    mov ecx, 000030000h
    sub ecx, edx
    mov esi, 72
    cmp ecx, esi
    push edi
    jge L0
    mov dword ptr [eax + 000030008h], 0
    xor eax, eax
    jmp L1
L0:
    lea ecx, [edx + eax]
    add edx, 72
    mov dword ptr [eax + 000030000h], edx
    add dword ptr [eax + 000030004h], esi
    mov dword ptr [eax + 000030008h], ecx
    mov word ptr [ecx], 9
    mov word ptr [ecx + 2], si
    mov eax, ecx
L1:
    mov esi, dword ptr [esp + 12]
    lea edi, [eax + 4]
    mov ecx, 16
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, dword ptr [esp + 16]
    pop edi
    mov dword ptr [eax + 68], ecx
    pop esi
    ret
FUN_10021ae0 ENDP
END
