.686
.MODEL FLAT, C
EXTRN sub_10021C56:PROC
EXTRN EXTRN g_1042E778:DWORD:DWORD
.CODE
R_ClearScreen PROC
    mov mov eax, dword ptr [g_1042E778]
    mov mov edx, dword ptr [eax + 030000h]
    mov mov ecx, 030000h
    sub sub ecx, edx
    cmp cmp ecx, 20
    jge L0
    xor xor ecx, ecx
    mov mov dword ptr [eax + 030008h], ecx
    jmp sub_10021C56
    lea lea ecx, [edx + eax]
    add add edx, 20
    mov mov dword ptr [eax + 030000h], edx
    add add dword ptr [eax + 030004h], 20
    mov mov dword ptr [eax + 030008h], ecx
    mov mov word ptr [ecx], 13
    mov mov word ptr [ecx + 2], 20
    mov mov eax, dword ptr [esp + 4]
    mov mov edx, dword ptr [esp + 8]
    mov mov dword ptr [ecx + 4], eax
    mov mov eax, dword ptr [esp + 12]
    mov mov dword ptr [ecx + 8], edx
    mov mov edx, dword ptr [esp + 16]
    mov mov dword ptr [ecx + 12], eax
    mov mov dword ptr [ecx + 16], edx
    ret ret
R_ClearScreen ENDP
END
