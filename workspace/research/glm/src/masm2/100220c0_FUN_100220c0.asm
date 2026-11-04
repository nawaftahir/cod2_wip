.686
.MODEL FLAT, C
EXTRN sub_10022117:PROC
EXTRN EXTRN g_1042E778:DWORD:DWORD
.CODE
FUN_100220c0 PROC
    mov mov eax, dword ptr [g_1042E778]
    mov mov edx, dword ptr [eax + 030000h]
    push push esi
    mov mov esi, dword ptr [eax + 030004h]
    mov mov ecx, 030000h
    sub sub ecx, edx
    lea lea ecx, [ecx + esi - 02000h]
    cmp cmp ecx, 4
    pop pop esi
    jge sub_10022117
    mov mov dword ptr [eax + 030008h], 0
    ret ret
    lea lea ecx, [edx + eax]
    add add edx, 4
    mov mov dword ptr [eax + 030000h], edx
    mov mov dword ptr [eax + 030008h], ecx
    mov mov word ptr [ecx], 25
    mov mov word ptr [ecx + 2], 4
    ret ret
FUN_100220c0 ENDP
END
