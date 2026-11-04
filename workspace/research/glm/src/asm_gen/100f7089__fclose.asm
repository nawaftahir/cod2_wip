; _fclose @ 0x100f7089 — auto-synthesized
    sub_100f7074 PROTO C
    sub_100f7116 PROTO C
    sub_100fb4e5 PROTO C
    sub_100fb61c PROTO C
    sub_100fb670 PROTO C
.CODE
_fclose PROC
    push 0xc
    push 0x1017c488
    call sub_100fb61c
    or dword ptr [ebp - 0x1c], 0xffffffff
    mov esi, dword ptr [ebp + 8]
    test byte ptr [esi + 0xc], 0x40
    je L0
    and dword ptr [esi + 0xc], 0
    mov eax, dword ptr [ebp - 0x1c]
    call sub_100fb670
    ret
    push esi
    call sub_100fb4e5
    pop ecx
    and dword ptr [ebp - 4], 0
    push esi
    call sub_100f7074
    pop ecx
    mov dword ptr [ebp - 0x1c], eax
    or dword ptr [ebp - 4], 0xffffffff
    call sub_100f7116
    jmp L1
_fclose ENDP
END