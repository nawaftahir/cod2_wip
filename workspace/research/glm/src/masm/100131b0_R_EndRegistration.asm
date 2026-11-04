.686
.MODEL FLAT, C
EXTRN g_1042E778:DWORD
.CODE
R_EndRegistration PROC
    mov eax, dword ptr [g_1042E778]
    mov edx, dword ptr [eax + 000030000h]
    push esi
    mov esi, dword ptr [eax + 000030004h]
    mov ecx, 000030000h
    sub ecx, edx
    lea ecx, [ecx + esi - 000002000h]
    cmp ecx, 4
    pop esi
    jge L0
    mov dword ptr [eax + 000030008h], 0
    ret
L0:
    lea ecx, [edx + eax]
    add edx, 4
    mov dword ptr [eax + 000030000h], edx
    mov dword ptr [eax + 000030008h], ecx
    mov word ptr [ecx], 33
    mov word ptr [ecx + 2], 4
    ret
R_EndRegistration ENDP
END
