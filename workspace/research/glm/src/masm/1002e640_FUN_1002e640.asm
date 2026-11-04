.686
.MODEL FLAT, C
EXTRN g_1019BC78:DWORD
EXTRN g_101CE708:DWORD
.CODE
FUN_1002e640 PROC
    mov ecx, dword ptr [g_101CE708]
    cmp dword ptr [ecx + 8], 2
    jne L0
    fld dword ptr [g_1019BC78]
    lea eax, [eax + eax*8]
    fdiv dword ptr [esp + 16]
    shl eax, 2
    xor ecx, ecx
    fld dword ptr [esp + 4]
    fmul st(1)
    fstp dword ptr [eax + 0106D3200h]
    fld dword ptr [esp + 8]
    fmul st(1)
    fstp dword ptr [eax + 0106D3204h]
    fmul dword ptr [esp + 12]
    fstp dword ptr [eax + 0106D3208h]
    mov dword ptr [eax + 0106D320Ch], ecx
    mov dword ptr [eax + 0106D3210h], ecx
    mov ecx, dword ptr [esp + 20]
    mov dword ptr [eax + 0106D3214h], 03F800000h
    mov edx, dword ptr [edx]
    mov dword ptr [eax + 0106D3218h], edx
    mov edx, dword ptr [esp + 24]
    mov dword ptr [eax + 0106D321Ch], ecx
    mov dword ptr [eax + 0106D3220h], edx
    ret
L0:
    mov ecx, dword ptr [esp + 4]
    shl eax, 6
    mov dword ptr [eax + 0106D3200h], ecx
    mov ecx, dword ptr [esp + 8]
    mov dword ptr [eax + 0106D3204h], ecx
    mov ecx, dword ptr [esp + 12]
    mov dword ptr [eax + 0106D3208h], ecx
    mov ecx, dword ptr [esp + 16]
    mov dword ptr [eax + 0106D320Ch], ecx
    mov dword ptr [eax + 0106D3218h], 03F800000h
    xor ecx, ecx
    mov dword ptr [eax + 0106D3210h], ecx
    mov dword ptr [eax + 0106D3214h], ecx
    mov edx, dword ptr [edx]
    mov dword ptr [eax + 0106D321Ch], edx
    mov edx, dword ptr [esp + 20]
    mov dword ptr [eax + 0106D3220h], edx
    mov edx, dword ptr [esp + 24]
    mov dword ptr [eax + 0106D3224h], edx
    mov dword ptr [eax + 0106D3234h], 03F800000h
    mov dword ptr [eax + 0106D3238h], ecx
    mov dword ptr [eax + 0106D323Ch], ecx
    mov dword ptr [eax + 0106D3228h], ecx
    mov dword ptr [eax + 0106D322Ch], 03F800000h
    mov dword ptr [eax + 0106D3230h], ecx
    ret
FUN_1002e640 ENDP
END
