.686
.MODEL FLAT, C
EXTRN sub_100FB61C:PROC
EXTRN sub_100FB67F:PROC
EXTRN sub_100FC090:PROC
EXTRN sub_100FC8F6:PROC
EXTRN sub_100FCB3F:PROC
.CODE
__isindst PROC
    push 12
    push 01017C950h
    call sub_100FB61C
    push 6
    call sub_100FC090
    pop ecx
    and dword ptr [ebp - 4], 0
    mov ebx, dword ptr [ebp + 8]
    call sub_100FC8F6
    mov dword ptr [ebp - 28], eax
    or dword ptr [ebp - 4], 0FFFFFFFFh
    call sub_100FCB3F
    mov eax, dword ptr [ebp - 28]
    call sub_100FB67F
    ret
__isindst ENDP
END
