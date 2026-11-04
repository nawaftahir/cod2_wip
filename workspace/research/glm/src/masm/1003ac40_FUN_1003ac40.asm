.686
.MODEL FLAT, C
EXTRN g_1072D9B0:DWORD
EXTRN g_1072D9D0:DWORD
EXTRN g_1072D9D4:DWORD
.CODE
FUN_1003ac40 PROC
    mov eax, dword ptr [g_1072D9D4]
    mov edx, dword ptr [g_1072D9B0]
    push esi
    mov esi, dword ptr [g_1072D9D0]
    lea ecx, [eax + 3]
    mov word ptr [edx + esi*2], cx
    mov edx, dword ptr [g_1072D9D0]
    mov ecx, dword ptr [g_1072D9B0]
    mov word ptr [ecx + edx*2 + 2], ax
    mov esi, dword ptr [g_1072D9D0]
    mov edx, dword ptr [g_1072D9B0]
    lea ecx, [eax + 2]
    mov word ptr [edx + esi*2 + 4], cx
    mov esi, dword ptr [g_1072D9D0]
    mov edx, dword ptr [g_1072D9B0]
    mov word ptr [edx + esi*2 + 6], cx
    mov edx, dword ptr [g_1072D9D0]
    mov ecx, dword ptr [g_1072D9B0]
    mov word ptr [ecx + edx*2 + 8], ax
    mov edx, dword ptr [g_1072D9D0]
    mov esi, dword ptr [g_1072D9B0]
    lea ecx, [eax + 1]
    mov word ptr [esi + edx*2 + 10], cx
    mov edx, dword ptr [esp + 8]
    xor ecx, ecx
    mov esi, 03F800000h
    movzx eax, ax
    lea eax, [eax + eax*8]
    lea eax, [eax*4 + 0106D3200h]
    mov dword ptr [eax + 12], ecx
    mov dword ptr [eax + 16], ecx
    mov dword ptr [eax + 20], esi
    mov dword ptr [eax + 28], ecx
    mov dword ptr [eax + 32], ecx
    mov dword ptr [eax + 24], edx
    mov dword ptr [eax + 48], ecx
    mov dword ptr [eax + 52], ecx
    mov dword ptr [eax + 56], esi
    mov dword ptr [eax + 64], esi
    mov dword ptr [eax + 68], ecx
    mov dword ptr [eax + 60], edx
    mov dword ptr [eax + 84], ecx
    mov dword ptr [eax + 88], ecx
    mov dword ptr [eax + 92], esi
    mov dword ptr [eax + 100], esi
    mov dword ptr [eax + 104], esi
    mov dword ptr [eax + 96], edx
    mov dword ptr [eax + 120], ecx
    mov dword ptr [eax + 124], ecx
    mov dword ptr [eax + 000000080h], esi
    mov dword ptr [eax + 000000088h], ecx
    mov dword ptr [eax + 00000008Ch], esi
    mov dword ptr [eax + 000000084h], edx
    mov edx, dword ptr [g_1072D9D4]
    mov ecx, dword ptr [g_1072D9D0]
    add edx, 4
    add ecx, 6
    mov dword ptr [g_1072D9D4], edx
    mov dword ptr [g_1072D9D0], ecx
    pop esi
    ret
FUN_1003ac40 ENDP
END
