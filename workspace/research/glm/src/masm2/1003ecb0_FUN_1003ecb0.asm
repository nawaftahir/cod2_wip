.686
.MODEL FLAT, C
EXTRN sub_1003ED22:PROC
EXTRN sub_1003ED25:PROC
EXTRN sub_100F6C84:PROC
EXTRN sub_100F6D40:PROC
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
EXTRN EXTRN g_1076674C:DWORD:DWORD
EXTRN EXTRN g_1076675C:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_1003ecb0 PROC
    mov mov eax, dword ptr [g_1076674C]
    mov mov dword ptr [g_1076675C], eax
    mov mov dword ptr [g_1076674C], esi
    mov mov ecx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [ecx + 8]
    test test eax, eax
    je L0
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je sub_1003ED25
    push push 01019903Ch
    push push 010193358h
    push push eax
    call sub_100F6D40
    mov mov edx, dword ptr [g_10764584]
    push push edx
    call sub_100F6C84
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push esi
    push push eax
    call call dword ptr [ecx + 01A0h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_1003ED22
    mov mov dword ptr [g_1076675C], 0
    ret ret
FUN_1003ecb0 ENDP
END
