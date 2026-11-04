; FUN_10041390 @ 0x10041390 — auto-synthesized
    sub_10041155 PROTO C
    sub_1004127f PROTO C
.CODE
FUN_10041390 PROC
    push ebp
    mov ebp, esp
    and esp, 0xfffffff8
    mov eax, dword ptr [ebp + 8]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    jl L0
    call sub_10041155
    mov esp, ebp
    pop ebp
    ret
    push eax
    call sub_1004127f
    add esp, 4
    mov esp, ebp
    pop ebp
    ret
FUN_10041390 ENDP
END