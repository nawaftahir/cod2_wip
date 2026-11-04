.686
.MODEL FLAT, C
EXTRN sub_10013919:PROC
EXTRN sub_10016F58:PROC
EXTRN sub_10016FA4:PROC
EXTRN sub_10017065:PROC
EXTRN sub_1001C77C:PROC
EXTRN sub_10061CE7:PROC
EXTRN g_101D1B2C:DWORD
.CODE
FUN_10017100 PROC
    sub esp, 8
    push ebx
    mov ebx, eax
    lea eax, [esp + 7]
    push eax
    lea ecx, [esp + 12]
    push ecx
    call sub_10017065
    mov al, byte ptr [esp + 15]
    add esp, 8
    test al, al
    je L0
    movzx edx, word ptr [esp + 8]
    mov eax, dword ptr [edx*4 + 0101D4D28h]
    pop ebx
    add esp, 8
    ret
L0:
    mov eax, dword ptr [esp + 16]
    push esi
    push eax
    call sub_1001C77C
    mov esi, eax
    add esp, 4
    test esi, esi
    jne L2
    mov eax, dword ptr [g_101D1B2C]
    test eax, eax
    jne L1
    push 0101943B8h
    push esi
    call sub_10013919
    add esp, 8
L1:
    push ebx
    push 01019438Ch
    call sub_10061CE7
    mov ecx, dword ptr [g_101D1B2C]
    push ebx
    push ecx
    call sub_10016FA4
    add esp, 16
    pop esi
    pop ebx
    add esp, 8
    ret
L2:
    mov ecx, dword ptr [esp + 12]
    mov eax, esi
    call sub_10016F58
    mov eax, esi
    pop esi
    pop ebx
    add esp, 8
    ret
FUN_10017100 ENDP
END
