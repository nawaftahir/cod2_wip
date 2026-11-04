.686
.MODEL FLAT, C
EXTRN EXTRN g_1042E778:DWORD:DWORD
.CODE
FUN_10021890 PROC
    mov mov ecx, dword ptr [g_1042E778]
    mov mov edx, dword ptr [ecx + 030000h]
    push push esi
    mov mov esi, dword ptr [ecx + 030004h]
    mov mov eax, 030000h
    sub sub eax, edx
    lea lea eax, [eax + esi - 02000h]
    cmp cmp eax, 20
    pop pop esi
    jge L0
    mov mov dword ptr [ecx + 030008h], 0
    ret ret
    lea lea eax, [edx + ecx]
    mov mov dword ptr [ecx + 030008h], eax
    add add edx, 20
    mov mov dword ptr [ecx + 030000h], edx
    mov mov ecx, dword ptr [esp + 16]
    mov mov edx, dword ptr [esp + 4]
    mov mov word ptr [eax], 23
    mov mov word ptr [eax + 2], 20
    mov mov dword ptr [eax + 4], ecx
    mov mov ecx, dword ptr [esp + 8]
    mov mov dword ptr [eax + 8], edx
    mov mov edx, dword ptr [esp + 12]
    mov mov dword ptr [eax + 12], ecx
    mov mov dword ptr [eax + 16], edx
    ret ret
FUN_10021890 ENDP
END
