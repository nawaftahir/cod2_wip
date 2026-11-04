.686
.MODEL FLAT, C
EXTRN EXTRN g_1042E778:DWORD:DWORD
.CODE
R_RenderScene PROC
    mov mov ecx, dword ptr [g_1042E778]
    mov mov eax, dword ptr [ecx + 030000h]
    mov mov edx, 030000h
    sub sub edx, eax
    cmp cmp edx, 8
    jge L0
    xor xor edx, edx
    mov mov dword ptr [ecx + 030008h], edx
    xor xor ecx, ecx
    mov mov dword ptr [ecx + 4], edx
    ret ret
    push push edi
    lea lea edi, [eax + 8]
    mov mov dword ptr [ecx + 030000h], edi
    mov mov edi, dword ptr [ecx + 030004h]
    lea lea edx, [eax + ecx]
    add add edi, 8
    mov mov dword ptr [ecx + 030004h], edi
    mov mov dword ptr [ecx + 030008h], edx
    mov mov word ptr [edx], 1
    mov mov word ptr [edx + 2], 8
    mov mov dword ptr [edx + 4], 0
    pop pop edi
    ret ret
R_RenderScene ENDP
END
