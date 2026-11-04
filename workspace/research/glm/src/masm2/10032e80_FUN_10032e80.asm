.686
.MODEL FLAT, C
EXTRN sub_10032F3D:PROC
EXTRN sub_10032F49:PROC
EXTRN sub_10032F59:PROC
EXTRN sub_10032F6A:PROC
EXTRN sub_10032F74:PROC
EXTRN EXTRN g_101D494C:DWORD:DWORD
EXTRN EXTRN g_101D4950:DWORD:DWORD
EXTRN EXTRN g_101D4958:DWORD:DWORD
.CODE
FUN_10032e80 PROC
    mov mov al, byte ptr [g_101D4958]
    sub sub esp, 8
    test test al, al
    je sub_10032F3D
    mov mov eax, dword ptr [g_101D494C]
    mov mov ecx, dword ptr [eax]
    push push 1
    push push 0
    push push 0
    push push eax
    call call dword ptr [ecx + 28]
    cmp cmp eax, 088760868h
    je L0
    cmp cmp eax, 1
    setne setne al
    test test al, al
    je L1
    mov mov byte ptr [g_101D4958], 0
    add add esp, 8
    ret ret
    push push esi
    rdtsc rdtsc
    mov mov dword ptr [esp + 8], edx
    mov mov esi, eax
    mov mov al, byte ptr [g_101D4958]
    test test al, al
    je sub_10032F59
    mov mov eax, dword ptr [g_101D494C]
    mov mov edx, dword ptr [eax]
    push push 1
    push push 0
L0:
    push push 0
    push push eax
    call call dword ptr [edx + 28]
    cmp cmp eax, 088760868h
    je sub_10032F6A
    cmp cmp eax, 1
    setne setne al
    test test al, al
L1:
    jne sub_10032F74
    rdtsc rdtsc
    mov mov ecx, dword ptr [g_101D4950]
    sub sub eax, esi
    cmp cmp eax, ecx
    mov mov dword ptr [esp + 8], edx
    jle sub_10032F49
    mov mov byte ptr [g_101D4958], 0
    rdtsc rdtsc
    mov mov ecx, dword ptr [g_101D4950]
    sub sub eax, esi
    lea lea eax, [eax + eax*2]
    mov mov dword ptr [esp + 8], edx
    cdq cdq
    and and edx, 3
    add add eax, edx
    sar sar eax, 2
    add add ecx, eax
    mov mov dword ptr [g_101D4950], ecx
    pop pop esi
    add add esp, 8
    ret ret
FUN_10032e80 ENDP
END
