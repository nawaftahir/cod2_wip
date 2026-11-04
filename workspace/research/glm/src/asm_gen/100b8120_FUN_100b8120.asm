; FUN_100b8120 @ 0x100b8120 — auto-synthesized
    sub_100b8163 PROTO C
.CODE
FUN_100b8120 PROC
    mov eax, dword ptr [ecx + 0xc8]
    and eax, 0xffff
    cmp eax, 0x200
    jae L0
    mov eax, dword ptr [ecx + 0x100]
    test word ptr [eax + 2], 0xfff0
    jne sub_100b8163
    xor eax, eax
    ret
FUN_100b8120 ENDP
END