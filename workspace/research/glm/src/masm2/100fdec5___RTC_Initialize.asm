.686
.MODEL FLAT, C
EXTRN sub_100FB61C:PROC
EXTRN sub_100FDF1F:PROC
EXTRN sub_100FDF22:PROC
EXTRN sub_100FDF26:PROC
.CODE
__RTC_Initialize PROC
    push push 12
    push push 01017C9D0h
    call sub_100FB61C
    mov mov dword ptr [ebp - 28], 01019C8FCh
    cmp cmp dword ptr [ebp - 28], 01019C8FCh
    jae sub_100FDF1F
    and and dword ptr [ebp - 4], 0
    mov mov eax, dword ptr [ebp - 28]
    mov mov eax, dword ptr [eax]
    test test eax, eax
    je sub_100FDF22
    call call eax
    jmp sub_100FDF26
    xor xor eax, eax
    inc inc eax
    ret ret
    mov mov esp, dword ptr [ebp - 24]
    or or dword ptr [ebp - 4], -1
    add add dword ptr [ebp - 28], 4
__RTC_Initialize ENDP
END
