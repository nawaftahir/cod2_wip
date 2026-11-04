.686
.MODEL FLAT, C
EXTRN dword_12345678:DWORD
.CODE
public myfunc
myfunc PROC
mov eax, [dword_12345678]
ret
myfunc ENDP
END
