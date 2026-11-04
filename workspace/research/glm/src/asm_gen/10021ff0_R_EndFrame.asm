; R_EndFrame @ 0x10021ff0 — auto-synthesized
    EXTRN g_101d49b0:DWORD
    EXTRN g_101d4d00:DWORD
    EXTRN g_101da9c8:DWORD
    EXTRN g_101e4a00:DWORD
    EXTRN g_101e4a04:DWORD
    EXTRN g_101e4a08:DWORD
    EXTRN g_1042e778:DWORD
    sub_1001e574 PROTO C
.CODE
R_EndFrame PROC
    mov al, byte ptr [g_101d4d00]
    test al, al
    je L0
    mov eax, dword ptr [g_1042e778]
    mov ecx, dword ptr [g_101da9c8]
    mov dword ptr [g_101e4a00], eax
    mov eax, dword ptr [g_101d49b0]
    test eax, eax
    mov dword ptr [g_101e4a04], ecx
    je L1
    mov byte ptr [g_101e4a08], 1
    call sub_1001e574
    mov dword ptr [g_1042e778], 0x103fe718
    mov dword ptr [g_101da9c8], 0x101e4a0c
    ret
R_EndFrame ENDP
END