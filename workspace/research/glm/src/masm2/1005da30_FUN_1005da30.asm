.686
.MODEL FLAT, C
EXTRN sub_1005DCE3:PROC
EXTRN EXTRN g_1076A83C:DWORD:DWORD
EXTRN EXTRN g_1076A840:DWORD:DWORD
EXTRN EXTRN g_1076A844:DWORD:DWORD
EXTRN EXTRN g_1076A848:DWORD:DWORD
EXTRN EXTRN g_1076A84C:DWORD:DWORD
EXTRN EXTRN g_1076A850:DWORD:DWORD
EXTRN EXTRN g_1076A854:DWORD:DWORD
EXTRN EXTRN g_1076A858:DWORD:DWORD
EXTRN EXTRN g_1076A85C:DWORD:DWORD
.CODE
FUN_1005da30 PROC
    push push ebx
    cmp cmp dword ptr [g_1076A85C], 1
    je L0
    mov mov dword ptr [g_1076A85C], 1
    mov mov dword ptr [g_1076A83C], 01005DAB8h
    mov mov dword ptr [g_1076A840], 01005DAEBh
    mov mov dword ptr [g_1076A844], 01005DB1Eh
    mov mov dword ptr [g_1076A848], 01005DB51h
    mov mov dword ptr [g_1076A84C], 01005DB84h
    mov mov dword ptr [g_1076A850], 01005DBB7h
    mov mov dword ptr [g_1076A854], 01005DBE7h
    mov mov dword ptr [g_1076A858], 01005DC17h
    mov mov edx, dword ptr [esp + 16]
    mov mov ecx, dword ptr [esp + 8]
    xor xor eax, eax
L0:
    mov mov ebx, dword ptr [esp + 12]
    mov mov al, byte ptr [edx + 17]
    cmp cmp al, 8
    jae sub_1005DCE3
    fld fld dword ptr [edx]
    fld fld st(0)
    jmp jmp dword ptr [eax*4 + 01076A83Ch]
FUN_1005da30 ENDP
END
