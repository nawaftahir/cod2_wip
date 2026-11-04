.686
.MODEL FLAT, C
EXTRN sub_100827C4:PROC
.CODE
FUN_10082d9b PROC
    push 8
    mov edx, ecx
    call sub_100827C4
    and dword ptr [edx + 16], 0
    and dword ptr [edx + 20], 0
    mov dword ptr [edx], 010110020h
    mov eax, edx
    ret
FUN_10082d9b ENDP
END
