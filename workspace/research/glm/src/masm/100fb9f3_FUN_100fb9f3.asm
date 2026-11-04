.686
.MODEL FLAT, C
EXTRN sub_100FB61C:PROC
.CODE
FUN_100fb9f3 PROC
    push 12
    push 01017C870h
    call sub_100FB61C
    and dword ptr [ebp - 28], 0
    and dword ptr [ebp - 4], 0
    movapd xmm0, xmm1
    mov dword ptr [ebp - 28], 1
    jmp L0
    xor eax, eax
    inc eax
    ret
    mov esp, dword ptr [ebp - 24]
L0:
    or dword ptr [ebp - 4], 0FFFFFFFFh
FUN_100fb9f3 ENDP
END
