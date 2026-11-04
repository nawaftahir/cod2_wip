.686
.MODEL FLAT, C
EXTRN g_1042E778:DWORD
.CODE
FUN_10021890 PROC
    mov ecx, dword ptr [g_1042E778]
    mov edx, dword ptr [ecx + 000030000h]
    push esi
    mov esi, dword ptr [ecx + 000030004h]
    mov eax, 000030000h
    sub eax, edx
    lea eax, [eax + esi - 000002000h]
    cmp eax, 20
    pop esi
    jge L0
    mov dword ptr [ecx + 000030008h], 0
    ret
L0:
    lea eax, [edx + ecx]
    mov dword ptr [ecx + 000030008h], eax
    add edx, 20
    mov dword ptr [ecx + 000030000h], edx
    mov ecx, dword ptr [esp + 16]
    mov edx, dword ptr [esp + 4]
    mov word ptr [eax], 23
    mov word ptr [eax + 2], 20
    mov dword ptr [eax + 4], ecx
    mov ecx, dword ptr [esp + 8]
    mov dword ptr [eax + 8], edx
    mov edx, dword ptr [esp + 12]
    mov dword ptr [eax + 12], ecx
    mov dword ptr [eax + 16], edx
    ret
FUN_10021890 ENDP
END
