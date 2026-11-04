.686
.MODEL FLAT, C
EXTRN sub_10013919:PROC
EXTRN sub_10016F58:PROC
EXTRN sub_10016FA4:PROC
EXTRN sub_10017065:PROC
EXTRN sub_100171AA:PROC
EXTRN sub_100171C2:PROC
EXTRN sub_1001C77C:PROC
EXTRN sub_10061CE7:PROC
EXTRN EXTRN g_101D1B2C:DWORD:DWORD
.CODE
FUN_10017100 PROC
    sub sub esp, 8
    push push ebx
    mov mov ebx, eax
    lea lea eax, [esp + 7]
    push push eax
    lea lea ecx, [esp + 12]
    push push ecx
    call sub_10017065
    mov mov al, byte ptr [esp + 15]
    add add esp, 8
    test test al, al
    je L0
    movzx movzx edx, word ptr [esp + 8]
    mov mov eax, dword ptr [edx*4 + 0101D4D28h]
    pop pop ebx
    add add esp, 8
    ret ret
    mov mov eax, dword ptr [esp + 16]
    push push esi
    push push eax
    call sub_1001C77C
    mov mov esi, eax
    add add esp, 4
    test test esi, esi
    jne sub_100171C2
    mov mov eax, dword ptr [g_101D1B2C]
    test test eax, eax
    jne sub_100171AA
    push push 0101943B8h
    push push esi
    call sub_10013919
    add add esp, 8
    push push ebx
    push push 01019438Ch
    call sub_10061CE7
    mov mov ecx, dword ptr [g_101D1B2C]
    push push ebx
    push push ecx
    call sub_10016FA4
    add add esp, 16
    pop pop esi
    pop pop ebx
    add add esp, 8
    ret ret
    mov mov ecx, dword ptr [esp + 12]
    mov mov eax, esi
    call sub_10016F58
    mov mov eax, esi
    pop pop esi
    pop pop ebx
    add add esp, 8
    ret ret
FUN_10017100 ENDP
END
