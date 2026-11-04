; __unlock_fhandle @ 0x101077f1 — auto-synthesized
    EXTRN fp_1010c03c:DWORD
.CODE
__unlock_fhandle PROC
    mov eax, dword ptr [esp + 4]
    mov ecx, eax
    and eax, 0x1f
    sar ecx, 5
    mov ecx, dword ptr [ecx*4 + 0x1076aca0]
    lea eax, [eax + eax*8]
    lea eax, [ecx + eax*4 + 0xc]
    push eax
    call dword ptr [fp_1010c03c]
    ret
__unlock_fhandle ENDP
END