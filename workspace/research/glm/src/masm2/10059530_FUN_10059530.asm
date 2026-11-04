.686
.MODEL FLAT, C
EXTRN sub_10059F7D:PROC
EXTRN sub_1005A5CB:PROC
EXTRN sub_1005A5E2:PROC
EXTRN EXTRN g_1019BD8C:DWORD:DWORD
.CODE
FUN_10059530 PROC
    sub sub esp, 0C0h
    mov mov eax, dword ptr [ecx + 8]
    push push ebp
    mov mov ebp, dword ptr [esp + 0C8h]
    push push esi
    mov mov esi, dword ptr [ecx]
    push push edi
    mov mov edi, dword ptr [ecx + 4]
    mov mov dword ptr [esp + 20], eax
    lea lea eax, [esp + 24]
    mov mov dword ptr [esp + 12], esi
    mov mov dword ptr [esp + 16], edi
    call sub_10059F7D
    fld fld dword ptr [esp + 28]
    fmul fmul dword ptr [esp + 20]
    mov mov ecx, dword ptr [esp + 24]
    fld fld dword ptr [esp + 32]
    mov mov eax, dword ptr [esp + 28]
    fmul fmul dword ptr [esp + 16]
    mov mov edx, dword ptr [esp + 32]
    mov mov dword ptr [esp + 84], ecx
    mov mov dword ptr [esp + 96], eax
    fsubp fsubp st(1)
    mov mov dword ptr [esp + 108], edx
    mov mov dword ptr [esp + 92], esi
    mov mov dword ptr [esp + 104], edi
    fstp fstp dword ptr [esp + 36]
    mov mov ecx, dword ptr [esp + 36]
    fld fld dword ptr [esp + 32]
    mov mov dword ptr [esp + 88], ecx
    fmul fmul dword ptr [esp + 12]
    lea lea esi, [esp + 84]
    fld fld dword ptr [esp + 24]
    lea lea edi, [esp + 084h]
    fmul fmul dword ptr [esp + 20]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esp + 40]
    mov mov ecx, dword ptr [esp + 40]
    fld fld dword ptr [esp + 24]
    mov mov dword ptr [esp + 100], ecx
    fmul fmul dword ptr [esp + 16]
    fld fld dword ptr [esp + 28]
    fmul fmul dword ptr [esp + 12]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esp + 44]
    mov mov ecx, dword ptr [esp + 44]
    fld fld dword ptr [esp + 0D4h]
    mov mov dword ptr [esp + 112], ecx
    mov mov ecx, dword ptr [esp + 20]
    fmul fmul dword ptr [g_1019BD8C]
    mov mov dword ptr [esp + 116], ecx
    mov mov ecx, 9
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, dword ptr [esp + 12]
    mov mov dword ptr [esp + 088h], eax
    mov mov eax, dword ptr [esp + 44]
    mov mov dword ptr [esp + 098h], eax
    xor xor eax, eax
    mov mov dword ptr [esp + 48], eax
    mov mov dword ptr [esp + 52], eax
    mov mov dword ptr [esp + 56], eax
    mov mov dword ptr [esp + 60], eax
    mov mov dword ptr [esp + 64], eax
    mov mov dword ptr [esp + 68], eax
    mov mov dword ptr [esp + 08Ch], edx
    mov mov edx, dword ptr [esp + 36]
    mov mov dword ptr [esp + 72], eax
    mov mov dword ptr [esp + 76], eax
    mov mov dword ptr [esp + 090h], edx
    mov mov edx, dword ptr [esp + 16]
    mov mov dword ptr [esp + 80], eax
    mov mov eax, 03F800000h
    mov mov dword ptr [esp + 09Ch], ecx
    lea lea ecx, [esp + 48]
    mov mov dword ptr [esp + 0A0h], edx
    mov mov dword ptr [esp + 80], eax
    fstp fstp dword ptr [esp + 124]
    mov mov dword ptr [esp + 64], eax
    mov mov dword ptr [esp + 48], eax
    mov mov dword ptr [esp + 120], ecx
    lea lea edx, [esp + 52]
    mov mov dword ptr [esp + 080h], edx
    push push eax
    push push ecx
    fld fld dword ptr [esp + 084h]
    fsincos fsincos
    mov mov ecx, dword ptr [esp + 080h]
    mov mov eax, dword ptr [esp + 088h]
    fstp fstp dword ptr [ecx]
    fstp fstp dword ptr [eax]
    pop pop ecx
    pop pop eax
    fld fld dword ptr [esp + 52]
    mov mov eax, dword ptr [esp + 48]
    fchs fchs
    mov mov dword ptr [esp + 64], eax
    fstp fstp dword ptr [esp + 60]
    lea lea edx, [esp + 0A8h]
    lea lea eax, [esp + 48]
    lea lea ecx, [esp + 84]
    call sub_1005A5CB
    lea lea edx, [esp + 84]
    lea lea eax, [esp + 084h]
    lea lea ecx, [esp + 0A8h]
    call sub_1005A5E2
    fld fld dword ptr [esp + 84]
    fmul fmul dword ptr [ebx]
    pop pop edi
    fld fld dword ptr [esp + 88]
    pop pop esi
    fmul fmul dword ptr [ebx + 8]
    faddp faddp st(1)
    fld fld dword ptr [esp + 80]
    fmul fmul dword ptr [ebx + 4]
    faddp faddp st(1)
    fstp fstp dword ptr [ebp]
    fld fld dword ptr [esp + 88]
    fmul fmul dword ptr [ebx]
    fld fld dword ptr [esp + 96]
    fmul fmul dword ptr [ebx + 8]
    faddp faddp st(1)
    fld fld dword ptr [esp + 92]
    fmul fmul dword ptr [ebx + 4]
    faddp faddp st(1)
    fstp fstp dword ptr [ebp + 4]
    fld fld dword ptr [esp + 100]
    fmul fmul dword ptr [ebx]
    fld fld dword ptr [esp + 108]
    fmul fmul dword ptr [ebx + 8]
    faddp faddp st(1)
    fld fld dword ptr [esp + 104]
    fmul fmul dword ptr [ebx + 4]
    faddp faddp st(1)
    fstp fstp dword ptr [ebp + 8]
    pop pop ebp
    add add esp, 0C0h
    ret ret
FUN_10059530 ENDP
END
