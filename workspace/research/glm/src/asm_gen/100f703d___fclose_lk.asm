; __fclose_lk @ 0x100f703d — auto-synthesized
    sub_100f6af2 PROTO C
    sub_100f850e PROTO C
    sub_100fcd40 PROTO C
    sub_100fcdd3 PROTO C
.CODE
__fclose_lk PROC
    push esi
    mov esi, dword ptr [esp + 8]
    push edi
    or edi, 0xffffffff
    test byte ptr [esi + 0xc], 0x83
    je L0
    push esi
    call sub_100f6af2
    push esi
    mov edi, eax
    call sub_100fcdd3
    push dword ptr [esi + 0x10]
    call sub_100fcd40
    add esp, 0xc
    test eax, eax
    jge L1
    or edi, 0xffffffff
    jmp L0
    mov eax, dword ptr [esi + 0x1c]
    test eax, eax
    je L0
    push eax
    call sub_100f850e
    and dword ptr [esi + 0x1c], 0
    pop ecx
    and dword ptr [esi + 0xc], 0
    mov eax, edi
    pop edi
    pop esi
    ret
__fclose_lk ENDP
END