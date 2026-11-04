.686
.MODEL FLAT, C
EXTRN sub_1001E55F:PROC
EXTRN EXTRN g_101D49BC:DWORD:DWORD
EXTRN EXTRN g_101D4D1C:DWORD:DWORD
EXTRN EXTRN g_101DA9C8:DWORD:DWORD
EXTRN EXTRN g_1042E778:DWORD:DWORD
EXTRN EXTRN g_1042E780:DWORD:DWORD
.CODE
FUN_10021040 PROC
    mov mov eax, dword ptr [g_101D4D1C]
    inc inc eax
    mov mov dword ptr [g_101DA9C8], 01042E780h
    mov mov dword ptr [g_101D4D1C], eax
    mov mov dword ptr [g_1042E780], eax
    call sub_1001E55F
    mov mov eax, dword ptr [g_101D49BC]
    inc inc eax
    and and eax, 080000001h
    jns L0
    dec dec eax
    or or eax, -2
    inc inc eax
    mov mov dword ptr [g_101D49BC], eax
    xor xor ecx, ecx
    lea lea eax, [eax + eax*2]
    lea lea edx, [eax*4 + 0101D4980h]
    mov mov eax, dword ptr [g_101DA9C8]
    mov mov dword ptr [eax + 0217C78h], edx
    mov mov dword ptr [edx], ecx
    mov mov dword ptr [eax + 4], ecx
    mov mov dword ptr [eax + 080008h], ecx
    mov mov dword ptr [eax + 0A000Ch], ecx
    mov mov dword ptr [eax + 0187C70h], ecx
    mov mov dword ptr [eax + 018FC74h], ecx
    mov mov dword ptr [eax + 0217C7Ch], ecx
    lea lea edx, [eax + 0219D0Ch]
    mov mov dword ptr [g_1042E778], edx
    mov mov dword ptr [eax + 0249D4Ch], ecx
    mov mov dword ptr [eax + 0249D34h], ecx
    mov mov dword ptr [eax + 0249D1Ch], ecx
    ret ret
FUN_10021040 ENDP
END
