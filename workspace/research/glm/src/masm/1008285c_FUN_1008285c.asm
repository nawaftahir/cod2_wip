.686
.MODEL FLAT, C
EXTRN sub_100827C4:PROC
.CODE
FUN_1008285c PROC
    push 1
    mov edx, ecx
    call sub_100827C4
    and dword ptr [edx + 16], 0
    mov dword ptr [edx], 01010FFCCh
    mov eax, edx
    ret
FUN_1008285c ENDP
END
