.686
.MODEL FLAT, C
EXTRN sub_1010627A:PROC
.CODE
__ld12tof PROC
    push push 0101A54A8h
    push push dword ptr [esp + 12]
    push push dword ptr [esp + 12]
    call sub_1010627A
    add add esp, 12
    ret ret
__ld12tof ENDP
END
