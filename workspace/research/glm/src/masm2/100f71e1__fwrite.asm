.686
.MODEL FLAT, C
EXTRN sub_100F7104:PROC
EXTRN sub_100F725C:PROC
EXTRN sub_100FB4CD:PROC
EXTRN sub_100FB61C:PROC
EXTRN sub_100FB68C:PROC
.CODE
_fwrite PROC
    push push 12
    push push 01017C498h
    call sub_100FB61C
    push push dword ptr [ebp + 20]
    call sub_100FB4CD
    pop pop ecx
    and and dword ptr [ebp - 4], 0
    push push dword ptr [ebp + 20]
    push push dword ptr [ebp + 16]
    push push dword ptr [ebp + 12]
    push push dword ptr [ebp + 8]
    call sub_100F7104
    add add esp, 16
    mov mov dword ptr [ebp - 28], eax
    or or dword ptr [ebp - 4], -1
    call sub_100F725C
    mov mov eax, dword ptr [ebp - 28]
    call sub_100FB68C
    ret ret
_fwrite ENDP
END
