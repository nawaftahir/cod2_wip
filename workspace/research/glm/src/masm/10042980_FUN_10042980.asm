.686
.MODEL FLAT, C
.CODE
FUN_10042980 PROC
    sub esp, 24
    mov ecx, dword ptr [esp + 28]
    mov eax, dword ptr [ecx + 000000158h]
    mov edx, dword ptr [esp + 44]
    dec edx
    mov ecx, dword ptr [ecx + 36]
    mov eax, dword ptr [eax + 8]
    mov dword ptr [esp + 4], ecx
    js L4
    mov ecx, dword ptr [esp + 40]
    push ebx
    push ebp
    push esi
    mov esi, dword ptr [esp + 48]
    shl ecx, 2
    inc edx
    push edi
    mov dword ptr [esp + 16], edx
L0:
    mov edi, dword ptr [esp + 48]
    mov edx, dword ptr [edi]
    mov ebx, dword ptr [esi + 8]
    mov ebx, dword ptr [ecx + ebx]
    add edi, 4
    mov dword ptr [esp + 48], edi
    mov edi, dword ptr [esi]
    mov ebp, dword ptr [ecx + edi]
    mov edi, dword ptr [esi + 4]
    mov edi, dword ptr [ecx + edi]
    mov dword ptr [esp + 24], ebx
    mov ebx, dword ptr [esi + 12]
    mov ebx, dword ptr [ecx + ebx]
    mov dword ptr [esp + 60], ebx
    mov ebx, dword ptr [esp + 20]
    add ecx, 4
    test ebx, ebx
    mov dword ptr [esp + 44], edx
    mov dword ptr [esp + 36], ecx
    jbe L3
    mov ecx, dword ptr [esp + 60]
    sub ecx, ebp
    mov dword ptr [esp + 28], ecx
    mov ecx, dword ptr [esp + 24]
    sub edi, ebp
    sub ecx, ebp
    mov dword ptr [esp + 32], edi
    mov dword ptr [esp + 24], ecx
    mov dword ptr [esp + 60], ebx
    jmp L2
L1:
    mov edx, dword ptr [esp + 44]
    lea ecx, [ecx]
L2:
    movzx esi, byte ptr [edx]
    movzx edi, byte ptr [edx + 1]
    movzx ebx, byte ptr [edx + 2]
    mov dl, byte ptr [edx + 3]
    mov ecx, 0000000FFh
    sub ecx, esi
    mov esi, 0000000FFh
    sub esi, edi
    mov edi, 0000000FFh
    sub edi, ebx
    mov ebx, dword ptr [esp + 28]
    mov byte ptr [ebx + ebp], dl
    mov edx, dword ptr [esp + 44]
    mov ebx, dword ptr [eax + esi*4 + 000000400h]
    add edx, 4
    mov dword ptr [esp + 44], edx
    mov edx, dword ptr [eax + edi*4 + 000000800h]
    add edx, ebx
    add edx, dword ptr [eax + ecx*4]
    sar edx, 16
    mov byte ptr [ebp], dl
    mov edx, dword ptr [eax + edi*4 + 000001400h]
    add edx, dword ptr [eax + esi*4 + 000001000h]
    add edx, dword ptr [eax + ecx*4 + 000000C00h]
    mov ebx, dword ptr [esp + 32]
    sar edx, 16
    mov byte ptr [ebx + ebp], dl
    mov edx, dword ptr [eax + edi*4 + 000001C00h]
    mov edi, dword ptr [eax + ecx*4 + 000001400h]
    mov ebx, dword ptr [eax + esi*4 + 000001800h]
    mov ecx, dword ptr [esp + 24]
    add edx, ebx
    add edx, edi
    sar edx, 16
    mov byte ptr [ecx + ebp], dl
    mov ecx, dword ptr [esp + 60]
    inc ebp
    dec ecx
    mov dword ptr [esp + 60], ecx
    jne L1
    mov esi, dword ptr [esp + 52]
    mov ecx, dword ptr [esp + 36]
L3:
    dec dword ptr [esp + 16]
    jne L0
    pop edi
    pop esi
    pop ebp
    pop ebx
L4:
    add esp, 24
    ret
FUN_10042980 ENDP
END
