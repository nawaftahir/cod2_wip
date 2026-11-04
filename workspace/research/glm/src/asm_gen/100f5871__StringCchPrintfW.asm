; _StringCchPrintfW @ 0x100f5871 — auto-synthesized
    sub_100cc785 PROTO C
.CODE
_StringCchPrintfW PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    cmp dword ptr [ebp + 0xc], 0x7fffffff
    jbe L0
    mov eax, 0x80070057
    pop ebp
    ret
    lea eax, [ebp + 0x14]
    push eax
    push dword ptr [ebp + 0x10]
    push dword ptr [ebp + 0xc]
    push dword ptr [ebp + 8]
    call sub_100cc785
    pop ebp
    ret
_StringCchPrintfW ENDP
END