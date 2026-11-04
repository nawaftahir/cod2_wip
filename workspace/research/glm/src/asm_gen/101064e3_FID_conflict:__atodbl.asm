; FID_conflict:__atodbl @ 0x101064e3 — auto-synthesized
    EXTRN g_101a50d0:DWORD
    sub_10100d88 PROTO C
    sub_10106406 PROTO C
    sub_10106544 PROTO C
.CODE
FID_conflict:__atodbl PROC
    push ebp
    mov ebp, esp
    sub esp, 0x14
    mov eax, dword ptr [g_101a50d0]
    mov dword ptr [ebp - 4], eax
    xor eax, eax
    push eax
    push eax
    push eax
    push eax
    push dword ptr [ebp + 0xc]
    lea eax, [ebp - 0x14]
    push eax
    lea eax, [ebp - 0x10]
    push eax
    call sub_10106544
    push dword ptr [ebp + 8]
    lea eax, [ebp - 0x10]
    push eax
    call sub_10106406
    mov ecx, dword ptr [ebp - 4]
    add esp, 0x24
    call sub_10100d88
    leave
    ret
FID_conflict:__atodbl ENDP
END