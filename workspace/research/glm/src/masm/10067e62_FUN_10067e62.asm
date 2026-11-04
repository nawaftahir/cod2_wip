.686
.MODEL FLAT, C
EXTRN sub_10067D42:PROC
EXTRN sub_100F7915:PROC
EXTRN sub_100F7933:PROC
EXTRN sub_100F7963:PROC
.CODE
FUN_10067e62 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 000000100h
    push esi
    mov esi, dword ptr [ebp + 12]
    mov eax, dword ptr [esi]
    cmp eax, 13
    push edi
    mov edi, ecx
    ja L3
    jmp dword ptr [eax*4 + 0x10067f6f]
    push 01010CAE4h
    jmp L4
    lea eax, [esi + 8]
    push eax
    jmp L1
    push dword ptr [esi + 8]
    push 01010CAD4h
    jmp L2
    push dword ptr [esi + 8]
    push 01010CAC4h
    jmp L2
    push dword ptr [esi + 8]
    push 01010CAB4h
    jmp L2
    fld qword ptr [esi + 8]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push 01010CAA8h
    jmp L0
    fld qword ptr [esi + 8]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push 01010CA9Ch
    jmp L0
    fld qword ptr [esi + 8]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push 01010CA90h
    jmp L0
    fld qword ptr [esi + 8]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push 01010CA84h
L0:
    lea eax, [ebp - 000000100h]
    push 000000100h
    push eax
    call sub_100F7915
    add esp, 20
    jmp L5
    push dword ptr [esi + 8]
L1:
    push 01010CA78h
L2:
    lea eax, [ebp - 000000100h]
    push 000000100h
    push eax
    call sub_100F7933
    add esp, 16
    jmp L5
    push 01010CA68h
    jmp L4
    push 01010CA5Ch
    jmp L4
    push 01010CA50h
    jmp L4
L3:
    push 01010CA48h
L4:
    lea eax, [ebp - 000000100h]
    push 000000100h
    push eax
    call sub_100F7963
    add esp, 12
L5:
    lea eax, [ebp - 000000100h]
    push eax
    push 01010CA28h
    push dword ptr [ebp + 8]
    push esi
    push edi
    call sub_10067D42
    add esp, 20
    pop edi
    pop esi
    leave
    ret 8
FUN_10067e62 ENDP
END
