.686
.MODEL FLAT, C
EXTRN sub_100063BF:PROC
EXTRN sub_10006CC9:PROC
EXTRN sub_1000A4C8:PROC
EXTRN sub_1000A661:PROC
EXTRN sub_1000A7B8:PROC
EXTRN sub_1000A8C6:PROC
EXTRN sub_1000A990:PROC
EXTRN sub_10035E3D:PROC
EXTRN fp_101D4A10:DWORD
EXTRN fp_101D4A14:DWORD
EXTRN fp_101D4A18:DWORD
EXTRN g_1019BC84:DWORD
EXTRN g_101CE5B8:DWORD
EXTRN g_101CE5BC:DWORD
EXTRN g_101CE5C0:DWORD
EXTRN g_101CE5C4:DWORD
EXTRN g_101CE5CC:DWORD
EXTRN g_101CE5EC:DWORD
EXTRN g_101CE5ED:DWORD
EXTRN g_101CE5EE:DWORD
EXTRN g_101CE5EF:DWORD
EXTRN g_101CE5F0:DWORD
EXTRN g_101CE64C:DWORD
EXTRN g_101CE654:DWORD
EXTRN g_101CE65C:DWORD
EXTRN g_101CE6A4:DWORD
EXTRN g_101CE6D4:DWORD
EXTRN g_101CE760:DWORD
EXTRN g_101D7E90:DWORD
.CODE
FUN_1000a8d0 PROC
    sub esp, 124
    push ebx
    push ebp
    push esi
    push 000001000h
    call dword ptr [fp_101D4A10]
    mov ebp, eax
    add esp, 4
    push ebp
    call dword ptr [fp_101D4A18]
    add esp, 4
    push 00001E000h
    mov esi, eax
    call dword ptr [fp_101D4A10]
    add esp, 4
    push eax
    mov dword ptr [esp + 16], eax
    call dword ptr [fp_101D4A18]
    mov edx, dword ptr [g_101CE64C]
    mov dword ptr [g_101CE5CC], eax
    mov eax, dword ptr [g_101CE6A4]
    mov dword ptr [g_101CE5C4], esi
    mov cl, byte ptr [eax + 8]
    mov esi, dword ptr [g_101CE654]
    mov byte ptr [g_101CE5EC], cl
    mov al, byte ptr [edx + 8]
    mov byte ptr [g_101CE5ED], al
    mov bl, byte ptr [esi + 8]
    xor ecx, ecx
    add esp, 4
    cmp bl, cl
    mov dl, 1
    je L0
    cmp al, cl
    mov byte ptr [g_101CE5F0], dl
    jne L1
L0:
    mov byte ptr [g_101CE5F0], cl
L1:
    mov esi, dword ptr [g_101CE760]
    cmp byte ptr [esi + 8], cl
    je L2
    cmp al, cl
    mov byte ptr [g_101CE5EE], dl
    jne L3
L2:
    mov byte ptr [g_101CE5EE], cl
L3:
    mov esi, dword ptr [g_101CE65C]
    cmp byte ptr [esi + 8], cl
    je L4
    cmp al, cl
    mov byte ptr [g_101CE5EF], dl
    jne L5
L4:
    mov byte ptr [g_101CE5EF], cl
L5:
    mov dword ptr [g_101CE5C0], ecx
    lea eax, [edi + 0000000C8h]
    lea ecx, [edi + 000000108h]
    push 4
    push 010182948h
    lea edx, [esp + 24]
    mov dword ptr [g_101CE5B8], eax
    mov dword ptr [g_101CE5BC], ecx
    call sub_10006CC9
    fld dword ptr [g_1019BC84]
    fld dword ptr [edi + 0000000C4h]
    add esp, 8
    fucompp
    fnstsw ax
    test ah, 68
    jp L6
    mov ecx, edi
    call sub_1000A4C8
    jmp L7
L6:
    mov eax, edi
    call sub_1000A661
L7:
    mov eax, 4
    lea edx, [esp + 16]
    call sub_100063BF
    mov ecx, dword ptr [esp + 00000008Ch]
    lea edx, [esp + 16]
    push edx
    mov ebx, eax
    mov dword ptr [g_101D7E90], edi
    call sub_1000A7B8
    add esp, 4
    lea eax, [esp + 16]
    push ebx
    push eax
    call sub_1000A8C6
    lea ecx, [esp + 24]
    push ecx
    call sub_1000A990
    mov edx, dword ptr [g_101CE6D4]
    mov eax, dword ptr [edx + 8]
    add esp, 12
    test eax, eax
    je L8
    lea eax, [esp + 16]
    push ebx
    push eax
    mov eax, edi
    call sub_10035E3D
    add esp, 8
L8:
    mov ecx, dword ptr [esp + 12]
    push ecx
    call dword ptr [fp_101D4A14]
    add esp, 4
    push ebp
    call dword ptr [fp_101D4A14]
    add esp, 4
    pop esi
    pop ebp
    pop ebx
    add esp, 124
    ret
FUN_1000a8d0 ENDP
END
