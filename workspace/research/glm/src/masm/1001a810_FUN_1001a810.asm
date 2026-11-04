.686
.MODEL FLAT, C
EXTRN sub_10016CD6:PROC
EXTRN sub_10016DED:PROC
EXTRN sub_1001A5A4:PROC
EXTRN sub_1005F6DE:PROC
EXTRN sub_1005F744:PROC
EXTRN sub_100F5E06:PROC
EXTRN g_1019BD80:DWORD
EXTRN g_1019BED4:DWORD
EXTRN g_101AAC70:DWORD
.CODE
FUN_1001a810 PROC
    sub esp, 16
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 28]
    push esi
    mov esi, eax
    mov eax, dword ptr [g_101AAC70]
    imul eax, eax, 00000045Ch
    add eax, 0101A66B0h
    mov cl, byte ptr [eax + 000000404h]
    xor bl, bl
    cmp cl, bl
    push edi
    je L0
    mov ecx, dword ptr [eax + 000000418h]
    mov byte ptr [eax + 000000404h], bl
    mov dword ptr [esi], ecx
    mov edx, dword ptr [eax + 000000414h]
    mov dword ptr [eax + 000000400h], edx
L0:
    push esi
    mov eax, 1
    call sub_1005F6DE
    push eax
    call sub_100F5E06
    fmul dword ptr [g_1019BED4]
    add esp, 8
    fstp dword ptr [esp + 16]
    fld qword ptr [g_1019BD80]
    fstp qword ptr [esp + 24]
    fld dword ptr [esp + 16]
    fadd qword ptr [esp + 24]
    fistp dword ptr [esp + 20]
    mov eax, dword ptr [g_101AAC70]
    imul eax, eax, 00000045Ch
    add eax, 0101A66B0h
    cmp byte ptr [eax + 000000404h], bl
    je L1
    mov ecx, dword ptr [eax + 000000418h]
    mov byte ptr [eax + 000000404h], bl
    mov dword ptr [esi], ecx
    mov edx, dword ptr [eax + 000000414h]
    mov dword ptr [eax + 000000400h], edx
L1:
    push esi
    mov eax, 1
    call sub_1005F744
    mov ebx, dword ptr [esp + 24]
    mov edi, eax
    lea eax, [esp + 24]
    push eax
    push ebp
    push edi
    call sub_10016CD6
    add esp, 16
    test al, al
    je L2
    mov ecx, dword ptr [esp + 20]
    mov eax, dword ptr [ecx*4 + 0101DA564h]
    test eax, eax
    jne L4
L2:
    push ebx
    push ebp
    push edi
    call sub_1001A5A4
    mov esi, eax
    add esp, 12
    test esi, esi
    jne L3
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 16
    ret
L3:
    push esi
    push ebp
    push edi
    call sub_10016DED
    add esp, 12
    mov eax, esi
L4:
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 16
    ret
FUN_1001a810 ENDP
END
