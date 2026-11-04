.686
.MODEL FLAT, C
EXTRN sub_1002197C:PROC
EXTRN EXTRN g_1042E778:DWORD:DWORD
.CODE
FUN_10021920 PROC
    mov mov eax, dword ptr [g_1042E778]
    mov mov edx, dword ptr [eax + 030000h]
    push push edi
    mov mov edi, dword ptr [eax + 030004h]
    mov mov ecx, 030000h
    sub sub ecx, edx
    lea lea ecx, [ecx + edi - 02000h]
    cmp cmp ecx, 8
    pop pop edi
    jge sub_1002197C
    mov mov dword ptr [eax + 030008h], 0
    xor xor eax, eax
    mov mov dword ptr [eax + 4], esi
    ret ret
    lea lea ecx, [edx + eax]
    add add edx, 8
    mov mov dword ptr [eax + 030000h], edx
    mov mov dword ptr [eax + 030008h], ecx
    mov mov word ptr [ecx], 24
    mov mov word ptr [ecx + 2], 8
    mov mov dword ptr [ecx + 4], esi
    ret ret
FUN_10021920 ENDP
END
