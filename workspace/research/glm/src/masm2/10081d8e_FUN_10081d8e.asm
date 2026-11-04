.686
.MODEL FLAT, C
EXTRN sub_10081D0B:PROC
.CODE
FUN_10081d8e PROC
    call sub_10081D0B
    and and dword ptr [ecx + 16], 0
    and and dword ptr [ecx + 20], 0
    mov mov dword ptr [ecx], 01010FF38h
    mov mov eax, ecx
    ret ret
FUN_10081d8e ENDP
END
