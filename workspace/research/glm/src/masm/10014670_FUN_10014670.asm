.686
.MODEL FLAT, C
EXTRN sub_10041A47:PROC
EXTRN sub_10041B4E:PROC
EXTRN sub_10041E53:PROC
EXTRN sub_10044D88:PROC
EXTRN sub_10046E2C:PROC
EXTRN sub_10046FAA:PROC
EXTRN sub_1005591C:PROC
EXTRN fp_101D49D8:DWORD
EXTRN fp_101D49F8:DWORD
EXTRN fp_101D4B14:DWORD
EXTRN g_1019BC88:DWORD
EXTRN g_101D7EA8:DWORD
.CODE
FUN_10014670 PROC
    sub esp, 000000208h
    mov edx, dword ptr [esp + 20]
    push ebx
    push ebp
    push esi
    push edi
    mov eax, 010014610h
    mov ecx, 010014620h
    mov esi, eax
    mov ebp, ecx
    xor ebx, ebx
    xor eax, eax
    mov ecx, 92
    lea edi, [esp + 24]
    rep stosd dword ptr es:[edi], eax
    lea eax, [esp + 000000188h]
    lea edi, [esp + 24]
    mov dword ptr [esp + 000000188h], 010051F90h
    mov dword ptr [esp + 00000018Ch], 010052010h
    mov dword ptr [esp + 000000190h], 010051FD0h
    mov dword ptr [esp + 000000194h], 010052050h
    mov dword ptr [esp + 000000198h], 010052100h
    mov dword ptr [esp + 0000001F0h], ebx
    mov dword ptr [esp + 0000001F4h], ebx
    mov dword ptr [esp + 00000019Ch], ebx
    mov dword ptr [esp + 0000001F8h], 010190EE8h
    mov dword ptr [esp + 0000001FCh], 123
    mov dword ptr [esp + 000000200h], ebx
    mov dword ptr [esp + 000000204h], ebx
    mov dword ptr [esp + 000000208h], ebx
    mov dword ptr [esp + 00000020Ch], 010014630h
    mov dword ptr [esp + 000000210h], 010014650h
    mov dword ptr [esp + 24], eax
    mov dword ptr [esp + 36], edx
    mov dword ptr [esp + 48], esi
    mov dword ptr [esp + 52], ebp
    mov byte ptr [esp + 40], bl
    call sub_1005591C
    xor ecx, ecx
    mov dword ptr [esp + 104], ecx
    mov dword ptr [esp + 108], ecx
    mov dword ptr [esp + 112], ecx
    mov dword ptr [esp + 32], ebx
    mov dword ptr [esp + 56], ebx
    mov dword ptr [esp + 100], ebx
    mov dword ptr [esp + 116], ecx
    xor eax, eax
    lea esp, [esp]
L0:
    mov dword ptr [esp + eax*4 + 120], ebx
    mov dword ptr [esp + eax*4 + 000000088h], ebx
    inc eax
    cmp eax, 4
    jl L0
    mov edi, dword ptr [esp + 000000224h]
    fld qword ptr [g_1019BC88]
    mov eax, edi
    fstp qword ptr [esp + 80]
    imul eax, dword ptr [esp + 000000228h]
    lea esi, [eax + eax*2]
    push esi
    mov dword ptr [esp + 000000184h], ebx
    mov dword ptr [esp + 48], 100
    call dword ptr [fp_101D49D8]
    mov ebp, eax
    mov eax, dword ptr [esp + 60]
    add esp, 4
    cmp eax, ebx
    jne L1
    mov eax, dword ptr [esp + 28]
    push 28
    lea edx, [esp + 28]
    push ebx
    push edx
    call dword ptr [eax]
    add esp, 12
    mov dword ptr [esp + 56], eax
L1:
    mov ecx, dword ptr [esp + 000000228h]
    mov dword ptr [eax + 8], 010014580h
    mov dword ptr [eax + 12], 0100145A0h
    mov dword ptr [eax + 16], 0100145B0h
    mov dword ptr [eax + 20], ebp
    mov dword ptr [eax + 24], esi
    lea eax, [esp + 24]
    mov dword ptr [esp + 60], edi
    mov dword ptr [esp + 64], ecx
    mov dword ptr [esp + 68], 3
    mov dword ptr [esp + 72], 2
    call sub_10046FAA
    mov eax, dword ptr [esp + 000000220h]
    push 1
    lea ecx, [esp + 28]
    call sub_10046E2C
    mov eax, dword ptr [esp + 48]
    add esp, 4
    cmp eax, 100
    je L2
    mov edx, dword ptr [esp + 24]
    mov dword ptr [edx + 20], 20
    mov eax, dword ptr [esp + 24]
    mov ecx, dword ptr [esp + 44]
    lea edx, [esp + 24]
    mov dword ptr [eax + 24], ecx
    mov eax, dword ptr [esp + 24]
    push edx
    call dword ptr [eax]
    add esp, 4
L2:
    xor dl, dl
    lea eax, [esp + 24]
    call sub_10041A47
    mov edx, dword ptr [esp + 24]
    lea ecx, [esp + 24]
    push ecx
    call dword ptr [edx + 0x10]
    mov ecx, dword ptr [esp + 60]
    lea eax, [esp + 28]
    push eax
    call dword ptr [ecx + 8]
    lea eax, [esp + 32]
    call sub_10044D88
    mov eax, dword ptr [esp + 000000164h]
    lea edx, [esp + 32]
    push edx
    call dword ptr [eax]
    mov dl, byte ptr [esp + 0000000DCh]
    xor ecx, ecx
    xor eax, eax
    add esp, 12
    cmp dl, bl
    setne cl
    mov dword ptr [esp + 0000000F0h], eax
    lea edi, [edi + edi*2]
    add ecx, 101
    mov dword ptr [esp + 44], ecx
    cmp dword ptr [esp + 64], ebx
    jbe L4
L3:
    mov ecx, dword ptr [esp + 00000022Ch]
    imul eax, edi
    add eax, ecx
    lea edx, [esp + 20]
    mov dword ptr [esp + 20], eax
    push edx
    mov eax, 1
    lea esi, [esp + 28]
    call sub_10041E53
    mov eax, dword ptr [esp + 0000000F4h]
    mov ecx, dword ptr [esp + 68]
    add esp, 4
    cmp eax, ecx
    jb L3
L4:
    lea esi, [esp + 24]
    call sub_10041B4E
    mov eax, dword ptr [g_101D7EA8]
    mov ecx, dword ptr [esp + 00000021Ch]
    push eax
    push ebp
    push ecx
    call dword ptr [fp_101D4B14]
    push ebp
    call dword ptr [fp_101D49F8]
    mov eax, dword ptr [esp + 44]
    add esp, 16
    cmp eax, ebx
    je L5
    mov edx, esi
    push edx
    call dword ptr [eax + 0x28]
    add esp, 4
L5:
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 000000208h
    ret
FUN_10014670 ENDP
END
