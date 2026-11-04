; R_BeginDelayedDrawing @ 0x10020f70 — auto-synthesized
    EXTRN g_1042e778:DWORD
.CODE
R_BeginDelayedDrawing PROC
    mov eax, dword ptr [g_1042e778]
    mov edx, dword ptr [eax + 0x30000]
    mov ecx, 0x30000
    sub ecx, edx
    cmp ecx, 4
    jge L0
    mov ecx, edx
    mov edx, dword ptr [esp + 4]
    add ecx, eax
    mov dword ptr [eax + 0x30008], 0
    mov dword ptr [eax + edx + 4], ecx
    ret
    lea ecx, [edx + eax]
    add edx, 4
    mov dword ptr [eax + 0x30000], edx
    mov edx, dword ptr [eax + 0x30004]
    mov dword ptr [eax + 0x30008], ecx
    add edx, 4
    mov dword ptr [eax + 0x30004], edx
    mov edx, dword ptr [esp + 4]
    mov word ptr [ecx], 3
    mov word ptr [ecx + 2], 4
    mov ecx, dword ptr [eax + 0x30000]
    add ecx, eax
    mov dword ptr [eax + edx + 4], ecx
    ret
R_BeginDelayedDrawing ENDP
END