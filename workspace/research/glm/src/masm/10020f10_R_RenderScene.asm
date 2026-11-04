.686
.MODEL FLAT, C
EXTRN g_1042E778:DWORD
.CODE
R_RenderScene PROC
    mov ecx, dword ptr [g_1042E778]
    mov eax, dword ptr [ecx + 000030000h]
    mov edx, 000030000h
    sub edx, eax
    cmp edx, 8
    jge L0
    xor edx, edx
    mov dword ptr [ecx + 000030008h], edx
    xor ecx, ecx
    mov dword ptr [ecx + 4], edx
    ret
L0:
    push edi
    lea edi, [eax + 8]
    mov dword ptr [ecx + 000030000h], edi
    mov edi, dword ptr [ecx + 000030004h]
    lea edx, [eax + ecx]
    add edi, 8
    mov dword ptr [ecx + 000030004h], edi
    mov dword ptr [ecx + 000030008h], edx
    mov word ptr [edx], 1
    mov word ptr [edx + 2], 8
    mov dword ptr [edx + 4], 0
    pop edi
    ret
R_RenderScene ENDP
END
