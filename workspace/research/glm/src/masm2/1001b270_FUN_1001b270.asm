.686
.MODEL FLAT, C
EXTRN sub_100183D0:PROC
EXTRN sub_1001B024:PROC
EXTRN sub_1001B304:PROC
EXTRN sub_1001B319:PROC
EXTRN sub_1001B32E:PROC
EXTRN sub_1001B34B:PROC
EXTRN sub_1005FB12:PROC
EXTRN sub_1005FB27:PROC
EXTRN sub_1005FB3C:PROC
EXTRN sub_1005FB6E:PROC
.CODE
FUN_1001b270 PROC
    push push esi
    push push edi
    mov mov edi, eax
    mov mov esi, ecx
    mov mov eax, 01019507Ch
    call sub_100183D0
    test test al, al
    je L0
    push push 1
    push push 010195640h
    mov mov ecx, esi
    call sub_1005FB12
    add add esp, 8
    test test eax, eax
    je sub_1001B304
    mov mov eax, dword ptr [esp + 12]
    push push 1
    push push eax
    mov mov ecx, esi
    call sub_1005FB27
    add add esp, 8
    test test eax, eax
    je sub_1001B319
    push push 1
    push push 01019563Ch
    mov mov ecx, esi
    call sub_1005FB3C
    add add esp, 8
    test test eax, eax
    je sub_1001B32E
    mov mov ecx, dword ptr [esp + 20]
    mov mov edx, dword ptr [esp + 16]
    push push ecx
    push push edx
    push push edi
    push push esi
    call sub_1001B024
    add add esp, 16
    test test al, al
    jne sub_1001B34B
    pop pop edi
    xor xor al, al
    pop pop esi
    ret ret
    push push 1
    push push 010195820h
    mov mov ecx, esi
    call sub_1005FB6E
    add add esp, 8
    test test eax, eax
    pop pop edi
    setne setne al
    pop pop esi
    ret ret
FUN_1001b270 ENDP
END
