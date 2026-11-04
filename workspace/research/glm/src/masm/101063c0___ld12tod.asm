.686
.MODEL FLAT, C
EXTRN sub_1010627A:PROC
.CODE
__ld12tod PROC
    push 0101A5490h
    push dword ptr [esp + 12]
    push dword ptr [esp + 12]
    call sub_1010627A
    add esp, 12
    ret
__ld12tod ENDP
END
