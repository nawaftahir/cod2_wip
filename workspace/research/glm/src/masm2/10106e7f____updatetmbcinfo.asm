.686
.MODEL FLAT, C
EXTRN sub_100F850E:PROC
EXTRN sub_100FB131:PROC
EXTRN sub_100FB61C:PROC
EXTRN sub_100FB6AD:PROC
EXTRN sub_100FC090:PROC
EXTRN sub_10106EF2:PROC
EXTRN sub_10106EF6:PROC
EXTRN sub_10106F01:PROC
EXTRN sub_10106F40:PROC
EXTRN EXTRN g_1076AA34:DWORD:DWORD
.CODE
___updatetmbcinfo PROC
    push push 16
    push push 0101821D0h
    call sub_100FB61C
    push push 13
    call sub_100FC090
    pop pop ecx
    and and dword ptr [ebp - 4], 0
    call sub_100FB131
    mov mov edi, eax
    mov mov dword ptr [ebp - 32], edi
    mov mov esi, dword ptr [edi + 96]
    mov mov dword ptr [ebp - 28], esi
    cmp cmp esi, dword ptr [g_1076AA34]
    je sub_10106F01
    test test esi, esi
    je sub_10106EF2
    dec dec dword ptr [esi]
    jne sub_10106EF6
    push push esi
    call sub_100F850E
    pop pop ecx
    mov mov eax, dword ptr [g_1076AA34]
    mov mov dword ptr [edi + 96], eax
    mov mov esi, dword ptr [g_1076AA34]
    mov mov dword ptr [ebp - 28], esi
    inc inc dword ptr [esi]
    or or dword ptr [ebp - 4], -1
    call sub_10106F40
    mov mov eax, esi
    call sub_100FB6AD
    ret ret
___updatetmbcinfo ENDP
END
