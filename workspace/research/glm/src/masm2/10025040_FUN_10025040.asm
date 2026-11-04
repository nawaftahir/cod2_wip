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
EXTRN sub_100252FF:PROC
EXTRN sub_10025334:PROC
EXTRN sub_100253D8:PROC
EXTRN sub_100253EB:PROC
EXTRN sub_10025433:PROC
EXTRN sub_10025461:PROC
EXTRN sub_10025496:PROC
EXTRN sub_100254CB:PROC
EXTRN sub_10025500:PROC
EXTRN sub_10025585:PROC
EXTRN sub_10027962:PROC
EXTRN EXTRN g_101CE694:DWORD:DWORD
EXTRN EXTRN g_101D1B9C:DWORD:DWORD
EXTRN EXTRN g_101D489C:DWORD:DWORD
EXTRN EXTRN g_101D4C6C:DWORD:DWORD
EXTRN EXTRN g_101D4C70:DWORD:DWORD
EXTRN EXTRN g_10678500:DWORD:DWORD
EXTRN EXTRN g_10696C78:DWORD:DWORD
EXTRN EXTRN g_10696C7C:DWORD:DWORD
EXTRN EXTRN g_10696C90:DWORD:DWORD
EXTRN EXTRN g_10696C94:DWORD:DWORD
EXTRN EXTRN g_10696C98:DWORD:DWORD
EXTRN EXTRN g_10696CAC:DWORD:DWORD
EXTRN EXTRN g_10696CB0:DWORD:DWORD
EXTRN EXTRN g_10696CB4:DWORD:DWORD
.CODE
FUN_10025040 PROC
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 12]
    push push esi
    mov mov esi, dword ptr [esp + 20]
    push push edi
    mov mov edi, eax
    mov mov eax, dword ptr [esp + 32]
    push push edi
    push push eax
    mov mov ebx, ecx
    push push ebp
    mov mov eax, esi
    call sub_10024AAE
    add add esp, 12
    cmp cmp edi, 1
    jne L0
    mov mov ecx, dword ptr [esp + 36]
    push push ecx
    push push esi
    push push ebp
    call sub_10027962
    add add esp, 12
    cmp cmp dword ptr [g_10696C7C], -1
    jne L1
    mov mov byte ptr [g_10696C78], 1
    call sub_10020F5A
    xor xor esi, esi
    mov mov dword ptr [g_10696C7C], eax
    call sub_10021896
    mov mov edx, dword ptr [g_101D4C70]
    mov mov eax, dword ptr [g_101D4C6C]
    push push edx
    push push eax
    push push esi
    push push esi
    call sub_10021C5A
    push push edi
    call sub_10024A30
    mov mov ecx, dword ptr [g_101D1B9C]
    add add ecx, 0B4h
    push push esi
    call sub_100217F2
    mov mov esi, dword ptr [esp + 48]
    add add esp, 24
    mov mov al, byte ptr [g_10696C78]
    test test al, al
    je L2
    mov mov ecx, dword ptr [g_10696C7C]
    push push ecx
    call sub_1002100E
    add add esp, 4
    mov mov byte ptr [g_10696C78], 0
    call sub_10020FBD
    mov mov edx, dword ptr [g_10678500]
    push push esi
    push push edx
    mov mov esi, 0101D7E7Ch
    mov mov edi, 010678504h
    mov mov dword ptr [ebp*4 + 010696C80h], eax
    call sub_10021C1B
    mov mov esi, dword ptr [esp + 40]
    push push 0
    push push 1
    push push ebx
    push push esi
    call sub_1002196A
    push push 0
    push push 6
    push push ebx
    push push esi
    call sub_10021975
    add add esp, 40
    mov mov esi, ebp
    call sub_10021A0F
    mov mov eax, dword ptr [ebp*4 + 010696C80h]
    cmp cmp eax, -1
    je L3
    push push eax
    call sub_10021071
    add add esp, 4
    cmp cmp dword ptr [g_10696C90], -1
    jne L4
    mov mov byte ptr [g_10696C78], 1
    call sub_10021029
    mov mov dword ptr [g_10696C90], eax
    mov mov eax, dword ptr [esp + 28]
    mov mov cl, byte ptr [eax + 4]
    test test cl, cl
    je L5
    call sub_100221EE
    mov mov al, byte ptr [g_10696C78]
    test test al, al
    je L6
    mov mov ecx, dword ptr [g_10696C90]
    push push ecx
    call sub_100210B3
    add add esp, 4
    mov mov byte ptr [g_10696C78], 0
    mov mov eax, dword ptr [g_10696C98]
    cmp cmp eax, -1
    jne sub_100252FF
    mov mov byte ptr [g_10696C94], 1
    call sub_10021073
    mov mov dword ptr [g_10696C98], eax
    mov mov cl, byte ptr [g_10696C94]
    test test cl, cl
    je sub_10025334
    push push eax
    call sub_100210E8
    add add esp, 4
    mov mov byte ptr [g_10696C94], 0
    call sub_10021097
    mov mov edx, dword ptr [esp + 24]
    mov mov dword ptr [ebp*4 + 010696C9Ch], eax
    mov mov eax, dword ptr [g_10678500]
    push push edx
    push push eax
    mov mov esi, 0101D7E7Ch
    mov mov edi, 010678504h
    call sub_10021CF8
    mov mov eax, dword ptr [esp + 52]
    mov mov ecx, dword ptr [esp + 48]
    add add esp, 8
    call sub_100249A8
    mov mov ecx, dword ptr [g_101CE694]
    mov mov al, byte ptr [ecx + 8]
    test test al, al
    je sub_100253D8
    mov mov eax, dword ptr [g_101D489C]
    test test eax, eax
    mov mov eax, 24
    jne sub_100253EB
    mov mov eax, 21
    mov mov edx, dword ptr [esp + 32]
    push push 0
    push push eax
    push push ebx
    push push edx
    call sub_10021A76
    mov mov eax, dword ptr [ebp*4 + 010696C9Ch]
    add add esp, 16
    cmp cmp eax, -1
    je sub_10025433
    push push eax
    call sub_1002116B
    add add esp, 4
    mov mov eax, dword ptr [g_10696CAC]
    cmp cmp eax, -1
    jne sub_10025461
    mov mov byte ptr [g_10696C94], 1
    call sub_10021124
    mov mov dword ptr [g_10696CAC], eax
    mov mov cl, byte ptr [g_10696C94]
    test test cl, cl
    je sub_10025496
    push push eax
    call sub_10021199
    add add esp, 4
    mov mov byte ptr [g_10696C94], 0
    mov mov eax, dword ptr [g_10696CB4]
    cmp cmp eax, -1
L4:
    jne sub_100254CB
    mov mov byte ptr [g_10696CB0], 1
    call sub_10021159
    mov mov dword ptr [g_10696CB4], eax
    mov mov cl, byte ptr [g_10696CB0]
    test test cl, cl
    je sub_10025500
    push push eax
    call sub_100211CE
    add add esp, 4
    mov mov byte ptr [g_10696CB0], 0
    call sub_1002117D
    mov mov ecx, dword ptr [g_10678500]
    mov mov dword ptr [ebp*4 + 010696CB8h], eax
    mov mov eax, dword ptr [esp + 24]
    push push eax
    push push ecx
    mov mov esi, 0101D7E7Ch
    mov mov edi, 010678504h
    call sub_10021DDF
    mov mov eax, dword ptr [esp + 36]
    mov mov cl, byte ptr [eax + 4]
    add add esp, 8
    test test cl, cl
    je sub_10025585
    mov mov edx, dword ptr [eax]
    push push edx
    call sub_100223B5
    add add esp, 4
    push push ebp
    call sub_1002241E
    add add esp, 4
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    ret ret
FUN_10025040 ENDP
END
