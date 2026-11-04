.686
.MODEL FLAT, C
EXTRN sub_10049FF4:PROC
.CODE
FUN_1004a1d0 PROC
    push esi
    mov esi, eax
    mov eax, dword ptr [esi + 20]
    push edi
    add eax, 0FFFFFF38h
    xor edi, edi
    cmp eax, 10
    ja L0
    movzx eax, byte ptr [eax + 01004A27Ch]
    jmp dword ptr [eax*4 + 0x1004a268]
    mov ecx, dword ptr [esi + 000000198h]
    push esi
    call dword ptr [ecx + 4]
    mov edx, dword ptr [esi + 32]
    push esi
    call dword ptr [edx + 8]
    add esp, 8
    mov dword ptr [esi + 20], 0000000C9h
    mov eax, dword ptr [esi + 000000198h]
    push esi
    call dword ptr [eax]
    mov edi, eax
    add esp, 4
    cmp edi, 1
    jne L1
    call sub_10049FF4
    mov eax, edi
    pop edi
    mov dword ptr [esi + 20], 0000000CAh
    pop esi
    ret
    pop edi
    mov eax, 1
    pop esi
    ret
    mov ecx, dword ptr [esi + 000000198h]
    push esi
    call dword ptr [ecx]
    add esp, 4
    pop edi
    pop esi
    ret
L0:
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 20], 20
    mov eax, dword ptr [esi]
    mov ecx, dword ptr [esi + 20]
    mov dword ptr [eax + 24], ecx
    mov edx, dword ptr [esi]
    push esi
    call dword ptr [edx]
    add esp, 4
L1:
    mov eax, edi
    pop edi
    pop esi
    ret
FUN_1004a1d0 ENDP
END
