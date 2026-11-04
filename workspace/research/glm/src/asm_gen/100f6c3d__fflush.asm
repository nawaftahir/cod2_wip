; _fflush @ 0x100f6c3d — auto-synthesized
    sub_100f6b6a PROTO C
    sub_100f6b81 PROTO C
    sub_100f6cc0 PROTO C
    sub_100fb4dd PROTO C
    sub_100fb61c PROTO C
    sub_100fb690 PROTO C
.CODE
_fflush PROC
    push 0xc
    push 0x1017c458
    call sub_100fb61c
    xor esi, esi
    cmp dword ptr [ebp + 8], esi
    jne L0
    push esi
    call sub_100f6b81
    pop ecx
    jmp L1
    push dword ptr [ebp + 8]
    call sub_100fb4dd
    pop ecx
    mov dword ptr [ebp - 4], esi
    push dword ptr [ebp + 8]
    call sub_100f6b6a
    pop ecx
    mov dword ptr [ebp - 0x1c], eax
    or dword ptr [ebp - 4], 0xffffffff
    call sub_100f6cc0
    mov eax, dword ptr [ebp - 0x1c]
    call sub_100fb690
    ret
_fflush ENDP
END