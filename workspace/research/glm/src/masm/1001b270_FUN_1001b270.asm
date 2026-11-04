.686
.MODEL FLAT, C
EXTRN sub_100183D0:PROC
EXTRN sub_1001B024:PROC
EXTRN sub_1005FB12:PROC
EXTRN sub_1005FB27:PROC
EXTRN sub_1005FB3C:PROC
EXTRN sub_1005FB6E:PROC
.CODE
FUN_1001b270 PROC
    push esi
    push edi
    mov edi, eax
    mov esi, ecx
    mov eax, 01019507Ch
    call sub_100183D0
    test al, al
    je L0
    push 1
    push 010195640h
    mov ecx, esi
    call sub_1005FB12
    add esp, 8
    test eax, eax
    je L0
    mov eax, dword ptr [esp + 12]
    push 1
    push eax
    mov ecx, esi
    call sub_1005FB27
    add esp, 8
    test eax, eax
    je L0
    push 1
    push 01019563Ch
    mov ecx, esi
    call sub_1005FB3C
    add esp, 8
    test eax, eax
    je L0
    mov ecx, dword ptr [esp + 20]
    mov edx, dword ptr [esp + 16]
    push ecx
    push edx
    push edi
    push esi
    call sub_1001B024
    add esp, 16
    test al, al
    jne L1
L0:
    pop edi
    xor al, al
    pop esi
    ret
L1:
    push 1
    push 010195820h
    mov ecx, esi
    call sub_1005FB6E
    add esp, 8
    test eax, eax
    pop edi
    setne al
    pop esi
    ret
FUN_1001b270 ENDP
END
