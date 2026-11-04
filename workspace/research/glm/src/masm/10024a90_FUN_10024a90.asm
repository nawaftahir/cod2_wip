.686
.MODEL FLAT, C
EXTRN sub_10020F5B:PROC
EXTRN sub_10020F93:PROC
EXTRN sub_10020FE4:PROC
EXTRN sub_10021012:PROC
EXTRN sub_10021044:PROC
EXTRN sub_1002105A:PROC
EXTRN sub_100210AB:PROC
EXTRN sub_100210B5:PROC
EXTRN sub_100210FC:PROC
EXTRN sub_1002112A:PROC
EXTRN sub_1002189A:PROC
EXTRN sub_1002193F:PROC
EXTRN sub_10021951:PROC
EXTRN sub_10021A07:PROC
EXTRN sub_10021BF0:PROC
EXTRN sub_10021CB8:PROC
EXTRN sub_10022344:PROC
EXTRN sub_10024A9F:PROC
EXTRN sub_1002959B:PROC
EXTRN g_101CE694:DWORD
EXTRN g_101CE708:DWORD
EXTRN g_101D489C:DWORD
EXTRN g_10678500:DWORD
EXTRN g_10696C40:DWORD
EXTRN g_10696C44:DWORD
EXTRN g_10696C58:DWORD
.CODE
FUN_10024a90 PROC
    push ebp
    mov ebp, dword ptr [esp + 8]
    push esi
    push edi
    mov edi, eax
    mov eax, dword ptr [g_101CE708]
    cmp dword ptr [eax + 8], 2
    je L2
    mov ecx, dword ptr [g_101CE694]
    mov al, byte ptr [ecx + 8]
    test al, al
    je L2
    mov eax, dword ptr [g_101D489C]
    test eax, eax
    je L2
    cmp dword ptr [g_10696C44], -1
    jne L0
    mov byte ptr [g_10696C40], 1
    call sub_10020F5B
    mov esi, 6
    mov dword ptr [g_10696C44], eax
    call sub_1002189A
    call sub_10024A9F
L0:
    mov al, byte ptr [g_10696C40]
    test al, al
    je L1
    mov edx, dword ptr [g_10696C44]
    push edx
    call sub_10020FE4
    add esp, 4
    mov byte ptr [g_10696C40], 0
L1:
    call sub_10020F93
    mov dword ptr [ebp*4 + 010696C48h], eax
    mov eax, dword ptr [g_10678500]
    push edi
    push eax
    mov esi, 0101D7E7Ch
    mov edi, 010678504h
    call sub_10021BF0
    mov ecx, dword ptr [esp + 28]
    push 0
    push 2
    push ebx
    push ecx
    call sub_1002193F
    add esp, 24
    mov edx, ebp
    xor eax, eax
    call sub_1002959B
    mov al, byte ptr [g_10696C40]
    test al, al
    je L7
    mov edx, dword ptr [g_10696C58]
    push edx
    call sub_10021044
    add esp, 4
    pop edi
    pop esi
    mov byte ptr [g_10696C40], 0
    pop ebp
    ret
L2:
    cmp dword ptr [esp + 24], 1
    jne L7
    cmp dword ptr [g_10696C44], -1
    jne L3
    mov byte ptr [g_10696C40], 1
    call sub_10021012
    mov esi, 3
    mov dword ptr [g_10696C44], eax
    call sub_10021951
    push 0
    push 03F800000h
    push 010191488h
    push 7
    call sub_10022344
    add esp, 16
L3:
    mov al, byte ptr [g_10696C40]
    test al, al
    je L4
    mov eax, dword ptr [g_10696C44]
    push eax
    call sub_100210AB
    add esp, 4
    mov byte ptr [g_10696C40], 0
L4:
    call sub_1002105A
    mov ecx, dword ptr [g_10678500]
    push edi
    push ecx
    mov esi, 0101D7E7Ch
    mov edi, 010678504h
    mov dword ptr [ebp*4 + 010696C48h], eax
    call sub_10021CB8
    mov edx, dword ptr [esp + 28]
    push 0
    push 0
    push ebx
    push edx
    call sub_10021A07
    mov ebp, dword ptr [ebp*4 + 010696C48h]
    add esp, 24
    cmp ebp, -1
    je L5
    push ebp
    call sub_100210FC
    add esp, 4
L5:
    mov eax, dword ptr [g_10696C58]
    cmp eax, -1
    jne L6
    mov byte ptr [g_10696C40], 1
    call sub_100210B5
    mov dword ptr [g_10696C58], eax
L6:
    mov cl, byte ptr [g_10696C40]
    test cl, cl
    je L7
    push eax
    call sub_1002112A
    add esp, 4
    mov byte ptr [g_10696C40], 0
L7:
    pop edi
    pop esi
    pop ebp
    ret
FUN_10024a90 ENDP
END
