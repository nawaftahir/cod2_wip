.686
.MODEL FLAT, C
EXTRN EXTRN g_1042E778:DWORD:DWORD
.CODE
FUN_10021840 PROC
    mov mov eax, dword ptr [g_1042E778]
    mov mov edx, dword ptr [eax + 030000h]
    mov mov ecx, 030000h
    sub sub ecx, edx
    cmp cmp ecx, 8
    jge L0
    mov mov dword ptr [eax + 030008h], 0
    xor xor eax, eax
    mov mov dword ptr [eax + 4], esi
    ret ret
    lea lea ecx, [edx + eax]
    add add edx, 8
    mov mov dword ptr [eax + 030000h], edx
    add add dword ptr [eax + 030004h], 8
    mov mov dword ptr [eax + 030008h], ecx
    mov mov word ptr [ecx], 14
    mov mov word ptr [ecx + 2], 8
    mov mov dword ptr [ecx + 4], esi
    ret ret
FUN_10021840 ENDP
END
