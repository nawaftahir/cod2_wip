.686
.MODEL FLAT, C
EXTRN sub_100063BF:PROC
EXTRN sub_10006CC9:PROC
EXTRN sub_1000A4C8:PROC
EXTRN sub_1000A661:PROC
EXTRN sub_1000A7B8:PROC
EXTRN sub_1000A8C6:PROC
EXTRN sub_1000AADB:PROC
EXTRN sub_1000AAEB:PROC
EXTRN sub_1000ABA0:PROC
EXTRN sub_10035E3D:PROC
EXTRN EXTRN fp_101D4A10:DWORD:DWORD
EXTRN EXTRN fp_101D4A14:DWORD:DWORD
EXTRN EXTRN fp_101D4A18:DWORD:DWORD
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_101CE5B8:DWORD:DWORD
EXTRN EXTRN g_101CE5BC:DWORD:DWORD
EXTRN EXTRN g_101CE5C0:DWORD:DWORD
EXTRN EXTRN g_101CE5C4:DWORD:DWORD
EXTRN EXTRN g_101CE5CC:DWORD:DWORD
EXTRN EXTRN g_101CE5EC:DWORD:DWORD
EXTRN EXTRN g_101CE5ED:DWORD:DWORD
EXTRN EXTRN g_101CE5EE:DWORD:DWORD
EXTRN EXTRN g_101CE5EF:DWORD:DWORD
EXTRN EXTRN g_101CE5F0:DWORD:DWORD
EXTRN EXTRN g_101CE64C:DWORD:DWORD
EXTRN EXTRN g_101CE654:DWORD:DWORD
EXTRN EXTRN g_101CE65C:DWORD:DWORD
EXTRN EXTRN g_101CE6A4:DWORD:DWORD
EXTRN EXTRN g_101CE6D4:DWORD:DWORD
EXTRN EXTRN g_101CE760:DWORD:DWORD
EXTRN EXTRN g_101D7E90:DWORD:DWORD
.CODE
FUN_1000a8d0 PROC
    sub sub esp, 124
    push push ebx
    push push ebp
    push push esi
    push push 01000h
    call dword ptr [fp_101D4A10]
    mov mov ebp, eax
    add add esp, 4
    push push ebp
    call dword ptr [fp_101D4A18]
    add add esp, 4
    push push 01E000h
    mov mov esi, eax
    call dword ptr [fp_101D4A10]
    add add esp, 4
    push push eax
    mov mov dword ptr [esp + 16], eax
    call dword ptr [fp_101D4A18]
    mov mov edx, dword ptr [g_101CE64C]
    mov mov dword ptr [g_101CE5CC], eax
    mov mov eax, dword ptr [g_101CE6A4]
    mov mov dword ptr [g_101CE5C4], esi
    mov mov cl, byte ptr [eax + 8]
    mov mov esi, dword ptr [g_101CE654]
    mov mov byte ptr [g_101CE5EC], cl
    mov mov al, byte ptr [edx + 8]
    mov mov byte ptr [g_101CE5ED], al
    mov mov bl, byte ptr [esi + 8]
    xor xor ecx, ecx
    add add esp, 4
    cmp cmp bl, cl
    mov mov dl, 1
    je L1
    cmp cmp al, cl
    mov mov byte ptr [g_101CE5F0], dl
    jne L2
    mov mov byte ptr [g_101CE5F0], cl
    mov mov esi, dword ptr [g_101CE760]
    cmp cmp byte ptr [esi + 8], cl
    je L3
    cmp cmp al, cl
    mov mov byte ptr [g_101CE5EE], dl
    jne L4
    mov mov byte ptr [g_101CE5EE], cl
    mov mov esi, dword ptr [g_101CE65C]
    cmp cmp byte ptr [esi + 8], cl
    je L5
    cmp cmp al, cl
    mov mov byte ptr [g_101CE5EF], dl
    jne L6
    mov mov byte ptr [g_101CE5EF], cl
    mov mov dword ptr [g_101CE5C0], ecx
    lea lea eax, [edi + 0C8h]
    lea lea ecx, [edi + 0108h]
    push push 4
    push push 010182948h
    lea lea edx, [esp + 24]
    mov mov dword ptr [g_101CE5B8], eax
    mov mov dword ptr [g_101CE5BC], ecx
    call sub_10006CC9
    fld fld dword ptr [g_1019BC84]
    fld fld dword ptr [edi + 0C4h]
    add add esp, 8
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp sub_1000AADB
    mov mov ecx, edi
    call sub_1000A4C8
    jmp sub_1000AAEB
    mov mov eax, edi
    call sub_1000A661
    mov mov eax, 4
    lea lea edx, [esp + 16]
    call sub_100063BF
    mov mov ecx, dword ptr [esp + 08Ch]
    lea lea edx, [esp + 16]
    push push edx
    mov mov ebx, eax
    mov mov dword ptr [g_101D7E90], edi
    call sub_1000A7B8
    add add esp, 4
    lea lea eax, [esp + 16]
    push push ebx
    push push eax
    call sub_1000A8C6
    lea lea ecx, [esp + 24]
    push push ecx
    call L0
    mov mov edx, dword ptr [g_101CE6D4]
    mov mov eax, dword ptr [edx + 8]
    add add esp, 12
    test test eax, eax
    je sub_1000ABA0
    lea lea eax, [esp + 16]
    push push ebx
    push push eax
    mov mov eax, edi
    call sub_10035E3D
    add add esp, 8
    mov mov ecx, dword ptr [esp + 12]
    push push ecx
    call dword ptr [fp_101D4A14]
    add add esp, 4
    push push ebp
    call dword ptr [fp_101D4A14]
    add add esp, 4
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 124
    ret ret
FUN_1000a8d0 ENDP
END
