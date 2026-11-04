.686
.MODEL FLAT, C
EXTRN sub_100FB61C:PROC
EXTRN sub_100FB6B9:PROC
EXTRN sub_100FC0A4:PROC
EXTRN sub_100FC46E:PROC
EXTRN sub_10101E01:PROC
EXTRN fp_1010C130:DWORD
EXTRN g_1076AC70:DWORD
EXTRN g_1076AC94:DWORD
EXTRN g_1076AC98:DWORD
.CODE
__heap_alloc PROC
    push 12
    push 01017C910h
    call sub_100FB61C
    mov esi, dword ptr [ebp + 8]
    cmp dword ptr [g_1076AC98], 3
    jne L0
    cmp esi, dword ptr [g_1076AC70]
    ja L0
    push 4
    call sub_100FC0A4
    pop ecx
    and dword ptr [ebp - 4], 0
    push esi
    call sub_10101E01
    pop ecx
    mov dword ptr [ebp - 28], eax
    or dword ptr [ebp - 4], 0FFFFFFFFh
    call sub_100FC46E
    mov eax, dword ptr [ebp - 28]
    test eax, eax
    jne L3
L0:
    test esi, esi
    jne L1
    inc esi
L1:
    cmp dword ptr [g_1076AC98], 1
    je L2
    add esi, 15
    and esi, 0FFFFFFF0h
L2:
    push esi
    push 0
    push dword ptr [g_1076AC94]
    call dword ptr [fp_1010C130]
L3:
    call sub_100FB6B9
    ret
__heap_alloc ENDP
END
