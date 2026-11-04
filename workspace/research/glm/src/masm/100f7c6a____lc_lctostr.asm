.686
.MODEL FLAT, C
EXTRN sub_100F7B94:PROC
EXTRN sub_100F7BB4:PROC
EXTRN sub_100FE89F:PROC
.CODE
___lc_lctostr PROC
    push esi
    mov esi, dword ptr [esp + 12]
    push esi
    push dword ptr [esp + 12]
    call sub_100FE89F
    lea eax, [esi + 64]
    cmp byte ptr [eax], 0
    pop ecx
    pop ecx
    je L0
    push eax
    push 01017C67Ch
    push 2
    push dword ptr [esp + 20]
    call sub_100F7B94
    add esp, 16
L0:
    lea eax, [esi + 000000080h]
    cmp byte ptr [eax], 0
    pop esi
    je L1
    push eax
    push 010195640h
    push 2
    push dword ptr [esp + 16]
    call sub_100F7BB4
    add esp, 16
L1:
    ret
___lc_lctostr ENDP
END
