; FUN_100388f0 @ 0x100388f0 — auto-synthesized
    EXTRN g_101d1b08:DWORD
    EXTRN g_101d1b0c:DWORD
.CODE
FUN_100388f0 PROC
    mov eax, dword ptr [eax + 8]
    test eax, eax
    je L0
    cmp eax, 1
    jne L1
    mov eax, dword ptr [g_101d1b08]
    mov dword ptr [edx], eax
    mov byte ptr [ecx], 1
    ret
    cmp eax, 2
    jne L0
    mov eax, dword ptr [g_101d1b0c]
    mov dword ptr [edx], eax
    mov byte ptr [ecx], 1
    ret
FUN_100388f0 ENDP
END