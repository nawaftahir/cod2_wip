.686
.MODEL FLAT, C
EXTRN sub_100FB4EA:PROC
EXTRN sub_100FB4F1:PROC
EXTRN sub_100FC09F:PROC
EXTRN EXTRN fp_1010C030:DWORD:DWORD
.CODE
__lock_file PROC
    mov mov eax, dword ptr [esp + 4]
    mov mov ecx, 0101A48A0h
    cmp cmp eax, ecx
    jb sub_100FB4EA
    cmp cmp eax, 0101A4B00h
    ja sub_100FB4F1
    sub sub eax, ecx
    sar sar eax, 5
    add add eax, 16
    push push eax
    call sub_100FC09F
    pop pop ecx
    ret ret
    add add eax, 32
    push push eax
    call dword ptr [fp_1010C030]
    ret ret
__lock_file ENDP
END
