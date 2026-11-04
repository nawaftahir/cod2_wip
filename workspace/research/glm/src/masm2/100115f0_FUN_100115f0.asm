.686
.MODEL FLAT, C
EXTRN sub_100115AB:PROC
EXTRN sub_100116C7:PROC
EXTRN sub_100116F8:PROC
EXTRN sub_10011702:PROC
EXTRN sub_1001171A:PROC
EXTRN sub_10011726:PROC
EXTRN EXTRN g_1019BD80:DWORD:DWORD
EXTRN EXTRN g_1019BDC4:DWORD:DWORD
EXTRN EXTRN g_101CE804:DWORD:DWORD
EXTRN EXTRN g_101D4C6C:DWORD:DWORD
EXTRN EXTRN g_101D4C70:DWORD:DWORD
EXTRN EXTRN g_101D4C74:DWORD:DWORD
EXTRN EXTRN g_101D4C78:DWORD:DWORD
EXTRN EXTRN g_101D4C7C:DWORD:DWORD
EXTRN EXTRN g_101D4C80:DWORD:DWORD
.CODE
FUN_100115f0 PROC
    mov mov ecx, dword ptr [eax + 20]
    mov mov edx, dword ptr [eax + 24]
    mov mov dword ptr [g_101D4C6C], ecx
    mov mov ecx, dword ptr [eax + 4]
    mov mov dword ptr [g_101D4C70], edx
    movzx movzx edx, byte ptr [eax + 8]
    mov mov eax, dword ptr [g_101CE804]
    mov mov eax, dword ptr [eax + 8]
    sub sub esp, 20
    cmp cmp eax, 3
    push push ebx
    push push esi
    mov mov dword ptr [g_101D4C74], ecx
    mov mov dword ptr [g_101D4C78], edx
    ja sub_100116C7
    jmp jmp dword ptr [eax*4 + 0100116B0h]
    lea lea ebx, [esp + 8]
    lea lea esi, [esp + 12]
    call sub_100115AB
    fild fild dword ptr [esp + 8]
    fmul fmul dword ptr [g_1019BDC4]
    fidiv fidiv dword ptr [esp + 12]
    fstp fstp dword ptr [esp + 12]
    fld fld qword ptr [g_1019BD80]
    fstp fstp qword ptr [esp + 16]
    fld fld dword ptr [esp + 12]
    fadd fadd qword ptr [esp + 16]
    fistp fistp dword ptr [esp + 8]
    mov mov eax, dword ptr [esp + 8]
    cmp cmp eax, 10
    je sub_10011702
    jge sub_100116F8
    mov mov dword ptr [g_101D4C7C], 03FE38E39h
    jmp sub_1001171A
    mov mov dword ptr [g_101D4C7C], 03FAAAAABh
    jmp sub_10011726
    mov mov dword ptr [g_101D4C7C], 03FCCCCCDh
    fild fild dword ptr [g_101D4C70]
    pop pop esi
    pop pop ebx
    fmul fmul dword ptr [g_101D4C7C]
    fidiv fidiv dword ptr [g_101D4C6C]
    fstp fstp dword ptr [g_101D4C80]
    add add esp, 20
    ret ret
FUN_100115f0 ENDP
END
