; __chkstk @ 0x100f8830 — auto-synthesized
.CODE
__chkstk PROC
    cmp eax, 0x1000
    jae L0
    neg eax
    add eax, esp
    add eax, 4
    test dword ptr [eax], eax
    xchg esp, eax
    mov eax, dword ptr [eax]
    push eax
    ret
    push ecx
    lea ecx, [esp + 8]
    sub ecx, 0x1000
    sub eax, 0x1000
    test dword ptr [ecx], eax
    cmp eax, 0x1000
    jae L1
    sub ecx, eax
    mov eax, esp
    test dword ptr [ecx], eax
    mov esp, ecx
    mov ecx, dword ptr [eax]
    mov eax, dword ptr [eax + 4]
    push eax
    ret
__chkstk ENDP
END