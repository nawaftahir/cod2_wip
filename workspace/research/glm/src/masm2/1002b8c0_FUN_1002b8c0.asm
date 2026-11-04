.686
.MODEL FLAT, C
EXTRN EXTRN g_101DA9C8:DWORD:DWORD
EXTRN EXTRN g_106A312C:DWORD:DWORD
.CODE
FUN_1002b8c0 PROC
    sub sub eax, 010696D00h
    mov mov ecx, eax
    mov mov eax, 05397829Dh
    imul imul ecx
    mov mov ecx, dword ptr [g_101DA9C8]
    sar sar edx, 7
    mov mov eax, edx
    shr shr eax, 31
    add add eax, edx
    mov mov edx, dword ptr [ecx]
    imul imul eax, eax, 0188h
    add add eax, 010696D00h
    mov mov ecx, dword ptr [eax + 4]
    mov mov dword ptr [eax + 8], edx
    mov mov edx, dword ptr [eax]
    mov mov dword ptr [ecx], edx
    mov mov ecx, dword ptr [eax]
    mov mov edx, dword ptr [eax + 4]
    mov mov dword ptr [ecx + 4], edx
    mov mov dword ptr [eax], 0106A3128h
    mov mov ecx, dword ptr [g_106A312C]
    mov mov dword ptr [eax + 4], ecx
    mov mov dword ptr [g_106A312C], eax
    mov mov edx, dword ptr [eax + 4]
    mov mov dword ptr [edx], eax
    ret ret
FUN_1002b8c0 ENDP
END
