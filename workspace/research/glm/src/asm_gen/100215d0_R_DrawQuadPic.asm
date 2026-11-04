; R_DrawQuadPic @ 0x100215d0 — auto-synthesized
    EXTRN g_1042e778:DWORD
.CODE
R_DrawQuadPic PROC
    mov ecx, dword ptr [g_1042e778]
    mov edx, dword ptr [ecx + 0x30000]
    push esi
    mov esi, dword ptr [ecx + 0x30004]
    mov eax, 0x30000
    sub eax, edx
    lea eax, [eax + esi - 0x2000]
    cmp eax, 0x24
    pop esi
    jge L0
    mov dword ptr [ecx + 0x30008], 0
    ret
    lea eax, [edx + ecx]
    mov dword ptr [ecx + 0x30008], eax
    add edx, 0x24
    mov dword ptr [ecx + 0x30000], edx
    mov ecx, dword ptr [esp + 4]
    mov edx, dword ptr [esp + 8]
    mov word ptr [eax], 0x13
    mov word ptr [eax + 2], 0x24
    mov dword ptr [eax + 4], ecx
    mov ecx, dword ptr [edx]
    mov dword ptr [eax + 8], ecx
    mov ecx, dword ptr [esp + 0xc]
    mov edx, dword ptr [ecx]
    mov dword ptr [eax + 0xc], edx
    mov edx, dword ptr [ecx + 4]
    mov dword ptr [eax + 0x10], edx
    mov ecx, dword ptr [ecx + 8]
    mov edx, dword ptr [esp + 0x10]
    mov dword ptr [eax + 0x14], ecx
    mov ecx, dword ptr [esp + 0x14]
    mov dword ptr [eax + 0x18], edx
    mov edx, dword ptr [esp + 0x18]
    mov dword ptr [eax + 0x1c], ecx
    mov dword ptr [eax + 0x20], edx
    ret
R_DrawQuadPic ENDP
END