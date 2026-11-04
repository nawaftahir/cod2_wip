.686
.MODEL FLAT, C
EXTRN sub_100827C4:PROC
.CODE
FUN_10082d9b PROC
    push push 8
    mov mov edx, ecx
    call sub_100827C4
    and and dword ptr [edx + 16], 0
    and and dword ptr [edx + 20], 0
    mov mov dword ptr [edx], 010110020h
    mov mov eax, edx
    ret ret
FUN_10082d9b ENDP
END
