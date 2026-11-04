; __mbsnbicoll @ 0x101094ef — auto-synthesized
    EXTRN g_1076aa34:DWORD
    sub_100fb11c PROTO C
    sub_10106e97 PROTO C
    sub_10109fd3 PROTO C
.CODE
__mbsnbicoll PROC
    push ebp
    mov ebp, esp
    call sub_100fb11c
    mov eax, dword ptr [eax + 0x60]
    cmp eax, dword ptr [g_1076aa34]
    je L0
    call sub_10106e97
    cmp dword ptr [ebp + 0x10], 0
    jne L1
    xor eax, eax
    pop ebp
    ret
    push dword ptr [eax + 4]
    push dword ptr [ebp + 0x10]
    push dword ptr [ebp + 0xc]
    push dword ptr [ebp + 0x10]
    push dword ptr [ebp + 8]
    push 1
    push dword ptr [eax + 0xc]
    call sub_10109fd3
    add esp, 0x1c
    test eax, eax
    jne L2
    mov eax, 0x7fffffff
    pop ebp
    ret
    add eax, -2
    pop ebp
    ret
__mbsnbicoll ENDP
END