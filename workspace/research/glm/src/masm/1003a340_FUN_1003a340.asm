.686
.MODEL FLAT, C
EXTRN sub_100366FA:PROC
EXTRN sub_10036752:PROC
EXTRN sub_1003A1FC:PROC
EXTRN sub_1003A21B:PROC
EXTRN g_101CE708:DWORD
EXTRN g_101D1B9C:DWORD
EXTRN g_1072D9C0:DWORD
EXTRN g_1072DA50:DWORD
EXTRN g_1072DA54:DWORD
EXTRN g_1072DA58:DWORD
EXTRN g_1072DA5C:DWORD
EXTRN g_1072DB20:DWORD
EXTRN g_1072DB24:DWORD
EXTRN g_1072DB28:DWORD
EXTRN g_1072DB2C:DWORD
EXTRN g_1072DB30:DWORD
EXTRN g_1072DB34:DWORD
EXTRN g_1072DB38:DWORD
EXTRN g_1072DB3C:DWORD
EXTRN g_1072DB40:DWORD
EXTRN g_1072DB44:DWORD
EXTRN g_1072DB48:DWORD
EXTRN g_1072DB4C:DWORD
EXTRN g_1072DB50:DWORD
EXTRN g_1072DB54:DWORD
EXTRN g_1072DB58:DWORD
EXTRN g_1072DB5C:DWORD
EXTRN g_1072DB60:DWORD
EXTRN g_1072DB64:DWORD
EXTRN g_1072DB68:DWORD
EXTRN g_1072DB6C:DWORD
EXTRN g_1072DB70:DWORD
EXTRN g_1072DB74:DWORD
EXTRN g_1072DB78:DWORD
EXTRN g_1072DB7C:DWORD
EXTRN g_1072DB80:DWORD
EXTRN g_1072DB84:DWORD
EXTRN g_1072DB88:DWORD
EXTRN g_1072DB8C:DWORD
EXTRN g_1072DB90:DWORD
EXTRN g_1072DB94:DWORD
EXTRN g_1072DB98:DWORD
EXTRN g_1072DB9C:DWORD
EXTRN g_1072DDB4:DWORD
EXTRN g_1072DE40:DWORD
EXTRN g_1072DE44:DWORD
EXTRN g_10730580:DWORD
EXTRN g_10730584:DWORD
EXTRN g_10730588:DWORD
EXTRN g_1073058C:DWORD
.CODE
FUN_1003a340 PROC
    mov eax, dword ptr [g_101CE708]
    cmp dword ptr [eax + 8], 2
    push esi
    jne L2
    mov eax, dword ptr [g_1072D9C0]
    cmp eax, 15
    je L5
    cmp eax, 16
    je L5
    cmp eax, 17
    je L5
    mov esi, dword ptr [g_1072DE44]
    test esi, esi
    je L1
    mov ecx, dword ptr [esi]
    cmp ecx, dword ptr [g_1072DDB4]
    je L0
    mov eax, dword ptr [g_1072DE40]
    call sub_100366FA
    mov esi, dword ptr [g_1072DE44]
L0:
    mov edx, dword ptr [esi + 4]
    push edx
    lea ecx, [esi + 8]
    call sub_1003A1FC
    add esp, 4
    pop esi
    ret
L1:
    mov eax, dword ptr [g_1072DE40]
    cmp dword ptr [eax], 2
    jne L5
    mov ecx, dword ptr [eax + 12]
    push ecx
    mov ecx, dword ptr [eax + 8]
    call sub_1003A21B
    add esp, 4
    pop esi
    ret
L2:
    mov esi, dword ptr [g_1072DE44]
    test esi, esi
    je L4
    mov edx, dword ptr [esi]
    cmp edx, dword ptr [g_1072DDB4]
    je L3
    mov eax, dword ptr [g_1072DE40]
    call sub_10036752
    mov esi, dword ptr [g_1072DE44]
