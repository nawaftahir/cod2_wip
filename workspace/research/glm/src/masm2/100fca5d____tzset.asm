.686
.MODEL FLAT, C
EXTRN sub_100FB61C:PROC
EXTRN sub_100FB68D:PROC
EXTRN sub_100FC09A:PROC
EXTRN sub_100FC4A4:PROC
EXTRN sub_100FCAB0:PROC
EXTRN sub_100FCABA:PROC
EXTRN sub_100FCADD:PROC
EXTRN EXTRN g_101ADFDC:DWORD:DWORD
.CODE
___tzset PROC
    push push 8
    push push 01017C930h
    call sub_100FB61C
    xor xor esi, esi
    cmp cmp dword ptr [g_101ADFDC], esi
    jne sub_100FCAB0
    push push 6
    call sub_100FC09A
    pop pop ecx
    mov mov dword ptr [ebp - 4], esi
    cmp cmp dword ptr [g_101ADFDC], esi
    jne sub_100FCABA
    call sub_100FC4A4
    inc inc dword ptr [g_101ADFDC]
    or or dword ptr [ebp - 4], -1
    call sub_100FCADD
    call sub_100FB68D
    ret ret
___tzset ENDP
END
