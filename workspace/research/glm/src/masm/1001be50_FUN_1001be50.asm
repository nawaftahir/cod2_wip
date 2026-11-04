.686
.MODEL FLAT, C
.CODE
FUN_1001be50 PROC
    sub esp, 000000088h
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 000000094h]
    push esi
    push edi
    mov dword ptr [esp + 16], 010194E20h
    mov dword ptr [esp + 20], 010194E18h
    mov dword ptr [esp + 24], 010194E08h
    mov dword ptr [esp + 28], 010194DF8h
    mov dword ptr [esp + 32], 010194DE4h
    mov dword ptr [esp + 36], 010194DD4h
    mov dword ptr [esp + 40], 010194DC0h
    mov dword ptr [esp + 44], 010194DA8h
    mov dword ptr [esp + 48], 010194D94h
    mov dword ptr [esp + 52], 010194D80h
    mov dword ptr [esp + 56], 010194D68h
    mov dword ptr [esp + 60], 010194D50h
    mov dword ptr [esp + 64], 010194D34h
    mov dword ptr [esp + 68], 010194D14h
    mov dword ptr [esp + 72], 010194CF8h
    mov dword ptr [esp + 76], 010194CD4h
    mov dword ptr [esp + 80], 010194CACh
    mov dword ptr [esp + 84], 010194C88h
    mov dword ptr [esp + 88], 010194C74h
    mov dword ptr [esp + 92], 010194C5Ch
    mov dword ptr [esp + 96], 010194C44h
    mov dword ptr [esp + 100], 010194C30h
    mov dword ptr [esp + 104], 010194C18h
    mov dword ptr [esp + 108], 010194C04h
    mov dword ptr [esp + 112], 010194BE8h
    mov dword ptr [esp + 116], 010194BC8h
    mov dword ptr [esp + 120], 010194BA8h
    mov dword ptr [esp + 124], 010194B94h
    mov dword ptr [esp + 000000080h], 010194B80h
    mov dword ptr [esp + 000000084h], 010194B6Ch
    mov dword ptr [esp + 000000088h], 010194B58h
    mov dword ptr [esp + 00000008Ch], 010194B40h
    mov dword ptr [esp + 000000090h], 010194B28h
    mov dword ptr [esp + 000000094h], 010194B18h
    xor edi, edi
L0:
    mov esi, dword ptr [esp + edi*4 + 16]
    mov ecx, ebp
    jmp L1
    lea ecx, [ecx]
L1:
    mov al, byte ptr [ecx]
    mov bl, byte ptr [esi]
    mov dl, al
    cmp al, bl
    jne L3
    test dl, dl
    je L2
    mov al, byte ptr [ecx + 1]
    mov bl, byte ptr [esi + 1]
    mov dl, al
    cmp al, bl
    jne L3
    add ecx, 2
    add esi, 2
    test dl, dl
    jne L1
L2:
    xor ecx, ecx
    jmp L4
L3:
    sbb ecx, ecx
    sbb ecx, -1
L4:
    test ecx, ecx
    je L5
    inc edi
    cmp edi, 34
    jb L0
    pop edi
    pop esi
    pop ebp
    mov eax, 34
    pop ebx
    add esp, 000000088h
    ret
L5:
    mov eax, edi
    pop edi
    pop esi
    pop ebp
    pop ebx
FUN_1001be50 ENDP
END
