.686
.MODEL FLAT, C
EXTRN sub_100FB61C:PROC
EXTRN sub_100FB6B4:PROC
EXTRN sub_100FC099:PROC
EXTRN sub_101011D5:PROC
EXTRN sub_10109830:PROC
EXTRN fp_1010C0AC:DWORD
EXTRN g_1076AC94:DWORD
EXTRN g_1076AC98:DWORD
.CODE
__msize PROC
    push 16
    push 010182530h
    call sub_100FB61C
    cmp dword ptr [g_1076AC98], 3
    jne L2
    push 4
    call sub_100FC099
    pop ecx
    and dword ptr [ebp - 4], 0
    mov esi, dword ptr [ebp + 8]
    push esi
    call sub_101011D5
    pop ecx
    mov dword ptr [ebp - 32], eax
    test eax, eax
    je L0
    mov esi, dword ptr [esi - 4]
    sub esi, 9
    mov dword ptr [ebp - 28], esi
    jmp L1
L0:
    mov esi, dword ptr [ebp - 28]
L1:
    or dword ptr [ebp - 4], 0FFFFFFFFh
    call sub_10109830
    cmp dword ptr [ebp - 32], 0
    jne L3
L2:
    push dword ptr [ebp + 8]
    push 0
    push dword ptr [g_1076AC94]
    call dword ptr [fp_1010C0AC]
    mov esi, eax
L3:
    mov eax, esi
    call sub_100FB6B4
    ret
__msize ENDP
END
