; __startOneArgErrorHandling @ 0x10102ee7 — auto-synthesized
    sub_10108a2f PROTO C
.CODE
__startOneArgErrorHandling PROC
    push ebp
    mov ebp, esp
    add esp, -0x20
    mov dword ptr [ebp - 0x20], eax
    fstp qword ptr [ebp - 8]
    mov dword ptr [ebp - 0x1c], ecx
    mov eax, dword ptr [ebp + 0x10]
    mov ecx, dword ptr [ebp + 0x14]
    mov dword ptr [ebp - 0x18], eax
    mov dword ptr [ebp - 0x14], ecx
    lea eax, [ebp + 8]
    lea ecx, [ebp - 0x20]
    push eax
    push ecx
    push edx
    call sub_10108a2f
    add esp, 0xc
    fld qword ptr [ebp - 8]
    cmp word ptr [ebp + 8], 0x27f
    je L0
    fldcw word ptr [ebp + 8]
    leave
    ret
__startOneArgErrorHandling ENDP
END