.686
.MODEL FLAT, C
EXTRN g_1042E778:DWORD
.CODE
FUN_10021840 PROC
    mov eax, dword ptr [g_1042E778]
    mov edx, dword ptr [eax + 000030000h]
    mov ecx, 000030000h
    sub ecx, edx
    cmp ecx, 8
    jge L0
    mov dword ptr [eax + 000030008h], 0
    xor eax, eax
    mov dword ptr [eax + 4], esi
    ret
L0:
    lea ecx, [edx + eax]
    add edx, 8
    mov dword ptr [eax + 000030000h], edx
    add dword ptr [eax + 000030004h], 8
    mov dword ptr [eax + 000030008h], ecx
    mov word ptr [ecx], 14
    mov word ptr [ecx + 2], 8
    mov dword ptr [ecx + 4], esi
    ret
FUN_10021840 ENDP
END