L3:
    fld dword ptr [esi + 4]
    mov eax, dword ptr [g_10730580]
    mov ecx, dword ptr [g_10730584]
    fstp dword ptr [g_1072DA5C]
    mov edx, dword ptr [g_10730588]
    mov dword ptr [g_1072DA50], eax
    mov dword ptr [g_1072DA54], ecx
    mov dword ptr [g_1072DA58], edx
    mov eax, dword ptr [esi + 8]
    mov dword ptr [g_1072DB20], eax
    mov ecx, dword ptr [esi + 12]
    mov dword ptr [g_1072DB24], ecx
    mov edx, dword ptr [esi + 16]
    mov dword ptr [g_1072DB28], edx
    mov eax, dword ptr [esi + 20]
    mov dword ptr [g_1072DB2C], eax
    mov ecx, dword ptr [esi + 24]
    mov dword ptr [g_1072DB30], ecx
    mov edx, dword ptr [esi + 28]
    mov dword ptr [g_1072DB34], edx
    mov eax, dword ptr [esi + 32]
    mov dword ptr [g_1072DB38], eax
    mov ecx, dword ptr [esi + 36]
    mov dword ptr [g_1072DB3C], ecx
    mov edx, dword ptr [esi + 40]
    mov dword ptr [g_1072DB40], edx
    mov eax, dword ptr [esi + 44]
    mov dword ptr [g_1072DB44], eax
    mov ecx, dword ptr [esi + 48]
    mov dword ptr [g_1072DB48], ecx
    mov edx, dword ptr [esi + 52]
    mov dword ptr [g_1072DB4C], edx
    mov eax, dword ptr [esi + 56]
    mov dword ptr [g_1072DB50], eax
    mov ecx, dword ptr [esi + 60]
    mov dword ptr [g_1072DB54], ecx
    mov edx, dword ptr [esi + 64]
    mov dword ptr [g_1072DB58], edx
    mov eax, dword ptr [esi + 68]
    mov dword ptr [g_1072DB5C], eax
    mov ecx, dword ptr [esi + 72]
    mov dword ptr [g_1072DB60], ecx
    mov edx, dword ptr [esi + 76]
    mov dword ptr [g_1072DB64], edx
    mov eax, dword ptr [esi + 80]
    mov dword ptr [g_1072DB68], eax
    mov ecx, dword ptr [esi + 84]
    mov dword ptr [g_1072DB6C], ecx
    mov edx, dword ptr [esi + 88]
    mov dword ptr [g_1072DB70], edx
    mov eax, dword ptr [esi + 92]
    mov dword ptr [g_1072DB74], eax
    mov ecx, dword ptr [esi + 96]
    mov dword ptr [g_1072DB78], ecx
    mov edx, dword ptr [esi + 100]
    mov dword ptr [g_1072DB7C], edx
    pop esi
    ret
L4:
    mov eax, dword ptr [g_10730580]
    mov ecx, dword ptr [g_10730584]
    mov edx, dword ptr [g_10730588]
    mov dword ptr [g_1072DA50], eax
    mov eax, dword ptr [g_1073058C]
    mov dword ptr [g_1072DA5C], eax
    mov eax, dword ptr [g_1072DE40]
    mov dword ptr [g_1072DA54], ecx
    mov dword ptr [g_1072DA58], edx
    cmp dword ptr [eax], 2
    jne L5
    mov ecx, dword ptr [g_101D1B9C]
    mov edx, dword ptr [ecx + 000000110h]
    mov dword ptr [g_1072DB90], edx
    mov edx, dword ptr [ecx + 000000114h]
    mov dword ptr [g_1072DB94], edx
    mov ecx, dword ptr [ecx + 000000118h]
    mov dword ptr [g_1072DB98], ecx
    mov dword ptr [g_1072DB9C], 0
    mov edx, dword ptr [eax + 8]
    mov dword ptr [g_1072DB80], edx
    mov ecx, dword ptr [eax + 12]
    mov dword ptr [g_1072DB84], ecx
    mov edx, dword ptr [eax + 16]
    mov dword ptr [g_1072DB88], edx
    mov dword ptr [g_1072DB8C], 0
L5:
    pop esi
    ret
FUN_1003a340 ENDP
END
