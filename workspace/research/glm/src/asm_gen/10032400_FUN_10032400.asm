; FUN_10032400 @ 0x10032400 — auto-synthesized
    EXTRN fp_101d49d0:DWORD
    sub_1000bc97 PROTO C
    sub_1002e8da PROTO C
.CODE
FUN_10032400 PROC
    push ecx
    push edi
    call dword ptr [fp_101d49d0]
    cdq
    and edx, 0xff
    add eax, edx
    sar eax, 8
    test al, 1
    jne L0
    mov eax, dword ptr [esp + 0x1c]
    movzx edi, byte ptr [esp + 0x10]
    push eax
    call sub_1000bc97
    mov ecx, dword ptr [eax + 0x14]
    mov edx, dword ptr [eax + 0x10]
    add esp, 4
    push ecx
    mov ecx, dword ptr [eax + 0xc]
    push edx
    mov edx, dword ptr [eax + 8]
    push ecx
    movzx ecx, byte ptr [eax + 6]
    mov dword ptr [esp + 0x10], ecx
    mov ecx, dword ptr [esp + 0x20]
    push edx
    fild dword ptr [esp + 0x14]
    movzx edx, byte ptr [eax + 5]
    fmul dword ptr [esp + 0x34]
    movsx eax, byte ptr [eax + 3]
    sub esp, 0xc
    mov dword ptr [esp + 0x20], edx
    fstp dword ptr [esp + 8]
    fild dword ptr [esp + 0x20]
    mov dword ptr [esp + 0x20], eax
    mov eax, dword ptr [esp + 0x28]
    fmul dword ptr [esp + 0x3c]
    fstp dword ptr [esp + 4]
    fild dword ptr [esp + 0x20]
    fmul dword ptr [esp + 0x40]
    fadd dword ptr [esp + 0x34]
    fstp dword ptr [esp]
    push ecx
    call sub_1002e8da
    add esp, 0x20
    pop edi
    pop ecx
    ret
FUN_10032400 ENDP
END