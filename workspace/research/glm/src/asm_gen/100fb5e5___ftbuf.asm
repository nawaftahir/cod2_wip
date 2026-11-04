; __ftbuf @ 0x100fb5e5 — auto-synthesized
    sub_100f6af5 PROTO C
.CODE
__ftbuf PROC
    cmp dword ptr [esp + 4], 0
    je L0
    push esi
    mov esi, dword ptr [esp + 0xc]
    test byte ptr [esi + 0xd], 0x10
    je L1
    push esi
    call sub_100f6af5
    and byte ptr [esi + 0xd], 0xee
    and dword ptr [esi + 0x18], 0
    and dword ptr [esi], 0
    and dword ptr [esi + 8], 0
    pop ecx
    pop esi
    ret
__ftbuf ENDP
END