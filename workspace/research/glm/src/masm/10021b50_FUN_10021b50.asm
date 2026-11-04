.686
.MODEL FLAT, C
EXTRN g_1042E778:DWORD
.CODE
FUN_10021b50 PROC
    mov eax, dword ptr [g_1042E778]
    mov edx, dword ptr [eax + 000030000h]
    mov ecx, 000030000h
    sub ecx, edx
    cmp ecx, 48
    jge L0
    mov dword ptr [eax + 000030008h], 0
    xor eax, eax
    jmp L1
L0:
    lea ecx, [edx + eax]
    add edx, 48
    mov dword ptr [eax + 000030000h], edx
    add dword ptr [eax + 000030004h], 48
    mov dword ptr [eax + 000030008h], ecx
    mov word ptr [ecx], 12
    mov word ptr [ecx + 2], 48
    mov eax, ecx
L1:
    mov ecx, dword ptr [esp + 4]
    mov dword ptr [eax + 44], ecx
    mov ecx, dword ptr [edi]
    lea edx, [eax + 4]
    mov dword ptr [edx], ecx
    mov ecx, dword ptr [edi + 4]
    mov dword ptr [edx + 4], ecx
    mov ecx, dword ptr [edi + 8]
    mov dword ptr [edx + 8], ecx
    mov ecx, dword ptr [edi + 12]
    mov dword ptr [edx + 12], ecx
    mov edx, dword ptr [esp + 8]
    mov dword ptr [eax + 20], edx
    mov ecx, dword ptr [esi]
    add eax, 24
    mov dword ptr [eax], ecx
    mov edx, dword ptr [esi + 4]
    mov dword ptr [eax + 4], edx
    mov ecx, dword ptr [esi + 8]
    mov dword ptr [eax + 8], ecx
    mov edx, dword ptr [esi + 12]
    mov dword ptr [eax + 12], edx
    mov ecx, dword ptr [esi + 16]
    mov dword ptr [eax + 16], ecx
    ret
FUN_10021b50 ENDP
END
