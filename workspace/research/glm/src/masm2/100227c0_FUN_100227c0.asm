.686
.MODEL FLAT, C
EXTRN sub_100227EA:PROC
EXTRN EXTRN g_101D4C6C:DWORD:DWORD
EXTRN EXTRN g_101D4C70:DWORD:DWORD
EXTRN EXTRN g_101D4C78:DWORD:DWORD
.CODE
FUN_100227c0 PROC
    mov mov eax, dword ptr [g_101D4C78]
    test test eax, eax
    je sub_100227EA
    mov mov eax, dword ptr [g_101D4C6C]
    mov mov ecx, dword ptr [esp + 4]
    mov mov edx, dword ptr [g_101D4C70]
    mov mov dword ptr [ecx], eax
    mov mov eax, dword ptr [esp + 8]
    mov mov dword ptr [eax], edx
    ret ret
FUN_100227c0 ENDP
END
