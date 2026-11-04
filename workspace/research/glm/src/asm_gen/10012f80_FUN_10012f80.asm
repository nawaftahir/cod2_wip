; FUN_10012f80 @ 0x10012f80 — auto-synthesized
    EXTRN fp_101d49c8:DWORD
    EXTRN fp_101d4bbc:DWORD
    EXTRN g_101d481c:DWORD
    EXTRN g_101d7e10:DWORD
    EXTRN g_10764558:DWORD
    sub_100052e6 PROTO C
    sub_1000ab11 PROTO C
    sub_1000bd26 PROTO C
    sub_10012cba PROTO C
    sub_10012e9b PROTO C
    sub_10012f30 PROTO C
    sub_10020b80 PROTO C
    sub_10029465 PROTO C
    sub_1003aa6f PROTO C
    sub_1005ee0f PROTO C
    sub_1006078c PROTO C
.CODE
FUN_10012f80 PROC
    push ebp
    mov ebp, esp
    and esp, 0xfffffff8
    sub esp, 0xc
    push esi
    push 0x10193adc
    push 0
    call dword ptr [fp_101d49c8]
    call sub_1006078c
    call sub_1000ab11
    call sub_100052e6
    call sub_10012e9b
    call sub_10020b80
    call sub_10029465
    call sub_10012cba
    push 1
    push 0x10197950
    call sub_1000bd26
    mov dword ptr [g_10764558], eax
    call sub_10012f30
    mov eax, 0x101d7210
    mov esi, 0x101d7a10
    call sub_1005ee0f
    push 0
    push 0x101d7e14
    push 0
    lea eax, [esp + 0x20]
    push 1
    push eax
    mov dword ptr [esp + 0x28], 0
    mov dword ptr [esp + 0x2c], 0
    mov dword ptr [esp + 0x30], 0
    call dword ptr [fp_101d4bbc]
    add esp, 0x24
    mov dword ptr [g_101d7e10], 0x101d7e14
    call sub_1003aa6f
    mov dword ptr [g_101d481c], eax
    pop esi
    mov esp, ebp
    pop ebp
    ret
FUN_10012f80 ENDP
END