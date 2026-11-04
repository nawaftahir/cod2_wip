.686
.MODEL FLAT, C
EXTRN sub_10011FD5:PROC
EXTRN sub_100F8F7A:PROC
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_1019BD54:DWORD:DWORD
EXTRN EXTRN g_1019BD80:DWORD:DWORD
EXTRN EXTRN g_1019BE44:DWORD:DWORD
EXTRN EXTRN g_101CE62C:DWORD:DWORD
.CODE
FUN_10011f10 PROC
    sub sub esp, 24
    fld fld dword ptr [g_1019BC78]
    mov mov eax, dword ptr [g_101CE62C]
    fdiv fdiv dword ptr [eax + 8]
    push push ebx
    push push esi
    push push edi
    xor xor edi, edi
    mov mov dword ptr [esp + 12], edi
    mov mov esi, ecx
    mov mov ebx, 0100h
    fstp fstp dword ptr [esp + 16]
    jmp L0
    lea lea esp, [esp]
    mov mov edi, edi
    fld fld dword ptr [g_1019BC78]
    fld fld dword ptr [esp + 16]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp L1
    mov mov eax, edi
    jmp sub_10011FD5
    fild fild dword ptr [esp + 12]
    fmul fmul dword ptr [g_1019BD54]
    fld fld dword ptr [esp + 16]
    call sub_100F8F7A
    fmul fmul dword ptr [g_1019BE44]
    fstp fstp dword ptr [esp + 20]
    fld fld qword ptr [g_1019BD80]
    fstp fstp qword ptr [esp + 28]
    fld fld dword ptr [esp + 20]
    fadd fadd qword ptr [esp + 28]
    fistp fistp dword ptr [esp + 24]
    mov mov eax, dword ptr [esp + 24]
    mov mov edx, dword ptr [esp + 12]
    add add edi, 0101h
    mov mov word ptr [esi], ax
    inc inc edx
    add add esi, 2
    dec dec ebx
    mov mov dword ptr [esp + 12], edx
FUN_10011f10 ENDP
END
