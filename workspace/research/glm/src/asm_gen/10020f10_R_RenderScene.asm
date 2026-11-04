; R_RenderScene @ 0x10020f10 — auto-synthesized
    EXTRN g_1042e778:DWORD
.CODE
R_RenderScene PROC
    mov ecx, dword ptr [g_1042e778]
    mov eax, dword ptr [ecx + 0x30000]
    mov edx, 0x30000
    sub edx, eax
    cmp edx, 8
    jge L0
    xor edx, edx
    mov dword ptr [ecx + 0x30008], edx
    xor ecx, ecx
    mov dword ptr [ecx + 4], edx
    ret
    push edi
    lea edi, [eax + 8]
    mov dword ptr [ecx + 0x30000], edi
    mov edi, dword ptr [ecx + 0x30004]
    lea edx, [eax + ecx]
    add edi, 8
    mov dword ptr [ecx + 0x30004], edi
    mov dword ptr [ecx + 0x30008], edx
    mov word ptr [edx], 1
    mov word ptr [edx + 2], 8
    mov dword ptr [edx + 4], 0
    pop edi
    ret
R_RenderScene ENDP
END