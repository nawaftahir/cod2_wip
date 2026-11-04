.686
.MODEL FLAT, C
EXTRN g_1019BC78:DWORD
EXTRN g_101CE708:DWORD
.CODE
FUN_1002e740 PROC
    mov edx, dword ptr [g_101CE708]
    mov ecx, dword ptr [esp + 40]
    cmp dword ptr [edx + 8], 2
    jne L0
    fld dword ptr [g_1019BC78]
    mov edx, dword ptr [esp + 20]
    fdiv dword ptr [esp + 16]
    lea eax, [eax + eax*8]
    shl eax, 2
    fld dword ptr [esp + 4]
    fmul st(1)
    fstp dword ptr [eax + 0106D3200h]
    fld dword ptr [esp + 8]
    fmul st(1)
    fstp dword ptr [eax + 0106D3204h]
    fmul dword ptr [esp + 12]
    fstp dword ptr [eax + 0106D3208h]
    mov dword ptr [eax + 0106D320Ch], edx
    mov edx, dword ptr [esp + 24]
    mov dword ptr [eax + 0106D3210h], edx
    mov edx, dword ptr [esp + 28]
    mov dword ptr [eax + 0106D3214h], edx
    mov ecx, dword ptr [ecx]
    mov edx, dword ptr [esp + 32]
    mov dword ptr [eax + 0106D3218h], ecx
    mov ecx, dword ptr [esp + 36]
    mov dword ptr [eax + 0106D321Ch], edx
    mov dword ptr [eax + 0106D3220h], ecx
    ret
L0:
    mov edx, dword ptr [esp + 4]
    shl eax, 6
    mov dword ptr [eax + 0106D3200h], edx
    mov edx, dword ptr [esp + 8]
    mov dword ptr [eax + 0106D3204h], edx
    mov edx, dword ptr [esp + 12]
    mov dword ptr [eax + 0106D3208h], edx
    mov edx, dword ptr [esp + 16]
    mov dword ptr [eax + 0106D320Ch], edx
    mov edx, dword ptr [esp + 20]
    mov dword ptr [eax + 0106D3210h], edx
    mov edx, dword ptr [esp + 24]
    mov dword ptr [eax + 0106D3214h], edx
    mov edx, dword ptr [esp + 28]
    mov dword ptr [eax + 0106D3218h], edx
    mov ecx, dword ptr [ecx]
    mov edx, dword ptr [esp + 32]
    mov dword ptr [eax + 0106D321Ch], ecx
    mov ecx, dword ptr [esp + 36]
    mov dword ptr [eax + 0106D3220h], edx
    mov dword ptr [eax + 0106D3224h], ecx
    xor ecx, ecx
    mov edx, 03F800000h
    mov dword ptr [eax + 0106D3234h], edx
    mov dword ptr [eax + 0106D3238h], ecx
    mov dword ptr [eax + 0106D323Ch], ecx
    mov dword ptr [eax + 0106D3228h], ecx
    mov dword ptr [eax + 0106D322Ch], edx
    mov dword ptr [eax + 0106D3230h], ecx
    ret
FUN_1002e740 ENDP
END
