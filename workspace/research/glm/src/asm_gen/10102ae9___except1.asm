; __except1 @ 0x10102ae9 — auto-synthesized
    EXTRN g_101a50d0:DWORD
    EXTRN g_101a55b8:DWORD
    sub_10100e01 PROTO C
    sub_101024aa PROTO C
    sub_10102727 PROTO C
    sub_101029bb PROTO C
    sub_101029c6 PROTO C
    sub_10102a25 PROTO C
    sub_10102d27 PROTO C
.CODE
__except1 PROC
    push ebp
    mov ebp, esp
    and esp, 0xfffffff0
    sub esp, 0x80
    mov eax, dword ptr [g_101a50d0]
    push dword ptr [ebp + 0x20]
    mov dword ptr [esp + 0x80], eax
    lea eax, [ebp + 0x18]
    push eax
    push dword ptr [ebp + 8]
    call sub_10102727
    add esp, 0xc
    test eax, eax
    jne L0
    and dword ptr [esp + 0x40], 0xfffffffe
    lea eax, [ebp + 0x18]
    push eax
    lea eax, [ebp + 0x10]
    push eax
    push dword ptr [ebp + 0xc]
    lea eax, [ebp + 0x20]
    push dword ptr [ebp + 8]
    push eax
    lea eax, [esp + 0x14]
    push eax
    call sub_101024aa
    add esp, 0x18
    push dword ptr [ebp + 8]
    call sub_101029c6
    add esp, 4
    cmp dword ptr [g_101a55b8], 0
    jne L1
    test eax, eax
    je L1
    push dword ptr [ebp + 0x20]
    fld qword ptr [ebp + 0x18]
    sub esp, 0x18
    fstp qword ptr [esp + 0x10]
    fldz
    fstp qword ptr [esp + 8]
    fld qword ptr [ebp + 0x10]
    fstp qword ptr [esp]
    push dword ptr [ebp + 0xc]
    push eax
    call sub_10102a25
    add esp, 0x24
    jmp L2
    push eax
    call sub_101029bb
    mov dword ptr [esp], 0xffff
    push dword ptr [ebp + 0x20]
    call sub_10102d27
    fld qword ptr [ebp + 0x18]
    pop ecx
    pop ecx
    mov ecx, dword ptr [esp + 0x7c]
    call sub_10100e01
    mov esp, ebp
    pop ebp
    ret
__except1 ENDP
END