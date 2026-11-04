.686
.MODEL FLAT, C
EXTRN sub_100F854E:PROC
EXTRN sub_100F8589:PROC
EXTRN sub_100FB61C:PROC
EXTRN sub_100FC00A:PROC
EXTRN sub_100FC0A0:PROC
EXTRN sub_101011D9:PROC
EXTRN sub_10101213:PROC
EXTRN g_1076AC94:DWORD
EXTRN g_1076AC98:DWORD
.CODE
_free PROC
    push 12
    push 01017C6A0h
    call sub_100FB61C
    mov esi, dword ptr [ebp + 8]
    test esi, esi
    je sub_100F854E
    cmp dword ptr [g_1076AC98], 3
    jne L2
    push 4
    call sub_100FC0A0
    pop ecx
    and dword ptr [ebp - 4], 0
    push esi
    call sub_101011D9
    pop ecx
    mov dword ptr [ebp - 28], eax
    test eax, eax
    je L0
    push esi
    push eax
    call sub_10101213
    pop ecx
    pop ecx
L0:
    or dword ptr [ebp - 4], 0FFFFFFFFh
    call L1
    cmp dword ptr [ebp - 28], 0
    jne sub_100F8589
    push dword ptr [ebp + 8]
    jmp L3
L1:
    push 4
    call sub_100FC00A
    pop ecx
    ret
L2:
    push esi
L3:
    push 0
    push dword ptr [g_1076AC94]
_free ENDP
END
