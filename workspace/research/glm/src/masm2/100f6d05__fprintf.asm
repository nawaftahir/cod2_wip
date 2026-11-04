.686
.MODEL FLAT, C
EXTRN sub_100F6DA4:PROC
EXTRN sub_100FA519:PROC
EXTRN sub_100FB4D1:PROC
EXTRN sub_100FB580:PROC
EXTRN sub_100FB61C:PROC
EXTRN sub_100FB624:PROC
EXTRN sub_100FB69E:PROC
.CODE
_fprintf PROC
    push push 20
    push push 01017C478h
    call sub_100FB61C
    mov mov esi, dword ptr [ebp + 8]
    mov mov dword ptr [ebp - 32], esi
    push push esi
    call sub_100FB4D1
    pop pop ecx
    and and dword ptr [ebp - 4], 0
    push push esi
    call sub_100FB580
    mov mov dword ptr [ebp - 28], eax
    lea lea eax, [ebp + 16]
    push push eax
    push push dword ptr [ebp + 12]
    push push esi
    call sub_100FA519
    mov mov dword ptr [ebp - 36], eax
    push push esi
    push push dword ptr [ebp - 28]
    call sub_100FB624
    add add esp, 24
    or or dword ptr [ebp - 4], -1
    call sub_100F6DA4
    mov mov eax, dword ptr [ebp - 36]
    call sub_100FB69E
    ret ret
_fprintf ENDP
END
