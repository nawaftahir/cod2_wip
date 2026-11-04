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
EXTRN sub_10024CAD:PROC
EXTRN sub_10024D05:PROC
EXTRN sub_10024D1C:PROC
EXTRN sub_10024D41:PROC
EXTRN sub_10024DA5:PROC
EXTRN sub_10024DD3:PROC
EXTRN sub_10024E08:PROC
EXTRN sub_1002959B:PROC
EXTRN EXTRN g_101CE694:DWORD:DWORD
EXTRN EXTRN g_101CE708:DWORD:DWORD
EXTRN EXTRN g_101D489C:DWORD:DWORD
EXTRN EXTRN g_10678500:DWORD:DWORD
EXTRN EXTRN g_10696C40:DWORD:DWORD
EXTRN EXTRN g_10696C44:DWORD:DWORD
EXTRN EXTRN g_10696C58:DWORD:DWORD
.CODE
FUN_10024a90 PROC
    push push ebp
    mov mov ebp, dword ptr [esp + 8]
    push push esi
    push push edi
    mov mov edi, eax
    mov mov eax, dword ptr [g_101CE708]
    cmp cmp dword ptr [eax + 8], 2
    je L3
    mov mov ecx, dword ptr [g_101CE694]
    mov mov al, byte ptr [ecx + 8]
    test test al, al
    je L4
    mov mov eax, dword ptr [g_101D489C]
    test test eax, eax
    je L5
    cmp cmp dword ptr [g_10696C44], -1
    jne L1
    mov mov byte ptr [g_10696C40], 1
    call sub_10020F5B
    mov mov esi, 6
    mov mov dword ptr [g_10696C44], eax
    call sub_1002189A
    call L0
    mov mov al, byte ptr [g_10696C40]
    test test al, al
    je L2
    mov mov edx, dword ptr [g_10696C44]
    push push edx
    call sub_10020FE4
    add add esp, 4
    mov mov byte ptr [g_10696C40], 0
    call sub_10020F93
    mov mov dword ptr [ebp*4 + 010696C48h], eax
    mov mov eax, dword ptr [g_10678500]
    push push edi
    push push eax
    mov mov esi, 0101D7E7Ch
    mov mov edi, 010678504h
    call sub_10021BF0
    mov mov ecx, dword ptr [esp + 28]
    push push 0
    push push 2
    push push ebx
    push push ecx
    call sub_1002193F
    add add esp, 24
    mov mov edx, ebp
    xor xor eax, eax
    call sub_1002959B
    mov mov al, byte ptr [g_10696C40]
    test test al, al
    je sub_10024D1C
    mov mov edx, dword ptr [g_10696C58]
    push push edx
    call sub_10021044
    add add esp, 4
    pop pop edi
    pop pop esi
    mov mov byte ptr [g_10696C40], 0
    pop pop ebp
    ret ret
    cmp cmp dword ptr [esp + 24], 1
    jne sub_10024D41
    cmp cmp dword ptr [g_10696C44], -1
    jne sub_10024CAD
    mov mov byte ptr [g_10696C40], 1
    call sub_10021012
    mov mov esi, 3
    mov mov dword ptr [g_10696C44], eax
    call sub_10021951
    push push 0
    push push 03F800000h
L5:
    push push 010191488h
    push push 7
    call sub_10022344
    add add esp, 16
    mov mov al, byte ptr [g_10696C40]
    test test al, al
    je sub_10024D05
    mov mov eax, dword ptr [g_10696C44]
    push push eax
    call sub_100210AB
    add add esp, 4
    mov mov byte ptr [g_10696C40], 0
    call sub_1002105A
    mov mov ecx, dword ptr [g_10678500]
    push push edi
    push push ecx
    mov mov esi, 0101D7E7Ch
    mov mov edi, 010678504h
    mov mov dword ptr [ebp*4 + 010696C48h], eax
    call sub_10021CB8
    mov mov edx, dword ptr [esp + 28]
    push push 0
    push push 0
    push push ebx
    push push edx
    call sub_10021A07
    mov mov ebp, dword ptr [ebp*4 + 010696C48h]
    add add esp, 24
    cmp cmp ebp, -1
    je sub_10024DA5
    push push ebp
    call sub_100210FC
    add add esp, 4
    mov mov eax, dword ptr [g_10696C58]
    cmp cmp eax, -1
    jne sub_10024DD3
    mov mov byte ptr [g_10696C40], 1
    call sub_100210B5
    mov mov dword ptr [g_10696C58], eax
    mov mov cl, byte ptr [g_10696C40]
    test test cl, cl
    je sub_10024E08
    push push eax
    call sub_1002112A
    add add esp, 4
    mov mov byte ptr [g_10696C40], 0
    pop pop edi
    pop pop esi
    pop pop ebp
    ret ret
FUN_10024a90 ENDP
END
