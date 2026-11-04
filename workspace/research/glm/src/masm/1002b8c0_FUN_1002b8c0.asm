.686
.MODEL FLAT, C
EXTRN g_101DA9C8:DWORD
EXTRN g_106A312C:DWORD
.CODE
FUN_1002b8c0 PROC
    sub eax, 010696D00h
    mov ecx, eax
    mov eax, 05397829Dh
    imul ecx
    mov ecx, dword ptr [g_101DA9C8]
    sar edx, 7
    mov eax, edx
    shr eax, 31
    add eax, edx
    mov edx, dword ptr [ecx]
    imul eax, eax, 000000188h
    add eax, 010696D00h
    mov ecx, dword ptr [eax + 4]
    mov dword ptr [eax + 8], edx
    mov edx, dword ptr [eax]
    mov dword ptr [ecx], edx
    mov ecx, dword ptr [eax]
    mov edx, dword ptr [eax + 4]
    mov dword ptr [ecx + 4], edx
    mov dword ptr [eax], 0106A3128h
    mov ecx, dword ptr [g_106A312C]
    mov dword ptr [eax + 4], ecx
    mov dword ptr [g_106A312C], eax
    mov edx, dword ptr [eax + 4]
    mov dword ptr [edx], eax
    ret
FUN_1002b8c0 ENDP
END
