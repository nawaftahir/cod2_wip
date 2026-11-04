; __handle_qnan1 @ 0x10102a37 — auto-synthesized
    EXTRN g_101a55b8:DWORD
    sub_100fc24f PROTO C
    sub_101029c8 PROTO C
    sub_10102ccd PROTO C
.CODE
__handle_qnan1 PROC
    push ebp
    mov ebp, esp
    cmp dword ptr [g_101a55b8], 0
    jne L0
    push dword ptr [ebp + 0x14]
    fld qword ptr [ebp + 0xc]
    sub esp, 0x18
    fstp qword ptr [esp + 0x10]
    fldz
    fstp qword ptr [esp + 8]
    fld qword ptr [ebp + 0xc]
    fstp qword ptr [esp]
    push dword ptr [ebp + 8]
    push 1
    call sub_101029c8
    add esp, 0x24
    pop ebp
    ret
    call sub_100fc24f
    push 0xffff
    push dword ptr [ebp + 0x14]
    mov dword ptr [eax], 0x21
    call sub_10102ccd
    fld qword ptr [ebp + 0xc]
    pop ecx
    pop ecx
    pop ebp
    ret
__handle_qnan1 ENDP
END