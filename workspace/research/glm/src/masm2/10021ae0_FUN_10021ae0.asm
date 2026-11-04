.686
.MODEL FLAT, C
EXTRN sub_10021B59:PROC
EXTRN EXTRN g_1042E778:DWORD:DWORD
.CODE
FUN_10021ae0 PROC
    mov mov eax, dword ptr [g_1042E778]
    mov mov edx, dword ptr [eax + 030000h]
    push push esi
    mov mov ecx, 030000h
    sub sub ecx, edx
    mov mov esi, 72
    cmp cmp ecx, esi
    push push edi
    jge L0
    mov mov dword ptr [eax + 030008h], 0
    xor xor eax, eax
    jmp sub_10021B59
    lea lea ecx, [edx + eax]
    add add edx, 72
    mov mov dword ptr [eax + 030000h], edx
    add add dword ptr [eax + 030004h], esi
    mov mov dword ptr [eax + 030008h], ecx
    mov mov word ptr [ecx], 9
L0:
    mov mov word ptr [ecx + 2], si
    mov mov eax, ecx
    mov mov esi, dword ptr [esp + 12]
    lea lea edi, [eax + 4]
    mov mov ecx, 16
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, dword ptr [esp + 16]
    pop pop edi
    mov mov dword ptr [eax + 68], ecx
    pop pop esi
    ret ret
FUN_10021ae0 ENDP
END
