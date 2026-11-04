; FUN_10106954 @ 0x10106954 — auto-synthesized
    EXTRN g_101a50d0:DWORD
    sub_10100d97 PROTO C
    sub_10106420 PROTO C
    sub_10106546 PROTO C
.CODE
FUN_10106954 PROC
    push ebp
    mov ebp, esp
    sub esp, 0x10
    mov eax, dword ptr [g_101a50d0]
    push esi
    mov dword ptr [ebp - 4], eax
    xor eax, eax
    push eax
    push eax
    push eax
    push dword ptr [ebp + 0x14]
    lea eax, [ebp - 0x10]
    push dword ptr [ebp + 0x10]
    push dword ptr [ebp + 0xc]
    push eax
    call sub_10106546
    push dword ptr [ebp + 8]
    mov esi, eax
    lea eax, [ebp - 0x10]
    push eax
    call sub_10106420
    add esp, 0x24
    cmp eax, 1
    jne L0
    or esi, 2
    mov ecx, dword ptr [ebp - 4]
    mov eax, esi
    pop esi
    call sub_10100d97
    leave
    ret
FUN_10106954 ENDP
END