.686
.MODEL FLAT, C
EXTRN sub_100FB61C:PROC
EXTRN sub_100FB68D:PROC
EXTRN sub_100FC09A:PROC
EXTRN sub_100FC4A4:PROC
EXTRN sub_100FCADD:PROC
EXTRN g_101ADFDC:DWORD
.CODE
___tzset PROC
    push 8
    push 01017C930h
    call sub_100FB61C
    xor esi, esi
    cmp dword ptr [g_101ADFDC], esi
    jne L1
    push 6
    call sub_100FC09A
    pop ecx
    mov dword ptr [ebp - 4], esi
    cmp dword ptr [g_101ADFDC], esi
    jne L0
    call sub_100FC4A4
    inc dword ptr [g_101ADFDC]
L0:
    or dword ptr [ebp - 4], 0FFFFFFFFh
    call sub_100FCADD
L1:
    call sub_100FB68D
    ret
___tzset ENDP
END
