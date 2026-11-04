.686
.MODEL FLAT, C
EXTRN sub_100FB61C:PROC
EXTRN sub_101088AB:PROC
.CODE
report_failure PROC
    push 8
    push 01017E2A0h
    call sub_100FB61C
    and dword ptr [ebp - 4], 0
    push 0
    push 1
    call sub_101088AB
    pop ecx
    pop ecx
    jmp L0
    xor eax, eax
    inc eax
    ret
    mov esp, dword ptr [ebp - 24]
L0:
    or dword ptr [ebp - 4], 0FFFFFFFFh
report_failure ENDP
END
