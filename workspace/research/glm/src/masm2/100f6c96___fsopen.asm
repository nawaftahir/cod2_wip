.686
.MODEL FLAT, C
EXTRN sub_100F6D09:PROC
EXTRN sub_100F6D31:PROC
EXTRN sub_100FB61C:PROC
EXTRN sub_100FB69C:PROC
EXTRN sub_100FC0E8:PROC
EXTRN sub_100FC233:PROC
EXTRN sub_100FC2AC:PROC
.CODE
__fsopen PROC
    push push 16
    push push 01017C468h
    call sub_100FB61C
    call sub_100FC2AC
    mov mov dword ptr [ebp - 28], eax
    test test eax, eax
    jne L0
    call sub_100FC233
    mov mov dword ptr [eax], 24
    xor xor eax, eax
    jmp sub_100F6D09
    and and dword ptr [ebp - 4], 0
    push push eax
    push push dword ptr [ebp + 16]
    push push dword ptr [ebp + 12]
    push push dword ptr [ebp + 8]
    call sub_100FC0E8
    add add esp, 16
    mov mov dword ptr [ebp - 32], eax
    or or dword ptr [ebp - 4], -1
    call sub_100F6D31
    mov mov eax, dword ptr [ebp - 32]
    call sub_100FB69C
    ret ret
__fsopen ENDP
END
