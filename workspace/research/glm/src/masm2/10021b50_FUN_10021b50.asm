.686
.MODEL FLAT, C
EXTRN EXTRN g_1042E778:DWORD:DWORD
.CODE
FUN_10021b50 PROC
    mov mov eax, dword ptr [g_1042E778]
    mov mov edx, dword ptr [eax + 030000h]
    mov mov ecx, 030000h
    sub sub ecx, edx
    cmp cmp ecx, 48
    jge L0
    mov mov dword ptr [eax + 030008h], 0
    xor xor eax, eax
    jmp L1
    lea lea ecx, [edx + eax]
    add add edx, 48
    mov mov dword ptr [eax + 030000h], edx
    add add dword ptr [eax + 030004h], 48
    mov mov dword ptr [eax + 030008h], ecx
    mov mov word ptr [ecx], 12
    mov mov word ptr [ecx + 2], 48
    mov mov eax, ecx
    mov mov ecx, dword ptr [esp + 4]
    mov mov dword ptr [eax + 44], ecx
    mov mov ecx, dword ptr [edi]
    lea lea edx, [eax + 4]
    mov mov dword ptr [edx], ecx
    mov mov ecx, dword ptr [edi + 4]
    mov mov dword ptr [edx + 4], ecx
    mov mov ecx, dword ptr [edi + 8]
    mov mov dword ptr [edx + 8], ecx
    mov mov ecx, dword ptr [edi + 12]
    mov mov dword ptr [edx + 12], ecx
    mov mov edx, dword ptr [esp + 8]
    mov mov dword ptr [eax + 20], edx
    mov mov ecx, dword ptr [esi]
    add add eax, 24
    mov mov dword ptr [eax], ecx
    mov mov edx, dword ptr [esi + 4]
    mov mov dword ptr [eax + 4], edx
    mov mov ecx, dword ptr [esi + 8]
    mov mov dword ptr [eax + 8], ecx
    mov mov edx, dword ptr [esi + 12]
    mov mov dword ptr [eax + 12], edx
    mov mov ecx, dword ptr [esi + 16]
    mov mov dword ptr [eax + 16], ecx
    ret ret
FUN_10021b50 ENDP
END
