.686
.MODEL FLAT, C
.CODE
__fload_withFB PROC
    mov eax, dword ptr [edx + 4]
    and eax, 07FF00000h
    cmp eax, 07FF00000h
    je L0
    fld qword ptr [edx]
    ret
L0:
    mov eax, dword ptr [edx + 4]
    sub esp, 10
    or eax, 07FFF0000h
    mov dword ptr [esp + 6], eax
    mov eax, dword ptr [edx + 4]
    mov ecx, dword ptr [edx]
    shld eax, ecx, 11
    shl ecx, 11
    mov dword ptr [esp + 4], eax
    mov dword ptr [esp], ecx
    fld xword ptr [esp]
    add esp, 10
    test eax, 0
    mov eax, dword ptr [edx + 4]
    ret
__fload_withFB ENDP
END
