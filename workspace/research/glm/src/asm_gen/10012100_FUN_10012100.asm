; FUN_10012100 @ 0x10012100 — auto-synthesized
    EXTRN fp_101d49c8:DWORD
    EXTRN g_101d1bf8:DWORD
    EXTRN g_101d4958:DWORD
    sub_10011b9b PROTO C
    sub_10011c3d PROTO C
    sub_10012215 PROTO C
    sub_10022d32 PROTO C
    sub_1002b944 PROTO C
    sub_1002b9c9 PROTO C
    sub_100efec0 PROTO C
.CODE
FUN_10012100 PROC
    push 0x10193dc4
    push 0
    call dword ptr [fp_101d49c8]
    call sub_10022d32
    push 0x10193da0
    push 0
    call dword ptr [fp_101d49c8]
    call sub_1002b944
    call sub_1002b9c9
    push 0x10193d7c
    push 0
    call dword ptr [fp_101d49c8]
    call sub_10011b9b
    push 0x10193d54
    push 0
    call dword ptr [fp_101d49c8]
    call sub_10011c3d
    push 0x10193d34
    push 0
    call dword ptr [fp_101d49c8]
    mov eax, dword ptr [g_101d1bf8]
    add esp, 0x28
    push 0x101d494c
    push 8
    mov byte ptr [g_101d4958], 0
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 0x1d8]
    test eax, eax
    jge sub_10012215
    push eax
    push eax
    call sub_100efec0
    push eax
    push 0x10193d08
    push 0
    call dword ptr [fp_101d49c8]
    add esp, 0x10
    xor al, al
    ret
FUN_10012100 ENDP
END