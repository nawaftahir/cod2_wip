.686
.MODEL FLAT, C
EXTRN sub_100FB53C:PROC
EXTRN sub_100FB543:PROC
EXTRN sub_100FBFD2:PROC
EXTRN EXTRN fp_1010C03C:DWORD:DWORD
.CODE
__unlock_file PROC
    mov mov eax, dword ptr [esp + 4]
    mov mov ecx, 0101A48A0h
    cmp cmp eax, ecx
    jb sub_100FB53C
    cmp cmp eax, 0101A4B00h
    ja sub_100FB543
    sub sub eax, ecx
    sar sar eax, 5
    add add eax, 16
    push push eax
    call sub_100FBFD2
    pop pop ecx
    ret ret
    add add eax, 32
    push push eax
    call dword ptr [fp_1010C03C]
    ret ret
__unlock_file ENDP
END
