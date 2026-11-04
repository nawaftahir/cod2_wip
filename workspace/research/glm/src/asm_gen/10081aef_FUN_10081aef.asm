; FUN_10081aef @ 0x10081aef — auto-synthesized
    sub_10081a1d PROTO C
.CODE
FUN_10081aef PROC
    mov eax, dword ptr [ecx + 0xc]
    test eax, eax
    mov dword ptr [ecx], 0x1010ff18
    je L0
    movzx edx, byte ptr [eax - 1]
    sub eax, edx
    mov dword ptr [ecx + 0xc], eax
    jmp sub_10081a1d
FUN_10081aef ENDP
END