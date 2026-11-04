.686
.MODEL FLAT, C
EXTRN EXTRN g_101CE708:DWORD:DWORD
.CODE
FUN_100340f0 PROC
    mov mov edx, dword ptr [g_101CE708]
    push push esi
    cmp cmp dword ptr [edx + 8], 2
    mov mov edx, dword ptr [ecx]
    jne L0
    lea lea eax, [eax + eax*8]
    shl shl eax, 2
    mov mov dword ptr [eax + 0106D3200h], edx
    mov mov edx, dword ptr [ecx + 4]
    mov mov dword ptr [eax + 0106D3204h], edx
    mov mov ecx, dword ptr [ecx + 8]
    mov mov edx, dword ptr [esp + 8]
    mov mov dword ptr [eax + 0106D3208h], ecx
    xor xor ecx, ecx
    mov mov dword ptr [eax + 0106D320Ch], ecx
    mov mov dword ptr [eax + 0106D3210h], ecx
    mov mov dword ptr [eax + 0106D3214h], 03F800000h
    mov mov dword ptr [eax + 0106D3218h], edx
    mov mov dword ptr [eax + 0106D321Ch], ecx
    mov mov dword ptr [eax + 0106D3220h], ecx
    pop pop esi
    ret ret
    mov mov esi, dword ptr [esp + 8]
    shl shl eax, 6
    mov mov dword ptr [eax + 0106D3200h], edx
    mov mov edx, dword ptr [ecx + 4]
    mov mov dword ptr [eax + 0106D3204h], edx
    mov mov ecx, dword ptr [ecx + 8]
    mov mov dword ptr [eax + 0106D3208h], ecx
    xor xor ecx, ecx
    mov mov edx, 03F800000h
    mov mov dword ptr [eax + 0106D320Ch], edx
    mov mov dword ptr [eax + 0106D3210h], ecx
    mov mov dword ptr [eax + 0106D3214h], ecx
    mov mov dword ptr [eax + 0106D3218h], edx
    mov mov dword ptr [eax + 0106D321Ch], esi
    mov mov dword ptr [eax + 0106D3228h], ecx
    mov mov dword ptr [eax + 0106D322Ch], edx
    mov mov dword ptr [eax + 0106D3230h], ecx
    mov mov dword ptr [eax + 0106D3234h], edx
    mov mov dword ptr [eax + 0106D3238h], ecx
    mov mov dword ptr [eax + 0106D323Ch], ecx
    mov mov dword ptr [eax + 0106D3220h], ecx
    mov mov dword ptr [eax + 0106D3224h], ecx
    pop pop esi
    ret ret
FUN_100340f0 ENDP
END
