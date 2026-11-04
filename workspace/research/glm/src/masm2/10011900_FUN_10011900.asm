.686
.MODEL FLAT, C
EXTRN sub_100116D1:PROC
EXTRN sub_1001177B:PROC
EXTRN sub_10011B02:PROC
EXTRN EXTRN g_101CE6DC:DWORD:DWORD
EXTRN EXTRN g_101D1BF4:DWORD:DWORD
EXTRN EXTRN g_101D4960:DWORD:DWORD
EXTRN EXTRN g_101D4964:DWORD:DWORD
EXTRN EXTRN g_101D4968:DWORD:DWORD
EXTRN EXTRN g_101D4969:DWORD:DWORD
EXTRN EXTRN g_101D496A:DWORD:DWORD
EXTRN EXTRN g_101D496B:DWORD:DWORD
EXTRN EXTRN g_101D496C:DWORD:DWORD
EXTRN EXTRN g_101D496D:DWORD:DWORD
EXTRN EXTRN g_101D496E:DWORD:DWORD
EXTRN EXTRN g_101D4C84:DWORD:DWORD
EXTRN EXTRN g_101D4C88:DWORD:DWORD
EXTRN EXTRN g_101D4C8C:DWORD:DWORD
EXTRN EXTRN g_101D4C90:DWORD:DWORD
EXTRN EXTRN g_101D4C94:DWORD:DWORD
.CODE
FUN_10011900 PROC
    sub sub esp, 0130h
    push push ebx
    push push esi
    lea lea ebx, [esp + 8]
    call sub_100116D1
    add add esp, 4
    mov mov eax, ebx
    call sub_1001177B
    mov mov eax, dword ptr [esp + 96]
    mov mov ecx, dword ptr [esp + 92]
    mov mov edx, eax
    sub sub edx, ecx
    pop pop ebx
    mov mov dword ptr [g_101D4C84], ecx
    jns L0
    mov mov dword ptr [g_101D4C84], eax
    mov mov eax, dword ptr [esp + 098h]
    mov mov ecx, dword ptr [esp + 094h]
    mov mov edx, dword ptr [esp + 0A0h]
    mov mov dword ptr [g_101D4C88], eax
    mov mov eax, dword ptr [esp + 12]
    shr shr eax, 17
    and and al, 1
    mov mov byte ptr [g_101D4C94], al
    mov mov eax, dword ptr [esp + 0A4h]
    mov mov dword ptr [g_101D4C8C], ecx
    lea lea ecx, [eax - 6]
    test test ecx, ecx
    mov mov dword ptr [g_101D4C90], edx
    mov mov dword ptr [g_101D4964], 6
    jge L1
    mov mov dword ptr [g_101D4964], eax
    mov mov eax, dword ptr [esp + 088h]
    mov mov edx, dword ptr [esp + 108]
    mov mov ecx, eax
    and and eax, 0C0h
    shr shr ecx, 8
    and and cl, 1
    cmp cmp al, 0C0h
    mov mov eax, dword ptr [esp + 36]
    mov mov dword ptr [g_101D4960], edx
    sete sete dl
    shr shr eax, 25
    and and al, 1
    mov mov byte ptr [g_101D496A], al
    mov mov eax, dword ptr [esp + 32]
    mov mov byte ptr [g_101D4969], dl
    mov mov byte ptr [g_101D4968], cl
    mov mov ecx, dword ptr [esp + 60]
    mov mov edx, eax
    shr shr eax, 17
    shr shr ecx, 16
    and and al, 1
    shr shr edx, 11
    and and cl, 1
    and and dl, 1
    mov mov byte ptr [g_101D496D], al
    mov mov eax, dword ptr [g_101CE6DC]
    mov mov byte ptr [g_101D496B], cl
    mov mov byte ptr [g_101D496C], dl
    cmp cmp dword ptr [eax + 8], 1
    jne sub_10011B02
    xor xor al, al
    mov mov byte ptr [g_101D496E], al
    add add esp, 0130h
L1:
    ret ret
    mov mov eax, dword ptr [g_101D1BF4]
    mov mov ecx, dword ptr [eax]
    push push 041415353h
    push push 1
    push push 0
    push push 21
    push push 1
    push push esi
    push push eax
    call call dword ptr [ecx + 40]
    neg neg eax
    sbb sbb al, al
    inc inc al
    mov mov byte ptr [g_101D496E], al
    add add esp, 0130h
    ret ret
FUN_10011900 ENDP
END
