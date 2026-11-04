.686
.MODEL FLAT, C
EXTRN sub_1001E55F:PROC
EXTRN g_101D49BC:DWORD
EXTRN g_101D4D1C:DWORD
EXTRN g_101DA9C8:DWORD
EXTRN g_1042E778:DWORD
EXTRN g_1042E780:DWORD
.CODE
FUN_10021040 PROC
    mov eax, dword ptr [g_101D4D1C]
    inc eax
    mov dword ptr [g_101DA9C8], 01042E780h
    mov dword ptr [g_101D4D1C], eax
    mov dword ptr [g_1042E780], eax
    call sub_1001E55F
    mov eax, dword ptr [g_101D49BC]
    inc eax
    and eax, 080000001h
    jns L0
    dec eax
    or eax, 0FFFFFFFEh
    inc eax
L0:
    mov dword ptr [g_101D49BC], eax
    xor ecx, ecx
    lea eax, [eax + eax*2]
    lea edx, [eax*4 + 0101D4980h]
    mov eax, dword ptr [g_101DA9C8]
    mov dword ptr [eax + 000217C78h], edx
    mov dword ptr [edx], ecx
    mov dword ptr [eax + 4], ecx
    mov dword ptr [eax + 000080008h], ecx
    mov dword ptr [eax + 0000A000Ch], ecx
    mov dword ptr [eax + 000187C70h], ecx
    mov dword ptr [eax + 00018FC74h], ecx
    mov dword ptr [eax + 000217C7Ch], ecx
    lea edx, [eax + 000219D0Ch]
    mov dword ptr [g_1042E778], edx
    mov dword ptr [eax + 000249D4Ch], ecx
    mov dword ptr [eax + 000249D34h], ecx
    mov dword ptr [eax + 000249D1Ch], ecx
    ret
FUN_10021040 ENDP
END
