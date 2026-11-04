; R_BeginFrame @ 0x10021f90 — auto-synthesized
    EXTRN fp_101d49f0:DWORD
    EXTRN fp_101d4af0:DWORD
    EXTRN g_101d49c0:DWORD
    EXTRN g_101d49c4:DWORD
    EXTRN g_101d4d00:DWORD
    EXTRN g_101da9c8:DWORD
    sub_100058d9 PROTO C
    sub_1001e553 PROTO C
    sub_10020d81 PROTO C
    sub_10032e2e PROTO C
.CODE
R_BeginFrame PROC
    mov al, byte ptr [g_101d4d00]
    test al, al
    je L0
    call sub_10032e2e
    call sub_1001e553
    call dword ptr [fp_101d4af0]
    mov eax, dword ptr [g_101da9c8]
    add eax, 0x249d18
    push eax
    call sub_100058d9
    add esp, 4
    call sub_10020d81
    mov eax, dword ptr [g_101d49c4]
    test eax, eax
    je L0
    mov ecx, dword ptr [g_101d49c0]
    push eax
    push ecx
    call dword ptr [fp_101d49f0]
    add esp, 8
    mov dword ptr [g_101d49c4], 0
    ret
R_BeginFrame ENDP
END