; FUN_100b8618 @ 0x100b8618 — auto-synthesized
    sub_10063791 PROTO C
.CODE
FUN_100b8618 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0xc
    push esi
    lea eax, [ebp - 0xc]
    push eax
    push 0
    push 0x1010c4bc
    mov esi, ecx
    call sub_10063791
    mov eax, dword ptr [ebp - 8]
    and dword ptr [esi + 0x30], 0
    or byte ptr [esi + 0x71], 2
    mov dword ptr [esi + 0x108], eax
    push 0x40
    pop eax
    mov dword ptr [esi + 0x28], eax
    mov dword ptr [esi + 0x2c], eax
    mov eax, dword ptr [esi + 0x6c]
    and eax, 0xfffffefe
    or eax, 0x80000202
    mov dword ptr [esi + 0x6c], eax
    mov dword ptr [esi + 0x38], 0x2000
    xor eax, eax
    pop esi
    leave
    ret
FUN_100b8618 ENDP
END