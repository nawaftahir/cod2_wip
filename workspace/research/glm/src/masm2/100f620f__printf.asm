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
    push push 16
    push push 01017C3D8h
    call sub_100FB61C
    mov mov esi, 0101A48C0h
    push push esi
    push push 1
    call sub_100FB501
    pop pop ecx
    pop pop ecx
    and and dword ptr [ebp - 4], 0
    push push esi
    call sub_100FB582
    mov mov dword ptr [ebp - 28], eax
    lea lea eax, [ebp + 12]
    push push eax
    push push dword ptr [ebp + 8]
    push push esi
    call sub_100FA51B
    mov mov dword ptr [ebp - 32], eax
    push push esi
    push push dword ptr [ebp - 28]
    call sub_100FB626
    add add esp, 24
    or or dword ptr [ebp - 4], -1
    call sub_100F62B7
    mov mov eax, dword ptr [ebp - 32]
    call sub_100FB6A0
    ret ret
_printf ENDP
END
