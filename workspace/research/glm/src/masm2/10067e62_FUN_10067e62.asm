.686
.MODEL FLAT, C
EXTRN sub_10067D42:PROC
EXTRN sub_10067FF2:PROC
EXTRN sub_10068003:PROC
EXTRN sub_1006800A:PROC
EXTRN sub_10068010:PROC
EXTRN sub_10068011:PROC
EXTRN sub_100F7915:PROC
EXTRN sub_100F7933:PROC
EXTRN sub_100F7963:PROC
.CODE
FUN_10067e62 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 0100h
    push push esi
    mov mov esi, dword ptr [ebp + 12]
    mov mov eax, dword ptr [esi]
    cmp cmp eax, 13
    push push edi
    mov mov edi, ecx
    ja L3
    jmp jmp dword ptr [eax*4 + 010067F6Fh]
    push push 01010CAE4h
    jmp L5
    lea lea eax, [esi + 8]
    push push eax
    jmp L0
    push push dword ptr [esi + 8]
    push push 01010CAD4h
    jmp L1
    push push dword ptr [esi + 8]
    push push 01010CAC4h
    jmp L3
    push push dword ptr [esi + 8]
    push push 01010CAB4h
    jmp L4
    fld fld qword ptr [esi + 8]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push 01010CAA8h
    jmp L2
    fld fld qword ptr [esi + 8]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push 01010CA9Ch
    jmp L4
    fld fld qword ptr [esi + 8]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push 01010CA90h
    jmp L6
    fld fld qword ptr [esi + 8]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push 01010CA84h
    lea lea eax, [ebp - 0100h]
    push push 0100h
    push push eax
    call sub_100F7915
    add add esp, 20
    jmp sub_10067FF2
    push push dword ptr [esi + 8]
    push push 01010CA78h
    lea lea eax, [ebp - 0100h]
    push push 0100h
    push push eax
    call sub_100F7933
    add add esp, 16
    jmp sub_10068010
    push push 01010CA68h
    jmp sub_10068003
    push push 01010CA5Ch
    jmp sub_1006800A
    push push 01010CA50h
    jmp sub_10068011
    push push 01010CA48h
    lea lea eax, [ebp - 0100h]
    push push 0100h
    push push eax
    call sub_100F7963
    add add esp, 12
    lea lea eax, [ebp - 0100h]
    push push eax
    push push 01010CA28h
    push push dword ptr [ebp + 8]
    push push esi
    push push edi
    call sub_10067D42
    add add esp, 20
    pop pop edi
L5:
    pop pop esi
    leave leave
    ret ret 8
FUN_10067e62 ENDP
END
