.686
.MODEL FLAT, C
EXTRN sub_100F6D31:PROC
EXTRN sub_100FB61C:PROC
EXTRN sub_100FB69C:PROC
EXTRN sub_100FC0E8:PROC
EXTRN sub_100FC233:PROC
EXTRN sub_100FC2AC:PROC
.CODE
__fsopen PROC
    push 16
    push 01017C468h
    call sub_100FB61C
    call sub_100FC2AC
    mov dword ptr [ebp - 28], eax
    test eax, eax
    jne L0
    call sub_100FC233
    mov dword ptr [eax], 24
    xor eax, eax
    jmp L1
L0:
    and dword ptr [ebp - 4], 0
    push eax
    push dword ptr [ebp + 16]
    push dword ptr [ebp + 12]
    push dword ptr [ebp + 8]
    call sub_100FC0E8
    add esp, 16
    mov dword ptr [ebp - 32], eax
    or dword ptr [ebp - 4], 0FFFFFFFFh
    call sub_100F6D31
    mov eax, dword ptr [ebp - 32]
L1:
    call sub_100FB69C
    ret
__fsopen ENDP
END
