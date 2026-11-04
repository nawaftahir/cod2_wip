.686
.MODEL FLAT, C
EXTRN sub_10059F7D:PROC
EXTRN sub_1005A5CB:PROC
EXTRN sub_1005A5E2:PROC
EXTRN g_1019BD8C:DWORD
.CODE
FUN_10059530 PROC
    sub esp, 0000000C0h
    mov eax, dword ptr [ecx + 8]
    push ebp
    mov ebp, dword ptr [esp + 0000000C8h]
    push esi
    mov esi, dword ptr [ecx]
    push edi
    mov edi, dword ptr [ecx + 4]
    mov dword ptr [esp + 20], eax
    lea eax, [esp + 24]
    mov dword ptr [esp + 12], esi
    mov dword ptr [esp + 16], edi
    call sub_10059F7D
    fld dword ptr [esp + 28]
    fmul dword ptr [esp + 20]
    mov ecx, dword ptr [esp + 24]
    fld dword ptr [esp + 32]
    mov eax, dword ptr [esp + 28]
    fmul dword ptr [esp + 16]
    mov edx, dword ptr [esp + 32]
    mov dword ptr [esp + 84], ecx
    mov dword ptr [esp + 96], eax
    fsubp st(1)
    mov dword ptr [esp + 108], edx
    mov dword ptr [esp + 92], esi
    mov dword ptr [esp + 104], edi
    fstp dword ptr [esp + 36]
    mov ecx, dword ptr [esp + 36]
    fld dword ptr [esp + 32]
    mov dword ptr [esp + 88], ecx
    fmul dword ptr [esp + 12]
    lea esi, [esp + 84]
    fld dword ptr [esp + 24]
    lea edi, [esp + 000000084h]
    fmul dword ptr [esp + 20]
    fsubp st(1)
    fstp dword ptr [esp + 40]
    mov ecx, dword ptr [esp + 40]
    fld dword ptr [esp + 24]
    mov dword ptr [esp + 100], ecx
    fmul dword ptr [esp + 16]
    fld dword ptr [esp + 28]
    fmul dword ptr [esp + 12]
    fsubp st(1)
    fstp dword ptr [esp + 44]
    mov ecx, dword ptr [esp + 44]
    fld dword ptr [esp + 0000000D4h]
    mov dword ptr [esp + 112], ecx
    mov ecx, dword ptr [esp + 20]
    fmul dword ptr [g_1019BD8C]
    mov dword ptr [esp + 116], ecx
    mov ecx, 9
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, dword ptr [esp + 12]
    mov dword ptr [esp + 000000088h], eax
    mov eax, dword ptr [esp + 44]
    mov dword ptr [esp + 000000098h], eax
    xor eax, eax
    mov dword ptr [esp + 48], eax
    mov dword ptr [esp + 52], eax
    mov dword ptr [esp + 56], eax
    mov dword ptr [esp + 60], eax
    mov dword ptr [esp + 64], eax
    mov dword ptr [esp + 68], eax
    mov dword ptr [esp + 00000008Ch], edx
    mov edx, dword ptr [esp + 36]
    mov dword ptr [esp + 72], eax
    mov dword ptr [esp + 76], eax
    mov dword ptr [esp + 000000090h], edx
    mov edx, dword ptr [esp + 16]
    mov dword ptr [esp + 80], eax
    mov eax, 03F800000h
    mov dword ptr [esp + 00000009Ch], ecx
    lea ecx, [esp + 48]
    mov dword ptr [esp + 0000000A0h], edx
    mov dword ptr [esp + 80], eax
    fstp dword ptr [esp + 124]
    mov dword ptr [esp + 64], eax
    mov dword ptr [esp + 48], eax
    mov dword ptr [esp + 120], ecx
    lea edx, [esp + 52]
    mov dword ptr [esp + 000000080h], edx
    push eax
    push ecx
    fld dword ptr [esp + 000000084h]
    fsincos
    mov ecx, dword ptr [esp + 000000080h]
    mov eax, dword ptr [esp + 000000088h]
    fstp dword ptr [ecx]
    fstp dword ptr [eax]
    pop ecx
    pop eax
    fld dword ptr [esp + 52]
    mov eax, dword ptr [esp + 48]
    fchs
    mov dword ptr [esp + 64], eax
    fstp dword ptr [esp + 60]
    lea edx, [esp + 0000000A8h]
    lea eax, [esp + 48]
    lea ecx, [esp + 84]
    call sub_1005A5CB
    lea edx, [esp + 84]
    lea eax, [esp + 000000084h]
    lea ecx, [esp + 0000000A8h]
    call sub_1005A5E2
    fld dword ptr [esp + 84]
    fmul dword ptr [ebx]
    pop edi
    fld dword ptr [esp + 88]
    pop esi
    fmul dword ptr [ebx + 8]
    faddp st(1)
    fld dword ptr [esp + 80]
    fmul dword ptr [ebx + 4]
    faddp st(1)
    fstp dword ptr [ebp]
    fld dword ptr [esp + 88]
    fmul dword ptr [ebx]
    fld dword ptr [esp + 96]
    fmul dword ptr [ebx + 8]
    faddp st(1)
    fld dword ptr [esp + 92]
    fmul dword ptr [ebx + 4]
    faddp st(1)
    fstp dword ptr [ebp + 4]
    fld dword ptr [esp + 100]
    fmul dword ptr [ebx]
    fld dword ptr [esp + 108]
    fmul dword ptr [ebx + 8]
    faddp st(1)
    fld dword ptr [esp + 104]
    fmul dword ptr [ebx + 4]
    faddp st(1)
    fstp dword ptr [ebp + 8]
    pop ebp
    add esp, 0000000C0h
    ret
FUN_10059530 ENDP
END
