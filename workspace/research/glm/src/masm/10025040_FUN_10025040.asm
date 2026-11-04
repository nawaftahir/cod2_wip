.686
.MODEL FLAT, C
EXTRN sub_10020F5A:PROC
EXTRN sub_10020FBD:PROC
EXTRN sub_1002100E:PROC
EXTRN sub_10021029:PROC
EXTRN sub_10021071:PROC
EXTRN sub_10021073:PROC
EXTRN sub_10021097:PROC
EXTRN sub_100210B3:PROC
EXTRN sub_100210E8:PROC
EXTRN sub_10021124:PROC
EXTRN sub_10021159:PROC
EXTRN sub_1002116B:PROC
EXTRN sub_1002117D:PROC
EXTRN sub_10021199:PROC
EXTRN sub_100211CE:PROC
EXTRN sub_100217F2:PROC
EXTRN sub_10021896:PROC
EXTRN sub_1002196A:PROC
EXTRN sub_10021975:PROC
EXTRN sub_10021A0F:PROC
EXTRN sub_10021A76:PROC
EXTRN sub_10021C1B:PROC
EXTRN sub_10021C5A:PROC
EXTRN sub_10021CF8:PROC
EXTRN sub_10021DDF:PROC
EXTRN sub_100221EE:PROC
EXTRN sub_100223B5:PROC
EXTRN sub_1002241E:PROC
EXTRN sub_100249A8:PROC
EXTRN sub_10024A30:PROC
EXTRN sub_10024AAE:PROC
EXTRN sub_10027962:PROC
EXTRN g_101CE694:DWORD
EXTRN g_101D1B9C:DWORD
EXTRN g_101D489C:DWORD
EXTRN g_101D4C6C:DWORD
EXTRN g_101D4C70:DWORD
EXTRN g_10678500:DWORD
EXTRN g_10696C78:DWORD
EXTRN g_10696C7C:DWORD
EXTRN g_10696C90:DWORD
EXTRN g_10696C94:DWORD
EXTRN g_10696C98:DWORD
EXTRN g_10696CAC:DWORD
EXTRN g_10696CB0:DWORD
EXTRN g_10696CB4:DWORD
.CODE
FUN_10025040 PROC
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 12]
    push esi
    mov esi, dword ptr [esp + 20]
    push edi
    mov edi, eax
    mov eax, dword ptr [esp + 32]
    push edi
    push eax
    mov ebx, ecx
    push ebp
    mov eax, esi
    call sub_10024AAE
    add esp, 12
    cmp edi, 1
    jne L0
    mov ecx, dword ptr [esp + 36]
    push ecx
    push esi
    push ebp
    call sub_10027962
    add esp, 12
L0:
    cmp dword ptr [g_10696C7C], -1
    jne L1
    mov byte ptr [g_10696C78], 1
    call sub_10020F5A
    xor esi, esi
    mov dword ptr [g_10696C7C], eax
    call sub_10021896
    mov edx, dword ptr [g_101D4C70]
    mov eax, dword ptr [g_101D4C6C]
    push edx
    push eax
    push esi
    push esi
    call sub_10021C5A
    push edi
    call sub_10024A30
    mov ecx, dword ptr [g_101D1B9C]
    add ecx, 0000000B4h
    push esi
    call sub_100217F2
    mov esi, dword ptr [esp + 48]
    add esp, 24
L1:
    mov al, byte ptr [g_10696C78]
    test al, al
    je L2
    mov ecx, dword ptr [g_10696C7C]
    push ecx
    call sub_1002100E
    add esp, 4
    mov byte ptr [g_10696C78], 0
L2:
    call sub_10020FBD
    mov edx, dword ptr [g_10678500]
    push esi
    push edx
    mov esi, 0101D7E7Ch
    mov edi, 010678504h
    mov dword ptr [ebp*4 + 010696C80h], eax
    call sub_10021C1B
    mov esi, dword ptr [esp + 40]
    push 0
    push 1
    push ebx
    push esi
    call sub_1002196A
    push 0
    push 6
    push ebx
    push esi
    call sub_10021975
    add esp, 40
    mov esi, ebp
    call sub_10021A0F
    mov eax, dword ptr [ebp*4 + 010696C80h]
    cmp eax, -1
    je L3
    push eax
    call sub_10021071
    add esp, 4
