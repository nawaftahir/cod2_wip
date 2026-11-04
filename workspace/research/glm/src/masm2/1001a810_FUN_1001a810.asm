.686
.MODEL FLAT, C
EXTRN sub_10016CD6:PROC
EXTRN sub_10016DED:PROC
EXTRN sub_1001A5A4:PROC
EXTRN sub_1001A948:PROC
EXTRN sub_1001A9B9:PROC
EXTRN sub_1001A9EE:PROC
EXTRN sub_1001A9F2:PROC
EXTRN sub_1005F6DE:PROC
EXTRN sub_1005F744:PROC
EXTRN sub_100F5E06:PROC
EXTRN EXTRN g_1019BD80:DWORD:DWORD
EXTRN EXTRN g_1019BED4:DWORD:DWORD
EXTRN EXTRN g_101AAC70:DWORD:DWORD
.CODE
FUN_1001a810 PROC
    sub sub esp, 16
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 28]
    push push esi
    mov mov esi, eax
    mov mov eax, dword ptr [g_101AAC70]
    imul imul eax, eax, 045Ch
    add add eax, 0101A66B0h
    mov mov cl, byte ptr [eax + 0404h]
    xor xor bl, bl
    cmp cmp cl, bl
    push push edi
    je L0
    mov mov ecx, dword ptr [eax + 0418h]
    mov mov byte ptr [eax + 0404h], bl
    mov mov dword ptr [esi], ecx
    mov mov edx, dword ptr [eax + 0414h]
    mov mov dword ptr [eax + 0400h], edx
    push push esi
    mov mov eax, 1
    call sub_1005F6DE
    push push eax
    call sub_100F5E06
    fmul fmul dword ptr [g_1019BED4]
    add add esp, 8
    fstp fstp dword ptr [esp + 16]
    fld fld qword ptr [g_1019BD80]
    fstp fstp qword ptr [esp + 24]
    fld fld dword ptr [esp + 16]
    fadd fadd qword ptr [esp + 24]
    fistp fistp dword ptr [esp + 20]
    mov mov eax, dword ptr [g_101AAC70]
    imul imul eax, eax, 045Ch
    add add eax, 0101A66B0h
    cmp cmp byte ptr [eax + 0404h], bl
    je sub_1001A948
    mov mov ecx, dword ptr [eax + 0418h]
    mov mov byte ptr [eax + 0404h], bl
    mov mov dword ptr [esi], ecx
    mov mov edx, dword ptr [eax + 0414h]
    mov mov dword ptr [eax + 0400h], edx
    push push esi
    mov mov eax, 1
    call sub_1005F744
    mov mov ebx, dword ptr [esp + 24]
    mov mov edi, eax
    lea lea eax, [esp + 24]
    push push eax
    push push ebp
    push push edi
    call sub_10016CD6
    add add esp, 16
    test test al, al
    je sub_1001A9B9
    mov mov ecx, dword ptr [esp + 20]
    mov mov eax, dword ptr [ecx*4 + 0101DA564h]
    test test eax, eax
    jne sub_1001A9EE
    push push ebx
    push push ebp
    push push edi
    call sub_1001A5A4
    mov mov esi, eax
    add add esp, 12
    test test esi, esi
    jne sub_1001A9F2
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 16
    ret ret
    push push esi
    push push ebp
    push push edi
    call sub_10016DED
    add add esp, 12
    mov mov eax, esi
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 16
    ret ret
FUN_1001a810 ENDP
END
