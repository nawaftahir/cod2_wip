.686
.MODEL FLAT, C
EXTRN sub_100F7873:PROC
.CODE
FUN_10081a02 PROC
    push dword ptr [ecx + 12]
    mov dword ptr [ecx], 01010FEFCh
    call sub_100F7873
    pop ecx
    ret
FUN_10081a02 ENDP
END
