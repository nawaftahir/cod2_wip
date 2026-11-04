.686
.MODEL FLAT, C
EXTRN sub_10006342:PROC
EXTRN sub_10008161:PROC
EXTRN sub_10008199:PROC
EXTRN sub_100243FD:PROC
EXTRN EXTRN g_101CE800:DWORD:DWORD
EXTRN EXTRN g_101D1B9C:DWORD:DWORD
EXTRN EXTRN g_101D7E98:DWORD:DWORD
EXTRN EXTRN g_10678500:DWORD:DWORD
.CODE
FUN_100080d0 PROC
    mov mov eax, dword ptr [g_101D7E98]
    mov mov ecx, dword ptr [eax + edi*4]
    cmp cmp ecx, dword ptr [g_10678500]
    je sub_10008161
    mov mov edx, dword ptr [g_101D1B9C]
    mov mov eax, dword ptr [edx + 20]
    mov mov ecx, dword ptr [g_101CE800]
    mov mov dl, byte ptr [ecx + 8]
    push push esi
    lea lea esi, [edi + edi*2]
    shl shl esi, 2
    test test dl, dl
    mov mov eax, dword ptr [eax + esi + 8]
    je L0
    mov mov edx, dword ptr [esp + 12]
    mov mov ecx, dword ptr [esp + 8]
    push push edx
    lea lea edx, [eax + 4]
    call sub_10006342
    add add esp, 4
    test test al, al
    jne sub_10008199
    mov mov eax, dword ptr [g_10678500]
    mov mov ecx, dword ptr [g_101D7E98]
    mov mov dword ptr [ecx + edi*4], eax
    mov mov edx, dword ptr [g_101D1B9C]
    mov mov eax, dword ptr [edx + 20]
    movzx movzx ecx, word ptr [eax + esi + 6]
    mov mov edx, dword ptr [eax + esi + 8]
    add add eax, esi
    movzx movzx esi, word ptr [eax + 4]
    mov mov eax, dword ptr [eax]
    add add ecx, 0800h
    push push edx
    call sub_100243FD
    add add esp, 4
    pop pop esi
    ret ret
FUN_100080d0 ENDP
END
