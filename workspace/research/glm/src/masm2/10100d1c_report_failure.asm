.686
.MODEL FLAT, C
EXTRN sub_100FB61C:PROC
EXTRN sub_10100D5D:PROC
EXTRN sub_101088AB:PROC
.CODE
report_failure PROC
    push push 8
    push push 01017E2A0h
    call sub_100FB61C
    and and dword ptr [ebp - 4], 0
    push push 0
    push push 1
    call sub_101088AB
    pop pop ecx
    pop pop ecx
    jmp sub_10100D5D
    xor xor eax, eax
    inc inc eax
    ret ret
    mov mov esp, dword ptr [ebp - 24]
    or or dword ptr [ebp - 4], -1
report_failure ENDP
END
