.686
.MODEL FLAT, C
EXTRN sub_1010627A:PROC
.CODE
__ld12tod PROC
    push push 0101A5490h
    push push dword ptr [esp + 12]
    push push dword ptr [esp + 12]
    call sub_1010627A
    add add esp, 12
    ret ret
__ld12tod ENDP
END
