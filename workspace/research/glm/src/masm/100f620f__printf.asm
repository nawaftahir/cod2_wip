.686
.MODEL FLAT, C
EXTRN sub_100F62B7:PROC
EXTRN sub_100FA51B:PROC
EXTRN sub_100FB501:PROC
EXTRN sub_100FB582:PROC
EXTRN sub_100FB61C:PROC
EXTRN sub_100FB626:PROC
EXTRN sub_100FB6A0:PROC
.CODE
_printf PROC
    push 16
    push 01017C3D8h
    call sub_100FB61C
    mov esi, 0101A48C0h
    push esi
    push 1
    call sub_100FB501
    pop ecx
    pop ecx
    and dword ptr [ebp - 4], 0
    push esi
    call sub_100FB582
    mov dword ptr [ebp - 28], eax
    lea eax, [ebp + 12]
    push eax
    push dword ptr [ebp + 8]
    push esi
    call sub_100FA51B
    mov dword ptr [ebp - 32], eax
    push esi
    push dword ptr [ebp - 28]
    call sub_100FB626
    add esp, 24
    or dword ptr [ebp - 4], 0FFFFFFFFh
    call sub_100F62B7
    mov eax, dword ptr [ebp - 32]
    call sub_100FB6A0
    ret
_printf ENDP
END
