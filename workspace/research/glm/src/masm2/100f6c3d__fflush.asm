.686
.MODEL FLAT, C
EXTRN sub_100F6B6A:PROC
EXTRN sub_100F6B81:PROC
EXTRN sub_100F6C99:PROC
EXTRN sub_100F6CC0:PROC
EXTRN sub_100FB4DD:PROC
EXTRN sub_100FB61C:PROC
EXTRN sub_100FB690:PROC
.CODE
_fflush PROC
    push push 12
    push push 01017C458h
    call sub_100FB61C
    xor xor esi, esi
    cmp cmp dword ptr [ebp + 8], esi
    jne L0
    push push esi
    call sub_100F6B81
    pop pop ecx
    jmp sub_100F6C99
    push push dword ptr [ebp + 8]
    call sub_100FB4DD
    pop pop ecx
    mov mov dword ptr [ebp - 4], esi
    push push dword ptr [ebp + 8]
    call sub_100F6B6A
    pop pop ecx
    mov mov dword ptr [ebp - 28], eax
    or or dword ptr [ebp - 4], -1
    call sub_100F6CC0
    mov mov eax, dword ptr [ebp - 28]
    call sub_100FB690
    ret ret
_fflush ENDP
END
