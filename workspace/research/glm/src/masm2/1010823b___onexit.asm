.686
.MODEL FLAT, C
EXTRN sub_100FB61C:PROC
EXTRN sub_100FB67C:PROC
EXTRN sub_100FD625:PROC
EXTRN sub_101081B0:PROC
EXTRN sub_10108296:PROC
.CODE
__onexit PROC
    push push 12
    push push 0101822C0h
    call sub_100FB61C
    call sub_100FD625
    and and dword ptr [ebp - 4], 0
    mov mov edi, dword ptr [ebp + 8]
    call sub_101081B0
    mov mov dword ptr [ebp - 28], eax
    or or dword ptr [ebp - 4], -1
    call sub_10108296
    mov mov eax, dword ptr [ebp - 28]
    call sub_100FB67C
    ret ret
__onexit ENDP
END
