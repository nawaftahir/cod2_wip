; __inc @ 0x100f9442 — auto-synthesized
    sub_10105d70 PROTO C
.CODE
__inc PROC
    dec dword ptr [edx + 4]
    js L0
    mov ecx, dword ptr [edx]
    movzx eax, byte ptr [ecx]
    inc ecx
    mov dword ptr [edx], ecx
    ret
    push edx
    call sub_10105d70
    pop ecx
    ret
__inc ENDP
END