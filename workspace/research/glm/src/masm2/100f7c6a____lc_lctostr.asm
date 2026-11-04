.686
.MODEL FLAT, C
EXTRN sub_100F7B94:PROC
EXTRN sub_100F7BB4:PROC
EXTRN sub_100F7CF0:PROC
EXTRN sub_100FE89F:PROC
.CODE
___lc_lctostr PROC
    push push esi
    mov mov esi, dword ptr [esp + 12]
    push push esi
    push push dword ptr [esp + 12]
    call sub_100FE89F
    lea lea eax, [esi + 64]
    cmp cmp byte ptr [eax], 0
    pop pop ecx
    pop pop ecx
    je L0
    push push eax
    push push 01017C67Ch
    push push 2
    push push dword ptr [esp + 20]
    call sub_100F7B94
    add add esp, 16
    lea lea eax, [esi + 080h]
    cmp cmp byte ptr [eax], 0
    pop pop esi
    je sub_100F7CF0
    push push eax
    push push 010195640h
    push push 2
    push push dword ptr [esp + 16]
    call sub_100F7BB4
    add add esp, 16
    ret ret
___lc_lctostr ENDP
END
