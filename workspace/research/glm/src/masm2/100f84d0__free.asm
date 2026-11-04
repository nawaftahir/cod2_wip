.686
.MODEL FLAT, C
EXTRN sub_100F8545:PROC
EXTRN sub_100F8548:PROC
EXTRN sub_100F854E:PROC
EXTRN sub_100F856B:PROC
EXTRN sub_100F8580:PROC
EXTRN sub_100F8589:PROC
EXTRN sub_100FB61C:PROC
EXTRN sub_100FC00A:PROC
EXTRN sub_100FC0A0:PROC
EXTRN sub_101011D9:PROC
EXTRN sub_10101213:PROC
EXTRN EXTRN g_1076AC94:DWORD:DWORD
EXTRN EXTRN g_1076AC98:DWORD:DWORD
.CODE
_free PROC
    push push 12
    push push 01017C6A0h
    call sub_100FB61C
    mov mov esi, dword ptr [ebp + 8]
    test test esi, esi
    je sub_100F854E
    cmp cmp dword ptr [g_1076AC98], 3
    jne sub_100F8548
    push push 4
    call sub_100FC0A0
    pop pop ecx
    and and dword ptr [ebp - 4], 0
    push push esi
    call sub_101011D9
    pop pop ecx
    mov mov dword ptr [ebp - 28], eax
    test test eax, eax
    je sub_100F8545
    push push esi
    push push eax
    call sub_10101213
    pop pop ecx
    pop pop ecx
    or or dword ptr [ebp - 4], -1
    call sub_100F856B
    cmp cmp dword ptr [ebp - 28], 0
    jne sub_100F8589
    push push dword ptr [ebp + 8]
    jmp sub_100F8580
    push push 4
    call sub_100FC00A
    pop pop ecx
    ret ret
    push push esi
    push push 0
    push push dword ptr [g_1076AC94]
_free ENDP
END
