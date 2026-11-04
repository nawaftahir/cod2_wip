.686
.MODEL FLAT, C
EXTRN sub_100FBFD2:PROC
EXTRN fp_1010C03C:DWORD
.CODE
__unlock_file PROC
    mov eax, dword ptr [esp + 4]
    mov ecx, 0101A48A0h
    cmp eax, ecx
    jb L0
    cmp eax, 0101A4B00h
    ja L0
    sub eax, ecx
    sar eax, 5
    add eax, 16
    push eax
    call sub_100FBFD2
    pop ecx
    ret
L0:
    add eax, 32
    push eax
    call dword ptr [fp_1010C03C]
    ret
__unlock_file ENDP
END
