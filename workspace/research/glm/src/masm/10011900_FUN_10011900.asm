.686
.MODEL FLAT, C
EXTRN sub_100116D1:PROC
EXTRN sub_1001177B:PROC
EXTRN g_101CE6DC:DWORD
EXTRN g_101D1BF4:DWORD
EXTRN g_101D4960:DWORD
EXTRN g_101D4964:DWORD
EXTRN g_101D4968:DWORD
EXTRN g_101D4969:DWORD
EXTRN g_101D496A:DWORD
EXTRN g_101D496B:DWORD
EXTRN g_101D496C:DWORD
EXTRN g_101D496D:DWORD
EXTRN g_101D496E:DWORD
EXTRN g_101D4C84:DWORD
EXTRN g_101D4C88:DWORD
EXTRN g_101D4C8C:DWORD
EXTRN g_101D4C90:DWORD
EXTRN g_101D4C94:DWORD
.CODE
FUN_10011900 PROC
    sub esp, 000000130h
    push ebx
    push esi
    lea ebx, [esp + 8]
    call sub_100116D1
    add esp, 4
    mov eax, ebx
    call sub_1001177B
    mov eax, dword ptr [esp + 96]
    mov ecx, dword ptr [esp + 92]
    mov edx, eax
    sub edx, ecx
    pop ebx
    mov dword ptr [g_101D4C84], ecx
    jns L0
    mov dword ptr [g_101D4C84], eax
L0:
    mov eax, dword ptr [esp + 000000098h]
    mov ecx, dword ptr [esp + 000000094h]
    mov edx, dword ptr [esp + 0000000A0h]
    mov dword ptr [g_101D4C88], eax
    mov eax, dword ptr [esp + 12]
    shr eax, 17
    and al, 1
    mov byte ptr [g_101D4C94], al
    mov eax, dword ptr [esp + 0000000A4h]
    mov dword ptr [g_101D4C8C], ecx
    lea ecx, [eax - 6]
    test ecx, ecx
    mov dword ptr [g_101D4C90], edx
    mov dword ptr [g_101D4964], 6
    jge L1
    mov dword ptr [g_101D4964], eax
L1:
    mov eax, dword ptr [esp + 000000088h]
    mov edx, dword ptr [esp + 108]
    mov ecx, eax
    and eax, 0000000C0h
    shr ecx, 8
    and cl, 1
    cmp al, 0000000C0h
    mov eax, dword ptr [esp + 36]
    mov dword ptr [g_101D4960], edx
    sete dl
    shr eax, 25
    and al, 1
    mov byte ptr [g_101D496A], al
    mov eax, dword ptr [esp + 32]
    mov byte ptr [g_101D4969], dl
    mov byte ptr [g_101D4968], cl
    mov ecx, dword ptr [esp + 60]
    mov edx, eax
    shr eax, 17
    shr ecx, 16
    and al, 1
    shr edx, 11
    and cl, 1
    and dl, 1
    mov byte ptr [g_101D496D], al
    mov eax, dword ptr [g_101CE6DC]
    mov byte ptr [g_101D496B], cl
    mov byte ptr [g_101D496C], dl
    cmp dword ptr [eax + 8], 1
    jne L2
    xor al, al
    mov byte ptr [g_101D496E], al
    add esp, 000000130h
    ret
L2:
    mov eax, dword ptr [g_101D1BF4]
    mov ecx, dword ptr [eax]
    push 041415353h
    push 1
    push 0
    push 21
    push 1
    push esi
    push eax
    call dword ptr [ecx + 0x28]
    neg eax
    sbb al, al
    inc al
    mov byte ptr [g_101D496E], al
    add esp, 000000130h
    ret
FUN_10011900 ENDP
END
