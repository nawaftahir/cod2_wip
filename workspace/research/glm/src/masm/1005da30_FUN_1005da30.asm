.686
.MODEL FLAT, C
EXTRN sub_1005DCE3:PROC
EXTRN g_1076A83C:DWORD
EXTRN g_1076A840:DWORD
EXTRN g_1076A844:DWORD
EXTRN g_1076A848:DWORD
EXTRN g_1076A84C:DWORD
EXTRN g_1076A850:DWORD
EXTRN g_1076A854:DWORD
EXTRN g_1076A858:DWORD
EXTRN g_1076A85C:DWORD
.CODE
FUN_1005da30 PROC
    push ebx
    cmp dword ptr [g_1076A85C], 1
    je L0
    mov dword ptr [g_1076A85C], 1
    mov dword ptr [g_1076A83C], 01005DAB8h
    mov dword ptr [g_1076A840], 01005DAEBh
    mov dword ptr [g_1076A844], 01005DB1Eh
    mov dword ptr [g_1076A848], 01005DB51h
    mov dword ptr [g_1076A84C], 01005DB84h
    mov dword ptr [g_1076A850], 01005DBB7h
    mov dword ptr [g_1076A854], 01005DBE7h
    mov dword ptr [g_1076A858], 01005DC17h
L0:
    mov edx, dword ptr [esp + 16]
    mov ecx, dword ptr [esp + 8]
    xor eax, eax
    mov ebx, dword ptr [esp + 12]
    mov al, byte ptr [edx + 17]
    cmp al, 8
    jae sub_1005DCE3
    fld dword ptr [edx]
    fld st(0)
    jmp dword ptr [eax*4 + 0x1076a83c]
FUN_1005da30 ENDP
END
