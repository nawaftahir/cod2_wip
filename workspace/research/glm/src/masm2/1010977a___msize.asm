.686
.MODEL FLAT, C
EXTRN sub_100FB61C:PROC
EXTRN sub_100FB6B4:PROC
EXTRN sub_100FC099:PROC
EXTRN sub_101011D5:PROC
EXTRN sub_101097E9:PROC
EXTRN sub_101097F7:PROC
EXTRN sub_1010982B:PROC
EXTRN sub_10109830:PROC
EXTRN EXTRN fp_1010C0AC:DWORD:DWORD
EXTRN EXTRN g_1076AC94:DWORD:DWORD
EXTRN EXTRN g_1076AC98:DWORD:DWORD
.CODE
__msize PROC
    push push 16
    push push 010182530h
    call sub_100FB61C
    cmp cmp dword ptr [g_1076AC98], 3
    jne L0
    push push 4
    call sub_100FC099
    pop pop ecx
    and and dword ptr [ebp - 4], 0
    mov mov esi, dword ptr [ebp + 8]
    push push esi
    call sub_101011D5
    pop pop ecx
    mov mov dword ptr [ebp - 32], eax
    test test eax, eax
    je sub_101097E9
    mov mov esi, dword ptr [esi - 4]
    sub sub esi, 9
    mov mov dword ptr [ebp - 28], esi
    jmp sub_101097F7
    mov mov esi, dword ptr [ebp - 28]
    or or dword ptr [ebp - 4], -1
    call sub_10109830
    cmp cmp dword ptr [ebp - 32], 0
    jne sub_1010982B
    push push dword ptr [ebp + 8]
    push push 0
    push push dword ptr [g_1076AC94]
    call dword ptr [fp_1010C0AC]
    mov mov esi, eax
    mov mov eax, esi
L0:
    call sub_100FB6B4
    ret ret
__msize ENDP
END
