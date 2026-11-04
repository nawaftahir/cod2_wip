; FUN_100227c0 @ 0x100227c0 — auto-synthesized
    EXTRN g_101d4c6c:DWORD
    EXTRN g_101d4c70:DWORD
    EXTRN g_101d4c78:DWORD
    sub_100227ea PROTO C
.CODE
FUN_100227c0 PROC
    mov eax, dword ptr [g_101d4c78]
    test eax, eax
    je sub_100227ea
    mov eax, dword ptr [g_101d4c6c]
    mov ecx, dword ptr [esp + 4]
    mov edx, dword ptr [g_101d4c70]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [esp + 8]
    mov dword ptr [eax], edx
    ret
FUN_100227c0 ENDP
END