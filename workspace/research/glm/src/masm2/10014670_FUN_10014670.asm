.686
.MODEL FLAT, C
EXTRN sub_10014A24:PROC
EXTRN sub_10014B45:PROC
EXTRN sub_10014BE3:PROC
EXTRN sub_10041A47:PROC
EXTRN sub_10041B4E:PROC
EXTRN sub_10041E53:PROC
EXTRN sub_10044D88:PROC
EXTRN sub_10046E2C:PROC
EXTRN sub_10046FAA:PROC
EXTRN sub_1005591C:PROC
EXTRN EXTRN fp_101D49D8:DWORD:DWORD
EXTRN EXTRN fp_101D49F8:DWORD:DWORD
EXTRN EXTRN fp_101D4B14:DWORD:DWORD
EXTRN EXTRN g_1019BC88:DWORD:DWORD
EXTRN EXTRN g_101D7EA8:DWORD:DWORD
.CODE
FUN_10014670 PROC
    sub sub esp, 0208h
    mov mov edx, dword ptr [esp + 20]
    push push ebx
    push push ebp
    push push esi
    push push edi
    mov mov eax, 010014610h
    mov mov ecx, 010014620h
    mov mov esi, eax
    mov mov ebp, ecx
    xor xor ebx, ebx
    xor xor eax, eax
    mov mov ecx, 92
    lea lea edi, [esp + 24]
    rep stosd rep stosd dword ptr es:[edi], eax
    lea lea eax, [esp + 0188h]
    lea lea edi, [esp + 24]
    mov mov dword ptr [esp + 0188h], 010051F90h
    mov mov dword ptr [esp + 018Ch], 010052010h
    mov mov dword ptr [esp + 0190h], 010051FD0h
    mov mov dword ptr [esp + 0194h], 010052050h
    mov mov dword ptr [esp + 0198h], 010052100h
    mov mov dword ptr [esp + 01F0h], ebx
    mov mov dword ptr [esp + 01F4h], ebx
    mov mov dword ptr [esp + 019Ch], ebx
    mov mov dword ptr [esp + 01F8h], 010190EE8h
    mov mov dword ptr [esp + 01FCh], 123
    mov mov dword ptr [esp + 0200h], ebx
    mov mov dword ptr [esp + 0204h], ebx
    mov mov dword ptr [esp + 0208h], ebx
    mov mov dword ptr [esp + 020Ch], 010014630h
    mov mov dword ptr [esp + 0210h], 010014650h
    mov mov dword ptr [esp + 24], eax
    mov mov dword ptr [esp + 36], edx
    mov mov dword ptr [esp + 48], esi
    mov mov dword ptr [esp + 52], ebp
    mov mov byte ptr [esp + 40], bl
    call sub_1005591C
    xor xor ecx, ecx
    mov mov dword ptr [esp + 104], ecx
    mov mov dword ptr [esp + 108], ecx
    mov mov dword ptr [esp + 112], ecx
    mov mov dword ptr [esp + 32], ebx
    mov mov dword ptr [esp + 56], ebx
    mov mov dword ptr [esp + 100], ebx
    mov mov dword ptr [esp + 116], ecx
    xor xor eax, eax
    lea lea esp, [esp]
    mov mov dword ptr [esp + eax*4 + 120], ebx
    mov mov dword ptr [esp + eax*4 + 088h], ebx
    inc inc eax
    cmp cmp eax, 4
    jl L0
    mov mov edi, dword ptr [esp + 0224h]
    fld fld qword ptr [g_1019BC88]
    mov mov eax, edi
    fstp fstp qword ptr [esp + 80]
    imul imul eax, dword ptr [esp + 0228h]
    lea lea esi, [eax + eax*2]
    push push esi
    mov mov dword ptr [esp + 0184h], ebx
    mov mov dword ptr [esp + 48], 100
    call dword ptr [fp_101D49D8]
    mov mov ebp, eax
    mov mov eax, dword ptr [esp + 60]
    add add esp, 4
    cmp cmp eax, ebx
    jne L1
    mov mov eax, dword ptr [esp + 28]
    push push 28
    lea lea edx, [esp + 28]
    push push ebx
    push push edx
    call call dword ptr [eax]
    add add esp, 12
    mov mov dword ptr [esp + 56], eax
    mov mov ecx, dword ptr [esp + 0228h]
    mov mov dword ptr [eax + 8], 010014580h
    mov mov dword ptr [eax + 12], 0100145A0h
    mov mov dword ptr [eax + 16], 0100145B0h
    mov mov dword ptr [eax + 20], ebp
    mov mov dword ptr [eax + 24], esi
    lea lea eax, [esp + 24]
    mov mov dword ptr [esp + 60], edi
    mov mov dword ptr [esp + 64], ecx
    mov mov dword ptr [esp + 68], 3
    mov mov dword ptr [esp + 72], 2
    call sub_10046FAA
    mov mov eax, dword ptr [esp + 0220h]
    push push 1
    lea lea ecx, [esp + 28]
    call sub_10046E2C
    mov mov eax, dword ptr [esp + 48]
    add add esp, 4
    cmp cmp eax, 100
    je sub_10014A24
    mov mov edx, dword ptr [esp + 24]
    mov mov dword ptr [edx + 20], 20
    mov mov eax, dword ptr [esp + 24]
    mov mov ecx, dword ptr [esp + 44]
    lea lea edx, [esp + 24]
    mov mov dword ptr [eax + 24], ecx
    mov mov eax, dword ptr [esp + 24]
    push push edx
    call call dword ptr [eax]
    add add esp, 4
    xor xor dl, dl
    lea lea eax, [esp + 24]
    call sub_10041A47
    mov mov edx, dword ptr [esp + 24]
    lea lea ecx, [esp + 24]
    push push ecx
    call call dword ptr [edx + 16]
    mov mov ecx, dword ptr [esp + 60]
    lea lea eax, [esp + 28]
    push push eax
    call call dword ptr [ecx + 8]
    lea lea eax, [esp + 32]
    call sub_10044D88
    mov mov eax, dword ptr [esp + 0164h]
    lea lea edx, [esp + 32]
    push push edx
    call call dword ptr [eax]
    mov mov dl, byte ptr [esp + 0DCh]
    xor xor ecx, ecx
    xor xor eax, eax
    add add esp, 12
    cmp cmp dl, bl
    setne setne cl
    mov mov dword ptr [esp + 0F0h], eax
    lea lea edi, [edi + edi*2]
    add add ecx, 101
    mov mov dword ptr [esp + 44], ecx
    cmp cmp dword ptr [esp + 64], ebx
    jbe sub_10014B45
    mov mov ecx, dword ptr [esp + 022Ch]
    imul imul eax, edi
    add add eax, ecx
    lea lea edx, [esp + 20]
    mov mov dword ptr [esp + 20], eax
    push push edx
    mov mov eax, 1
    lea lea esi, [esp + 28]
    call sub_10041E53
    mov mov eax, dword ptr [esp + 0F4h]
    mov mov ecx, dword ptr [esp + 68]
    add add esp, 4
    cmp cmp eax, ecx
    jb sub_10014B45
    lea lea esi, [esp + 24]
    call sub_10041B4E
    mov mov eax, dword ptr [g_101D7EA8]
    mov mov ecx, dword ptr [esp + 021Ch]
    push push eax
    push push ebp
    push push ecx
    call dword ptr [fp_101D4B14]
    push push ebp
    call dword ptr [fp_101D49F8]
    mov mov eax, dword ptr [esp + 44]
    add add esp, 16
    cmp cmp eax, ebx
    je sub_10014BE3
    mov mov edx, esi
    push push edx
    call call dword ptr [eax + 40]
    add add esp, 4
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 0208h
    ret ret
FUN_10014670 ENDP
END
