.686
.MODEL FLAT, C
EXTRN sub_100FB61C:PROC
EXTRN sub_100FBA3C:PROC
.CODE
FUN_100fb9f3 PROC
    push push 12
    push push 01017C870h
    call sub_100FB61C
    and and dword ptr [ebp - 28], 0
    and and dword ptr [ebp - 4], 0
    movapd movapd xmm0, xmm1
    mov mov dword ptr [ebp - 28], 1
    jmp sub_100FBA3C
    xor xor eax, eax
    inc inc eax
    ret ret
    mov mov esp, dword ptr [ebp - 24]
    or or dword ptr [ebp - 4], -1
FUN_100fb9f3 ENDP
END
