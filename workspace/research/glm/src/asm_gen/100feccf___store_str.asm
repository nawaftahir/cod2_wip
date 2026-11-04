; __store_str @ 0x100feccf — auto-synthesized
.CODE
__store_str PROC
    cmp dword ptr [eax], 0
    push esi
    mov esi, edx
    je L0
    push edi
    mov dl, byte ptr [esi]
    test dl, dl
    je L1
    mov edi, dword ptr [ecx]
    mov byte ptr [edi], dl
    inc dword ptr [ecx]
    inc esi
    dec dword ptr [eax]
    cmp dword ptr [eax], 0
    jne L2
    pop edi
    pop esi
    ret
__store_str ENDP
END