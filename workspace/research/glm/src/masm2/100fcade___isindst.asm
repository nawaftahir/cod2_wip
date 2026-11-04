.686
.MODEL FLAT, C
EXTRN sub_100FB61C:PROC
EXTRN sub_100FB67F:PROC
EXTRN sub_100FC090:PROC
EXTRN sub_100FC8F6:PROC
EXTRN sub_100FCB3F:PROC
.CODE
__isindst PROC
    push push 12
    push push 01017C950h
    call sub_100FB61C
    push push 6
    call sub_100FC090
    pop pop ecx
    and and dword ptr [ebp - 4], 0
    mov mov ebx, dword ptr [ebp + 8]
    call sub_100FC8F6
    mov mov dword ptr [ebp - 28], eax
    or or dword ptr [ebp - 4], -1
    call sub_100FCB3F
    mov mov eax, dword ptr [ebp - 28]
    call sub_100FB67F
    ret ret
__isindst ENDP
END
