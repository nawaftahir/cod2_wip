; _strncnt @ 0x10109f7c — auto-synthesized
.CODE
_strncnt PROC
    mov ecx, dword ptr [esp + 4]
    test ecx, ecx
    je L0
    dec ecx
    cmp byte ptr [eax], 0
    je L1
    inc eax
    test ecx, ecx
    jne L2
    dec ecx
    mov eax, dword ptr [esp + 4]
    sub eax, ecx
    dec eax
    ret
_strncnt ENDP
END