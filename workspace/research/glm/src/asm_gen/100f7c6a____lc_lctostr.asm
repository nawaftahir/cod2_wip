; ___lc_lctostr @ 0x100f7c6a — auto-synthesized
    sub_100f7b94 PROTO C
    sub_100f7bb4 PROTO C
    sub_100fe89f PROTO C
.CODE
___lc_lctostr PROC
    push esi
    mov esi, dword ptr [esp + 0xc]
    push esi
    push dword ptr [esp + 0xc]
    call sub_100fe89f
    lea eax, [esi + 0x40]
    cmp byte ptr [eax], 0
    pop ecx
    pop ecx
    je L0
    push eax
    push 0x1017c67c
    push 2
    push dword ptr [esp + 0x14]
    call sub_100f7b94
    add esp, 0x10
    lea eax, [esi + 0x80]
    cmp byte ptr [eax], 0
    pop esi
    je L1
    push eax
    push 0x10195640
    push 2
    push dword ptr [esp + 0x10]
    call sub_100f7bb4
    add esp, 0x10
    ret
___lc_lctostr ENDP
END