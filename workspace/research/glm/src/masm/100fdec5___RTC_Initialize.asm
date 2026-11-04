.686
.MODEL FLAT, C
EXTRN sub_100FB61C:PROC
EXTRN sub_100FDF1F:PROC
.CODE
__RTC_Initialize PROC
    push 12
    push 01017C9D0h
    call sub_100FB61C
    mov dword ptr [ebp - 28], 01019C8FCh
    cmp dword ptr [ebp - 28], 01019C8FCh
    jae sub_100FDF1F
    and dword ptr [ebp - 4], 0
    mov eax, dword ptr [ebp - 28]
    mov eax, dword ptr [eax]
    test eax, eax
    je L0
    call eax
    jmp L0
    xor eax, eax
    inc eax
    ret
    mov esp, dword ptr [ebp - 24]
L0:
    or dword ptr [ebp - 4], 0FFFFFFFFh
    add dword ptr [ebp - 28], 4
__RTC_Initialize ENDP
END
