; FID_conflict:_StringCbPrintfA @ 0x100f5848 — auto-synthesized
    sub_100cc739 PROTO C
.CODE
FID_conflict:_StringCbPrintfA PROC
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
    call sub_100cc739
    pop ebp
    ret
FID_conflict:_StringCbPrintfA ENDP
END