L3:
    cmp dword ptr [g_10696C90], -1
    jne L4
    mov byte ptr [g_10696C78], 1
    call sub_10021029
    mov dword ptr [g_10696C90], eax
    mov eax, dword ptr [esp + 28]
    mov cl, byte ptr [eax + 4]
    test cl, cl
    je L4
    call sub_100221EE
L4:
    mov al, byte ptr [g_10696C78]
    test al, al
    je L5
    mov ecx, dword ptr [g_10696C90]
    push ecx
    call sub_100210B3
    add esp, 4
    mov byte ptr [g_10696C78], 0
L5:
    mov eax, dword ptr [g_10696C98]
    cmp eax, -1
    jne L6
    mov byte ptr [g_10696C94], 1
    call sub_10021073
    mov dword ptr [g_10696C98], eax
L6:
    mov cl, byte ptr [g_10696C94]
    test cl, cl
    je L7
    push eax
    call sub_100210E8
    add esp, 4
    mov byte ptr [g_10696C94], 0
L7:
    call sub_10021097
    mov edx, dword ptr [esp + 24]
    mov dword ptr [ebp*4 + 010696C9Ch], eax
    mov eax, dword ptr [g_10678500]
    push edx
    push eax
    mov esi, 0101D7E7Ch
    mov edi, 010678504h
    call sub_10021CF8
    mov eax, dword ptr [esp + 52]
    mov ecx, dword ptr [esp + 48]
    add esp, 8
    call sub_100249A8
    mov ecx, dword ptr [g_101CE694]
    mov al, byte ptr [ecx + 8]
    test al, al
    je L8
    mov eax, dword ptr [g_101D489C]
    test eax, eax
    mov eax, 24
    jne L9
L8:
    mov eax, 21
L9:
    mov edx, dword ptr [esp + 32]
    push 0
    push eax
    push ebx
    push edx
    call sub_10021A76
    mov eax, dword ptr [ebp*4 + 010696C9Ch]
    add esp, 16
    cmp eax, -1
    je L10
    push eax
    call sub_1002116B
    add esp, 4
L10:
    mov eax, dword ptr [g_10696CAC]
    cmp eax, -1
    jne L11
    mov byte ptr [g_10696C94], 1
    call sub_10021124
    mov dword ptr [g_10696CAC], eax
L11:
    mov cl, byte ptr [g_10696C94]
    test cl, cl
    je L12
    push eax
    call sub_10021199
    add esp, 4
    mov byte ptr [g_10696C94], 0
L12:
    mov eax, dword ptr [g_10696CB4]
    cmp eax, -1
    jne L13
    mov byte ptr [g_10696CB0], 1
    call sub_10021159
    mov dword ptr [g_10696CB4], eax
L13:
    mov cl, byte ptr [g_10696CB0]
    test cl, cl
    je L14
    push eax
    call sub_100211CE
    add esp, 4
    mov byte ptr [g_10696CB0], 0
L14:
    call sub_1002117D
    mov ecx, dword ptr [g_10678500]
    mov dword ptr [ebp*4 + 010696CB8h], eax
    mov eax, dword ptr [esp + 24]
    push eax
    push ecx
    mov esi, 0101D7E7Ch
    mov edi, 010678504h
    call sub_10021DDF
    mov eax, dword ptr [esp + 36]
    mov cl, byte ptr [eax + 4]
    add esp, 8
    test cl, cl
    je L15
    mov edx, dword ptr [eax]
    push edx
    call sub_100223B5
    add esp, 4
L15:
    push ebp
    call sub_1002241E
    add esp, 4
    pop edi
    pop esi
    pop ebp
    pop ebx
    ret
FUN_10025040 ENDP
END
