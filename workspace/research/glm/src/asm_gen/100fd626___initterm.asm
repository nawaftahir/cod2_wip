; __initterm @ 0x100fd626 — auto-synthesized
.CODE
__initterm PROC
    push esi
    mov esi, eax
    jmp L0
    mov eax, dword ptr [esi]
    test eax, eax
    je L1
    call eax
    add esi, 4
    cmp esi, dword ptr [esp + 8]
    jb L2
    pop esi
    ret
__initterm ENDP
END