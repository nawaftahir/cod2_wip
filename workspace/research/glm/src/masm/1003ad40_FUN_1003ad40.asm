.686
.MODEL FLAT, C
EXTRN g_1072D9B0:DWORD
EXTRN g_1072D9D0:DWORD
EXTRN g_1072D9D4:DWORD
.CODE
FUN_1003ad40 PROC
    mov eax, dword ptr [g_1072D9D4]
    mov edx, dword ptr [g_1072D9B0]
    push esi
    mov esi, dword ptr [g_1072D9D0]
    lea ecx, [eax + 3]
    mov word ptr [edx + esi*2], cx
    mov ecx, dword ptr [g_1072D9B0]
    mov edx, dword ptr [g_1072D9D0]
    mov word ptr [ecx + edx*2 + 2], ax
    mov edx, dword ptr [g_1072D9B0]
    mov esi, dword ptr [g_1072D9D0]
    lea ecx, [eax + 2]
    mov word ptr [edx + esi*2 + 4], cx
    mov edx, dword ptr [g_1072D9B0]
    mov esi, dword ptr [g_1072D9D0]
    mov word ptr [edx + esi*2 + 6], cx
    mov ecx, dword ptr [g_1072D9B0]
    mov edx, dword ptr [g_1072D9D0]
    mov word ptr [ecx + edx*2 + 8], ax
    mov edx, dword ptr [g_1072D9D0]
    mov esi, dword ptr [g_1072D9B0]
    lea ecx, [eax + 1]
    mov word ptr [esi + edx*2 + 10], cx
    mov esi, dword ptr [esp + 8]
    xor ecx, ecx
    mov edx, 03F800000h
    movzx eax, ax
    shl eax, 6
    add eax, 0106D3200h
    mov dword ptr [eax + 24], edx
    mov dword ptr [eax + 16], ecx
    mov dword ptr [eax + 20], ecx
    mov dword ptr [eax + 32], ecx
    mov dword ptr [eax + 36], ecx
    mov dword ptr [eax + 28], esi
    mov dword ptr [eax + 52], edx
    mov dword ptr [eax + 56], ecx
    mov dword ptr [eax + 60], ecx
    mov dword ptr [eax + 44], edx
    mov dword ptr [eax + 40], ecx
    mov dword ptr [eax + 48], ecx
    mov dword ptr [eax + 88], edx
    mov dword ptr [eax + 80], ecx
    mov dword ptr [eax + 84], ecx
    mov dword ptr [eax + 96], edx
    mov dword ptr [eax + 100], ecx
    mov dword ptr [eax + 92], esi
    mov dword ptr [eax + 116], edx
    mov dword ptr [eax + 120], ecx
    mov dword ptr [eax + 124], ecx
    mov dword ptr [eax + 108], edx
    mov dword ptr [eax + 104], ecx
    mov dword ptr [eax + 112], ecx
    mov dword ptr [eax + 000000098h], edx
    mov dword ptr [eax + 000000090h], ecx
    mov dword ptr [eax + 000000094h], ecx
    mov dword ptr [eax + 0000000A0h], edx
    mov dword ptr [eax + 0000000A4h], edx
    mov dword ptr [eax + 00000009Ch], esi
    mov dword ptr [eax + 0000000B4h], edx
    mov dword ptr [eax + 0000000B8h], ecx
    mov dword ptr [eax + 0000000BCh], ecx
    mov dword ptr [eax + 0000000ACh], edx
    mov dword ptr [eax + 0000000A8h], ecx
    mov dword ptr [eax + 0000000B0h], ecx
    mov dword ptr [eax + 0000000D8h], edx
    mov dword ptr [eax + 0000000D0h], ecx
    mov dword ptr [eax + 0000000D4h], ecx
    mov dword ptr [eax + 0000000E4h], edx
    mov dword ptr [eax + 0000000E0h], ecx
    mov dword ptr [eax + 0000000DCh], esi
    mov dword ptr [eax + 0000000F4h], edx
    mov dword ptr [eax + 0000000F8h], ecx
    mov dword ptr [eax + 0000000FCh], ecx
    mov dword ptr [eax + 0000000ECh], edx
    mov dword ptr [eax + 0000000E8h], ecx
    mov dword ptr [eax + 0000000F0h], ecx
    mov edx, dword ptr [g_1072D9D4]
    mov ecx, dword ptr [g_1072D9D0]
    add edx, 4
    mov dword ptr [g_1072D9D4], edx
    add ecx, 6
    mov dword ptr [g_1072D9D0], ecx
    pop esi
    ret
FUN_1003ad40 ENDP
END
