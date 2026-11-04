; FUN_10021040 @ 0x10021040 — auto-synthesized
    EXTRN g_101d49bc:DWORD
    EXTRN g_101d4d1c:DWORD
    EXTRN g_101da9c8:DWORD
    EXTRN g_1042e778:DWORD
    EXTRN g_1042e780:DWORD
    sub_1001e55f PROTO C
.CODE
FUN_10021040 PROC
    mov eax, dword ptr [g_101d4d1c]
    inc eax
    mov dword ptr [g_101da9c8], 0x1042e780
    mov dword ptr [g_101d4d1c], eax
    mov dword ptr [g_1042e780], eax
    call sub_1001e55f
    mov eax, dword ptr [g_101d49bc]
    inc eax
    and eax, 0x80000001
    jns L0
    dec eax
    or eax, 0xfffffffe
    inc eax
    mov dword ptr [g_101d49bc], eax
    xor ecx, ecx
    lea eax, [eax + eax*2]
    lea edx, [eax*4 + 0x101d4980]
    mov eax, dword ptr [g_101da9c8]
    mov dword ptr [eax + 0x217c78], edx
    mov dword ptr [edx], ecx
    mov dword ptr [eax + 4], ecx
    mov dword ptr [eax + 0x80008], ecx
    mov dword ptr [eax + 0xa000c], ecx
    mov dword ptr [eax + 0x187c70], ecx
    mov dword ptr [eax + 0x18fc74], ecx
    mov dword ptr [eax + 0x217c7c], ecx
    lea edx, [eax + 0x219d0c]
    mov dword ptr [g_1042e778], edx
    mov dword ptr [eax + 0x249d4c], ecx
    mov dword ptr [eax + 0x249d34], ecx
    mov dword ptr [eax + 0x249d1c], ecx
    ret
FUN_10021040 ENDP
END