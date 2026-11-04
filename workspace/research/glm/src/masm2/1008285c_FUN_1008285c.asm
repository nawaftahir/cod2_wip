.686
.MODEL FLAT, C
EXTRN sub_100827C4:PROC
.CODE
FUN_1008285c PROC
    push push 1
    mov mov edx, ecx
    call sub_100827C4
    and and dword ptr [edx + 16], 0
    mov mov dword ptr [edx], 01010FFCCh
    mov mov eax, edx
    ret ret
FUN_1008285c ENDP
END
