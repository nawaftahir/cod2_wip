.686
.MODEL FLAT, C
EXTRN sub_100F7AC3:PROC
EXTRN sub_100F7D13:PROC
EXTRN sub_100FB61C:PROC
EXTRN sub_100FB67C:PROC
EXTRN sub_100FC090:PROC
.CODE
___updatetlocinfo PROC
    push 12
    push 01017C680h
    call sub_100FB61C
    push 12
    call sub_100FC090
    pop ecx
    and dword ptr [ebp - 4], 0
    call sub_100F7AC3
    mov dword ptr [ebp - 28], eax
    or dword ptr [ebp - 4], 0FFFFFFFFh
    call sub_100F7D13
    mov eax, dword ptr [ebp - 28]
    call sub_100FB67C
    ret
___updatetlocinfo ENDP
END
