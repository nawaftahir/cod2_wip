; __RTC_Initialize @ 0x100fdec5 — auto-synthesized
    sub_100fb61c PROTO C
    sub_100fdf1f PROTO C
.CODE
__RTC_Initialize PROC
    push 0xc
    push 0x1017c9d0
    call sub_100fb61c
    mov dword ptr [ebp - 0x1c], 0x1019c8fc
    cmp dword ptr [ebp - 0x1c], 0x1019c8fc
    jae sub_100fdf1f
    and dword ptr [ebp - 4], 0
    mov eax, dword ptr [ebp - 0x1c]
    mov eax, dword ptr [eax]
    test eax, eax
    je L0
    call eax
    jmp L0
    xor eax, eax
    inc eax
    ret
    mov esp, dword ptr [ebp - 0x18]
    or dword ptr [ebp - 4], 0xffffffff
    add dword ptr [ebp - 0x1c], 4
__RTC_Initialize ENDP
END