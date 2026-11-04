.686
.MODEL FLAT, C
EXTRN sub_10022167:PROC
EXTRN EXTRN g_1042E778:DWORD:DWORD
.CODE
FUN_10022110 PROC
    mov mov eax, dword ptr [g_1042E778]
    mov mov edx, dword ptr [eax + 030000h]
    push push esi
    mov mov esi, dword ptr [eax + 030004h]
    mov mov ecx, 030000h
    sub sub ecx, edx
    lea lea ecx, [ecx + esi - 02000h]
    cmp cmp ecx, 8
    pop pop esi
    jge sub_10022167
    mov mov dword ptr [eax + 030008h], 0
    ret ret
    lea lea ecx, [edx + eax]
    mov mov dword ptr [eax + 030008h], ecx
    add add edx, 8
    mov mov dword ptr [eax + 030000h], edx
    mov mov eax, dword ptr [esp + 4]
    mov mov word ptr [ecx], 26
    mov mov word ptr [ecx + 2], 8
    mov mov dword ptr [ecx + 4], eax
    ret ret
FUN_10022110 ENDP
END
