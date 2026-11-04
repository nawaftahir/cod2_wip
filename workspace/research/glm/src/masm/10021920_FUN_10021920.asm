.686
.MODEL FLAT, C
EXTRN g_1042E778:DWORD
.CODE
FUN_10021920 PROC
    mov eax, dword ptr [g_1042E778]
    mov edx, dword ptr [eax + 000030000h]
    push edi
    mov edi, dword ptr [eax + 000030004h]
    mov ecx, 000030000h
    sub ecx, edx
    lea ecx, [ecx + edi - 000002000h]
    cmp ecx, 8
    pop edi
    jge L0
    mov dword ptr [eax + 000030008h], 0
    xor eax, eax
    mov dword ptr [eax + 4], esi
    ret
L0:
    lea ecx, [edx + eax]
    add edx, 8
    mov dword ptr [eax + 000030000h], edx
    mov dword ptr [eax + 000030008h], ecx
    mov word ptr [ecx], 24
    mov word ptr [ecx + 2], 8
    mov dword ptr [ecx + 4], esi
    ret
FUN_10021920 ENDP
END
