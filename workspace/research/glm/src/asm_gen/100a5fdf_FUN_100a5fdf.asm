; FUN_100a5fdf @ 0x100a5fdf — auto-synthesized
    sub_100a6022 PROTO C
.CODE
FUN_100a5fdf PROC
    mov eax, dword ptr [ecx + 0xc8]
    and eax, 0xffff
    cmp eax, 0x200
    jae L0
    mov eax, dword ptr [ecx + 0x100]
    test word ptr [eax + 2], 0xfff0
    jne sub_100a6022
    xor eax, eax
    ret
FUN_100a5fdf ENDP
END