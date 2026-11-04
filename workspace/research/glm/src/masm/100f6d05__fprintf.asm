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
    push 20
    push 01017C478h
    call sub_100FB61C
    mov esi, dword ptr [ebp + 8]
    mov dword ptr [ebp - 32], esi
    push esi
    call sub_100FB4D1
    pop ecx
    and dword ptr [ebp - 4], 0
    push esi
    call sub_100FB580
    mov dword ptr [ebp - 28], eax
    lea eax, [ebp + 16]
    push eax
    push dword ptr [ebp + 12]
    push esi
    call sub_100FA519
    mov dword ptr [ebp - 36], eax
    push esi
    push dword ptr [ebp - 28]
    call sub_100FB624
    add esp, 24
    or dword ptr [ebp - 4], 0FFFFFFFFh
    call sub_100F6DA4
    mov eax, dword ptr [ebp - 36]
    call sub_100FB69E
    ret
_fprintf ENDP
END
