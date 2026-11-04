.686
.MODEL FLAT, C
EXTRN sub_100F8F7A:PROC
EXTRN g_1019BC78:DWORD
EXTRN g_1019BD54:DWORD
EXTRN g_1019BD80:DWORD
EXTRN g_1019BE44:DWORD
EXTRN g_101CE62C:DWORD
.CODE
FUN_10011f10 PROC
    sub esp, 24
    fld dword ptr [g_1019BC78]
    mov eax, dword ptr [g_101CE62C]
    fdiv dword ptr [eax + 8]
    push ebx
    push esi
    push edi
    xor edi, edi
    mov dword ptr [esp + 12], edi
    mov esi, ecx
    mov ebx, 000000100h
    fstp dword ptr [esp + 16]
    jmp L0
    lea esp, [esp]
    mov edi, edi
L0:
    fld dword ptr [g_1019BC78]
    fld dword ptr [esp + 16]
    fucompp
    fnstsw ax
    test ah, 68
    jp L1
    mov eax, edi
    jmp L2
L1:
    fild dword ptr [esp + 12]
    fmul dword ptr [g_1019BD54]
    fld dword ptr [esp + 16]
    call sub_100F8F7A
    fmul dword ptr [g_1019BE44]
    fstp dword ptr [esp + 20]
    fld qword ptr [g_1019BD80]
    fstp qword ptr [esp + 28]
    fld dword ptr [esp + 20]
    fadd qword ptr [esp + 28]
    fistp dword ptr [esp + 24]
    mov eax, dword ptr [esp + 24]
L2:
    mov edx, dword ptr [esp + 12]
    add edi, 000000101h
    mov word ptr [esi], ax
    inc edx
    add esi, 2
    dec ebx
    mov dword ptr [esp + 12], edx
FUN_10011f10 ENDP
END
