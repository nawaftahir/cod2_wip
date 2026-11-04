.686
.MODEL FLAT, C
EXTRN sub_100227EA:PROC
EXTRN g_101D4C6C:DWORD
EXTRN g_101D4C70:DWORD
EXTRN g_101D4C78:DWORD
.CODE
FUN_100227c0 PROC
    mov eax, dword ptr [g_101D4C78]
    test eax, eax
    je sub_100227EA
    mov eax, dword ptr [g_101D4C6C]
    mov ecx, dword ptr [esp + 4]
    mov edx, dword ptr [g_101D4C70]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [esp + 8]
    mov dword ptr [eax], edx
    ret
FUN_100227c0 ENDP
END
