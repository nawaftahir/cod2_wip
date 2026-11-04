.686
.MODEL FLAT, C
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_101CE708:DWORD:DWORD
.CODE
FUN_1002e740 PROC
    mov mov edx, dword ptr [g_101CE708]
    mov mov ecx, dword ptr [esp + 40]
    cmp cmp dword ptr [edx + 8], 2
    jne L0
    fld fld dword ptr [g_1019BC78]
    mov mov edx, dword ptr [esp + 20]
    fdiv fdiv dword ptr [esp + 16]
    lea lea eax, [eax + eax*8]
    shl shl eax, 2
    fld fld dword ptr [esp + 4]
    fmul fmul st(1)
    fstp fstp dword ptr [eax + 0106D3200h]
    fld fld dword ptr [esp + 8]
    fmul fmul st(1)
    fstp fstp dword ptr [eax + 0106D3204h]
    fmul fmul dword ptr [esp + 12]
    fstp fstp dword ptr [eax + 0106D3208h]
    mov mov dword ptr [eax + 0106D320Ch], edx
    mov mov edx, dword ptr [esp + 24]
    mov mov dword ptr [eax + 0106D3210h], edx
    mov mov edx, dword ptr [esp + 28]
    mov mov dword ptr [eax + 0106D3214h], edx
    mov mov ecx, dword ptr [ecx]
    mov mov edx, dword ptr [esp + 32]
    mov mov dword ptr [eax + 0106D3218h], ecx
    mov mov ecx, dword ptr [esp + 36]
    mov mov dword ptr [eax + 0106D321Ch], edx
    mov mov dword ptr [eax + 0106D3220h], ecx
    ret ret
    mov mov edx, dword ptr [esp + 4]
    shl shl eax, 6
    mov mov dword ptr [eax + 0106D3200h], edx
    mov mov edx, dword ptr [esp + 8]
    mov mov dword ptr [eax + 0106D3204h], edx
    mov mov edx, dword ptr [esp + 12]
    mov mov dword ptr [eax + 0106D3208h], edx
    mov mov edx, dword ptr [esp + 16]
    mov mov dword ptr [eax + 0106D320Ch], edx
    mov mov edx, dword ptr [esp + 20]
    mov mov dword ptr [eax + 0106D3210h], edx
    mov mov edx, dword ptr [esp + 24]
    mov mov dword ptr [eax + 0106D3214h], edx
    mov mov edx, dword ptr [esp + 28]
    mov mov dword ptr [eax + 0106D3218h], edx
    mov mov ecx, dword ptr [ecx]
    mov mov edx, dword ptr [esp + 32]
    mov mov dword ptr [eax + 0106D321Ch], ecx
    mov mov ecx, dword ptr [esp + 36]
    mov mov dword ptr [eax + 0106D3220h], edx
    mov mov dword ptr [eax + 0106D3224h], ecx
    xor xor ecx, ecx
    mov mov edx, 03F800000h
    mov mov dword ptr [eax + 0106D3234h], edx
    mov mov dword ptr [eax + 0106D3238h], ecx
    mov mov dword ptr [eax + 0106D323Ch], ecx
    mov mov dword ptr [eax + 0106D3228h], ecx
    mov mov dword ptr [eax + 0106D322Ch], edx
    mov mov dword ptr [eax + 0106D3230h], ecx
    ret ret
FUN_1002e740 ENDP
END
