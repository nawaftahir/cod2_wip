.686
.MODEL FLAT, C
EXTRN sub_1010627A:PROC
.CODE
__ld12tof PROC
    push 0101A54A8h
    push dword ptr [esp + 12]
    push dword ptr [esp + 12]
    call sub_1010627A
    add esp, 12
    ret
__ld12tof ENDP
END
