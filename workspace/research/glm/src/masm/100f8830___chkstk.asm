.686
.MODEL FLAT, C
.CODE
__chkstk PROC
    cmp eax, 000001000h
    jae L0
    neg eax
    add eax, esp
    add eax, 4
    test dword ptr [eax], eax
    xchg esp, eax
    mov eax, dword ptr [eax]
    push eax
    ret
L0:
    push ecx
    lea ecx, [esp + 8]
L1:
    sub ecx, 000001000h
    sub eax, 000001000h
    test dword ptr [ecx], eax
    cmp eax, 000001000h
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
