.686
.MODEL FLAT, C
EXTRN sub_100F8878:PROC
.CODE
__chkstk PROC
    cmp cmp eax, 01000h
    jae L0
    neg neg eax
    add add eax, esp
    add add eax, 4
    test test dword ptr [eax], eax
    xchg xchg esp, eax
    mov mov eax, dword ptr [eax]
    push push eax
    ret ret
    push push ecx
    lea lea ecx, [esp + 8]
    sub sub ecx, 01000h
    sub sub eax, 01000h
    test test dword ptr [ecx], eax
    cmp cmp eax, 01000h
    jae sub_100F8878
    sub sub ecx, eax
    mov mov eax, esp
    test test dword ptr [ecx], eax
    mov mov esp, ecx
    mov mov ecx, dword ptr [eax]
    mov mov eax, dword ptr [eax + 4]
    push push eax
    ret ret
__chkstk ENDP
END
