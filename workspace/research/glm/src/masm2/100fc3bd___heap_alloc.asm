.686
.MODEL FLAT, C
EXTRN sub_100FB61C:PROC
EXTRN sub_100FB6B9:PROC
EXTRN sub_100FC0A4:PROC
EXTRN sub_100FC452:PROC
EXTRN sub_100FC46B:PROC
EXTRN sub_100FC46C:PROC
EXTRN sub_100FC46E:PROC
EXTRN sub_10101E01:PROC
EXTRN EXTRN fp_1010C130:DWORD:DWORD
EXTRN EXTRN g_1076AC70:DWORD:DWORD
EXTRN EXTRN g_1076AC94:DWORD:DWORD
EXTRN EXTRN g_1076AC98:DWORD:DWORD
.CODE
__heap_alloc PROC
    push push 12
    push push 01017C910h
    call sub_100FB61C
    mov mov esi, dword ptr [ebp + 8]
    cmp cmp dword ptr [g_1076AC98], 3
    jne L0
    cmp cmp esi, dword ptr [g_1076AC70]
    ja L1
    push push 4
    call sub_100FC0A4
    pop pop ecx
    and and dword ptr [ebp - 4], 0
    push push esi
    call sub_10101E01
    pop pop ecx
    mov mov dword ptr [ebp - 28], eax
    or or dword ptr [ebp - 4], -1
    call sub_100FC46E
    mov mov eax, dword ptr [ebp - 28]
    test test eax, eax
    jne sub_100FC46C
    test test esi, esi
    jne sub_100FC452
    inc inc esi
    cmp cmp dword ptr [g_1076AC98], 1
    je sub_100FC46B
    add add esi, 15
    and and esi, -16
    push push esi
    push push 0
    push push dword ptr [g_1076AC94]
    call dword ptr [fp_1010C130]
    call sub_100FB6B9
    ret ret
__heap_alloc ENDP
END
