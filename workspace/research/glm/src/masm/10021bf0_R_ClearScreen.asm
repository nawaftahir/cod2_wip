.686
.MODEL FLAT, C
EXTRN g_1042E778:DWORD
.CODE
R_ClearScreen PROC
    mov eax, dword ptr [g_1042E778]
    mov edx, dword ptr [eax + 000030000h]
    mov ecx, 000030000h
    sub ecx, edx
    cmp ecx, 20
    jge L0
    xor ecx, ecx
    mov dword ptr [eax + 000030008h], ecx
    jmp L1
L0:
    lea ecx, [edx + eax]
    add edx, 20
    mov dword ptr [eax + 000030000h], edx
    add dword ptr [eax + 000030004h], 20
    mov dword ptr [eax + 000030008h], ecx
    mov word ptr [ecx], 13
    mov word ptr [ecx + 2], 20
L1:
    mov eax, dword ptr [esp + 4]
    mov edx, dword ptr [esp + 8]
    mov dword ptr [ecx + 4], eax
    mov eax, dword ptr [esp + 12]
    mov dword ptr [ecx + 8], edx
    mov edx, dword ptr [esp + 16]
    mov dword ptr [ecx + 12], eax
    mov dword ptr [ecx + 16], edx
    ret
R_ClearScreen ENDP
END
