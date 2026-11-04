.686
.MODEL FLAT, C
EXTRN sub_100115AB:PROC
EXTRN g_1019BD80:DWORD
EXTRN g_1019BDC4:DWORD
EXTRN g_101CE804:DWORD
EXTRN g_101D4C6C:DWORD
EXTRN g_101D4C70:DWORD
EXTRN g_101D4C74:DWORD
EXTRN g_101D4C78:DWORD
EXTRN g_101D4C7C:DWORD
EXTRN g_101D4C80:DWORD
.CODE
FUN_100115f0 PROC
    mov ecx, dword ptr [eax + 20]
    mov edx, dword ptr [eax + 24]
    mov dword ptr [g_101D4C6C], ecx
    mov ecx, dword ptr [eax + 4]
    mov dword ptr [g_101D4C70], edx
    movzx edx, byte ptr [eax + 8]
    mov eax, dword ptr [g_101CE804]
    mov eax, dword ptr [eax + 8]
    sub esp, 20
    cmp eax, 3
    push ebx
    push esi
    mov dword ptr [g_101D4C74], ecx
    mov dword ptr [g_101D4C78], edx
    ja L2
    jmp dword ptr [eax*4 + 0x100116b0]
    lea ebx, [esp + 8]
    lea esi, [esp + 12]
    call sub_100115AB
    fild dword ptr [esp + 8]
    fmul dword ptr [g_1019BDC4]
    fidiv dword ptr [esp + 12]
    fstp dword ptr [esp + 12]
    fld qword ptr [g_1019BD80]
    fstp qword ptr [esp + 16]
    fld dword ptr [esp + 12]
    fadd qword ptr [esp + 16]
    fistp dword ptr [esp + 8]
    mov eax, dword ptr [esp + 8]
    cmp eax, 10
    je L1
    jge L0
    mov dword ptr [g_101D4C7C], 03FE38E39h
    jmp L2
L0:
    mov dword ptr [g_101D4C7C], 03FAAAAABh
    jmp L2
L1:
    mov dword ptr [g_101D4C7C], 03FCCCCCDh
L2:
    fild dword ptr [g_101D4C70]
    pop esi
    pop ebx
    fmul dword ptr [g_101D4C7C]
    fidiv dword ptr [g_101D4C6C]
    fstp dword ptr [g_101D4C80]
    add esp, 20
    ret
FUN_100115f0 ENDP
END
