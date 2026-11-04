.686
.MODEL FLAT, C
EXTRN g_1042E778:DWORD
.CODE
FUN_10022110 PROC
    mov eax, dword ptr [g_1042E778]
    mov edx, dword ptr [eax + 000030000h]
    push esi
    mov esi, dword ptr [eax + 000030004h]
    mov ecx, 000030000h
    sub ecx, edx
    lea ecx, [ecx + esi - 000002000h]
    cmp ecx, 8
    pop esi
    jge L0
    mov dword ptr [eax + 000030008h], 0
    ret
L0:
    lea ecx, [edx + eax]
    mov dword ptr [eax + 000030008h], ecx
    add edx, 8
    mov dword ptr [eax + 000030000h], edx
    mov eax, dword ptr [esp + 4]
    mov word ptr [ecx], 26
    mov word ptr [ecx + 2], 8
    mov dword ptr [ecx + 4], eax
    ret
FUN_10022110 ENDP
END
