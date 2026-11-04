.686
.MODEL FLAT, C
EXTRN sub_10006342:PROC
EXTRN sub_100243FD:PROC
EXTRN g_101CE800:DWORD
EXTRN g_101D1B9C:DWORD
EXTRN g_101D7E98:DWORD
EXTRN g_10678500:DWORD
.CODE
FUN_100080d0 PROC
    mov eax, dword ptr [g_101D7E98]
    mov ecx, dword ptr [eax + edi*4]
    cmp ecx, dword ptr [g_10678500]
    je L2
    mov edx, dword ptr [g_101D1B9C]
    mov eax, dword ptr [edx + 20]
    mov ecx, dword ptr [g_101CE800]
    mov dl, byte ptr [ecx + 8]
    push esi
    lea esi, [edi + edi*2]
    shl esi, 2
    test dl, dl
    mov eax, dword ptr [eax + esi + 8]
    je L0
    mov edx, dword ptr [esp + 12]
    mov ecx, dword ptr [esp + 8]
    push edx
    lea edx, [eax + 4]
    call sub_10006342
    add esp, 4
    test al, al
    jne L1
L0:
    mov eax, dword ptr [g_10678500]
    mov ecx, dword ptr [g_101D7E98]
    mov dword ptr [ecx + edi*4], eax
    mov edx, dword ptr [g_101D1B9C]
    mov eax, dword ptr [edx + 20]
    movzx ecx, word ptr [eax + esi + 6]
    mov edx, dword ptr [eax + esi + 8]
    add eax, esi
    movzx esi, word ptr [eax + 4]
    mov eax, dword ptr [eax]
    add ecx, 000000800h
    push edx
    call sub_100243FD
    add esp, 4
L1:
    pop esi
L2:
    ret
FUN_100080d0 ENDP
END
