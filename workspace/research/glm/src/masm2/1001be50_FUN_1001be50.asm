.686
.MODEL FLAT, C
EXTRN sub_1001C0CD:PROC
EXTRN sub_1001C0F4:PROC
EXTRN sub_1001C0FC:PROC
EXTRN sub_1001C102:PROC
EXTRN sub_1001C112:PROC
EXTRN sub_1001C125:PROC
EXTRN sub_1001C148:PROC
.CODE
FUN_1001be50 PROC
    sub sub esp, 088h
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 094h]
    push push esi
    push push edi
    mov mov dword ptr [esp + 16], 010194E20h
    mov mov dword ptr [esp + 20], 010194E18h
    mov mov dword ptr [esp + 24], 010194E08h
    mov mov dword ptr [esp + 28], 010194DF8h
    mov mov dword ptr [esp + 32], 010194DE4h
    mov mov dword ptr [esp + 36], 010194DD4h
    mov mov dword ptr [esp + 40], 010194DC0h
    mov mov dword ptr [esp + 44], 010194DA8h
    mov mov dword ptr [esp + 48], 010194D94h
    mov mov dword ptr [esp + 52], 010194D80h
    mov mov dword ptr [esp + 56], 010194D68h
    mov mov dword ptr [esp + 60], 010194D50h
    mov mov dword ptr [esp + 64], 010194D34h
    mov mov dword ptr [esp + 68], 010194D14h
    mov mov dword ptr [esp + 72], 010194CF8h
    mov mov dword ptr [esp + 76], 010194CD4h
    mov mov dword ptr [esp + 80], 010194CACh
    mov mov dword ptr [esp + 84], 010194C88h
    mov mov dword ptr [esp + 88], 010194C74h
    mov mov dword ptr [esp + 92], 010194C5Ch
    mov mov dword ptr [esp + 96], 010194C44h
    mov mov dword ptr [esp + 100], 010194C30h
    mov mov dword ptr [esp + 104], 010194C18h
    mov mov dword ptr [esp + 108], 010194C04h
    mov mov dword ptr [esp + 112], 010194BE8h
    mov mov dword ptr [esp + 116], 010194BC8h
    mov mov dword ptr [esp + 120], 010194BA8h
    mov mov dword ptr [esp + 124], 010194B94h
    mov mov dword ptr [esp + 080h], 010194B80h
    mov mov dword ptr [esp + 084h], 010194B6Ch
    mov mov dword ptr [esp + 088h], 010194B58h
    mov mov dword ptr [esp + 08Ch], 010194B40h
    mov mov dword ptr [esp + 090h], 010194B28h
    mov mov dword ptr [esp + 094h], 010194B18h
    xor xor edi, edi
    mov mov esi, dword ptr [esp + edi*4 + 16]
    mov mov ecx, ebp
    jmp sub_1001C0CD
    lea lea ecx, [ecx]
    mov mov al, byte ptr [ecx]
    mov mov bl, byte ptr [esi]
    mov mov dl, al
    cmp cmp al, bl
    jne sub_1001C102
    test test dl, dl
    je sub_1001C102
    mov mov al, byte ptr [ecx + 1]
    mov mov bl, byte ptr [esi + 1]
    mov mov dl, al
    cmp cmp al, bl
    jne sub_1001C112
    add add ecx, 2
    add add esi, 2
    test test dl, dl
    jne sub_1001C0F4
    xor xor ecx, ecx
    jmp sub_1001C125
    sbb sbb ecx, ecx
    sbb sbb ecx, -1
    test test ecx, ecx
    je sub_1001C148
    inc inc edi
    cmp cmp edi, 34
    jb sub_1001C0FC
    pop pop edi
    pop pop esi
    pop pop ebp
    mov mov eax, 34
    pop pop ebx
    add add esp, 088h
    ret ret
    mov mov eax, edi
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
FUN_1001be50 ENDP
END
