.686
.MODEL FLAT, C
EXTRN sub_100F7104:PROC
EXTRN sub_100F725C:PROC
EXTRN sub_100FB4CD:PROC
EXTRN sub_100FB61C:PROC
EXTRN sub_100FB68C:PROC
.CODE
_fwrite PROC
    push 12
    push 01017C498h
    call sub_100FB61C
    push dword ptr [ebp + 20]
    call sub_100FB4CD
    pop ecx
    and dword ptr [ebp - 4], 0
    push dword ptr [ebp + 20]
    push dword ptr [ebp + 16]
    push dword ptr [ebp + 12]
    push dword ptr [ebp + 8]
    call sub_100F7104
    add esp, 16
    mov dword ptr [ebp - 28], eax
    or dword ptr [ebp - 4], 0FFFFFFFFh
    call sub_100F725C
    mov eax, dword ptr [ebp - 28]
    call sub_100FB68C
    ret
_fwrite ENDP
END
