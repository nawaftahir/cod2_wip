.686
.MODEL FLAT, C
.CODE
FUN_100428d0 PROC
    sub esp, 8
    mov eax, dword ptr [esp + 12]
    mov ecx, dword ptr [eax + 000000158h]
    mov edx, dword ptr [eax + 36]
    mov eax, dword ptr [esp + 28]
    dec eax
    push esi
    mov esi, dword ptr [ecx + 8]
    mov dword ptr [esp + 4], edx
    js L3
    push ebx
    push ebp
    push edi
    mov edi, dword ptr [esp + 40]
    shl edi, 2
    inc eax
    mov dword ptr [esp + 28], eax
L0:
    mov ecx, dword ptr [esp + 32]
    mov eax, dword ptr [ecx]
    add ecx, 4
    mov dword ptr [esp + 32], ecx
    mov ecx, dword ptr [esp + 36]
    mov ecx, dword ptr [ecx]
    mov ecx, dword ptr [edi + ecx]
    mov dword ptr [esp + 44], ecx
    add edi, 4
    xor ecx, ecx
    test edx, edx
    mov dword ptr [esp + 20], edi
    jbe L2
    lea esp, [esp]
L1:
    movzx ebp, byte ptr [eax + 1]
    movzx edx, byte ptr [eax]
    movzx edi, byte ptr [eax + 2]
    mov edx, dword ptr [esi + edx*4 + 000000800h]
    mov ebx, dword ptr [esi + ebp*4 + 000000400h]
    mov ebp, dword ptr [esi + edi*4]
    mov edi, dword ptr [esp + 44]
    add edx, ebx
    add edx, ebp
    sar edx, 16
    add eax, 3
    mov byte ptr [ecx + edi], dl
    mov edx, dword ptr [esp + 16]
    inc ecx
    cmp ecx, edx
    jb L1
    mov edi, dword ptr [esp + 20]
L2:
    dec dword ptr [esp + 28]
    jne L0
    pop edi
    pop ebp
    pop ebx
L3:
    pop esi
    add esp, 8
    ret
FUN_100428d0 ENDP
END
