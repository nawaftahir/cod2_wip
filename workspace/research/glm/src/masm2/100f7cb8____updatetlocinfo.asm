.686
.MODEL FLAT, C
EXTRN sub_100F7AC3:PROC
EXTRN sub_100F7D13:PROC
EXTRN sub_100FB61C:PROC
EXTRN sub_100FB67C:PROC
EXTRN sub_100FC090:PROC
.CODE
___updatetlocinfo PROC
    push push 12
    push push 01017C680h
    call sub_100FB61C
    push push 12
    call sub_100FC090
    pop pop ecx
    and and dword ptr [ebp - 4], 0
    call sub_100F7AC3
    mov mov dword ptr [ebp - 28], eax
    or or dword ptr [ebp - 4], -1
    call sub_100F7D13
    mov mov eax, dword ptr [ebp - 28]
    call sub_100FB67C
    ret ret
___updatetlocinfo ENDP
END
