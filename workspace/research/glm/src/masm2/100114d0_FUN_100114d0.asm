.686
.MODEL FLAT, C
EXTRN sub_10011468:PROC
EXTRN sub_100115C7:PROC
EXTRN EXTRN g_101CE7DC:DWORD:DWORD
EXTRN EXTRN g_101D4814:DWORD:DWORD
EXTRN EXTRN g_101D4818:DWORD:DWORD
.CODE
FUN_100114d0 PROC
    push push edi
    mov mov edi, ebx
    call sub_10011468
    xor xor eax, eax
    mov mov ecx, 14
    mov mov edi, esi
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov eax, dword ptr [ebx + 20]
    mov mov dword ptr [esi], eax
    mov mov ecx, dword ptr [ebx + 24]
    mov mov dword ptr [esi + 4], ecx
    mov mov ecx, dword ptr [g_101CE7DC]
    mov mov dword ptr [esi + 8], 21
    mov mov edi, 1
    mov mov dword ptr [esi + 12], edi
    mov mov edx, dword ptr [g_101D4814]
    mov mov dword ptr [esi + 16], edx
    mov mov eax, dword ptr [g_101D4818]
    mov mov dword ptr [esi + 20], eax
    xor xor eax, eax
    mov mov dword ptr [esi + 24], edi
    mov mov dword ptr [esi + 36], eax
    mov mov dword ptr [esi + 40], 75
    mov mov dl, byte ptr [ecx + 8]
    neg neg dl
    sbb sbb edx, edx
    and and edx, 080000001h
    add add edx, 080000000h
    mov mov dword ptr [esi + 52], edx
    mov mov ecx, dword ptr [ebx]
    mov mov dword ptr [esi + 28], ecx
    mov mov dword ptr [esi + 44], eax
    cmp cmp byte ptr [ebx + 8], al
    je sub_100115C7
    mov mov dword ptr [esi + 32], eax
    mov mov edx, dword ptr [ebx + 4]
    mov mov dword ptr [esi + 48], edx
    pop pop edi
    ret ret
    mov mov dword ptr [esi + 32], edi
    mov mov dword ptr [esi + 48], eax
    pop pop edi
    ret ret
FUN_100114d0 ENDP
END
