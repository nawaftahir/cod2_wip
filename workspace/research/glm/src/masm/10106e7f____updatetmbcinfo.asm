.686
.MODEL FLAT, C
EXTRN sub_100F850E:PROC
EXTRN sub_100FB131:PROC
EXTRN sub_100FB61C:PROC
EXTRN sub_100FB6AD:PROC
EXTRN sub_100FC090:PROC
EXTRN sub_10106F40:PROC
EXTRN g_1076AA34:DWORD
.CODE
___updatetmbcinfo PROC
    push 16
    push 0101821D0h
    call sub_100FB61C
    push 13
    call sub_100FC090
    pop ecx
    and dword ptr [ebp - 4], 0
    call sub_100FB131
    mov edi, eax
    mov dword ptr [ebp - 32], edi
    mov esi, dword ptr [edi + 96]
    mov dword ptr [ebp - 28], esi
    cmp esi, dword ptr [g_1076AA34]
    je L1
    test esi, esi
    je L0
    dec dword ptr [esi]
    jne L0
    push esi
    call sub_100F850E
    pop ecx
L0:
    mov eax, dword ptr [g_1076AA34]
    mov dword ptr [edi + 96], eax
    mov esi, dword ptr [g_1076AA34]
    mov dword ptr [ebp - 28], esi
    inc dword ptr [esi]
L1:
    or dword ptr [ebp - 4], 0FFFFFFFFh
    call sub_10106F40
    mov eax, esi
    call sub_100FB6AD
    ret
___updatetmbcinfo ENDP
END
