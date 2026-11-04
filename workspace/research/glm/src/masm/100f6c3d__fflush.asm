.686
.MODEL FLAT, C
EXTRN sub_100F6B6A:PROC
EXTRN sub_100F6B81:PROC
EXTRN sub_100F6CC0:PROC
EXTRN sub_100FB4DD:PROC
EXTRN sub_100FB61C:PROC
EXTRN sub_100FB690:PROC
.CODE
_fflush PROC
    push 12
    push 01017C458h
    call sub_100FB61C
    xor esi, esi
    cmp dword ptr [ebp + 8], esi
    jne L0
    push esi
    call sub_100F6B81
    pop ecx
    jmp L1
L0:
    push dword ptr [ebp + 8]
    call sub_100FB4DD
    pop ecx
    mov dword ptr [ebp - 4], esi
    push dword ptr [ebp + 8]
    call sub_100F6B6A
    pop ecx
    mov dword ptr [ebp - 28], eax
    or dword ptr [ebp - 4], 0FFFFFFFFh
    call sub_100F6CC0
    mov eax, dword ptr [ebp - 28]
L1:
    call sub_100FB690
    ret
_fflush ENDP
END
