.686
.MODEL FLAT, C
EXTRN sub_10011468:PROC
EXTRN g_101CE7DC:DWORD
EXTRN g_101D4814:DWORD
EXTRN g_101D4818:DWORD
.CODE
FUN_100114d0 PROC
    push edi
    mov edi, ebx
    call sub_10011468
    xor eax, eax
    mov ecx, 14
    mov edi, esi
    rep stosd dword ptr es:[edi], eax
    mov eax, dword ptr [ebx + 20]
    mov dword ptr [esi], eax
    mov ecx, dword ptr [ebx + 24]
    mov dword ptr [esi + 4], ecx
    mov ecx, dword ptr [g_101CE7DC]
    mov dword ptr [esi + 8], 21
    mov edi, 1
    mov dword ptr [esi + 12], edi
    mov edx, dword ptr [g_101D4814]
    mov dword ptr [esi + 16], edx
    mov eax, dword ptr [g_101D4818]
    mov dword ptr [esi + 20], eax
    xor eax, eax
    mov dword ptr [esi + 24], edi
    mov dword ptr [esi + 36], eax
    mov dword ptr [esi + 40], 75
    mov dl, byte ptr [ecx + 8]
    neg dl
    sbb edx, edx
    and edx, 080000001h
    add edx, 080000000h
    mov dword ptr [esi + 52], edx
    mov ecx, dword ptr [ebx]
    mov dword ptr [esi + 28], ecx
    mov dword ptr [esi + 44], eax
    cmp byte ptr [ebx + 8], al
    je L0
    mov dword ptr [esi + 32], eax
    mov edx, dword ptr [ebx + 4]
    mov dword ptr [esi + 48], edx
    pop edi
    ret
L0:
    mov dword ptr [esi + 32], edi
    mov dword ptr [esi + 48], eax
    pop edi
    ret
FUN_100114d0 ENDP
END
