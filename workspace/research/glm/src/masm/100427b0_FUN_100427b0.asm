.686
.MODEL FLAT, C
.CODE
FUN_100427b0 PROC
    sub esp, 20
    mov ecx, dword ptr [esp + 24]
    mov eax, dword ptr [ecx + 000000158h]
    mov ecx, dword ptr [ecx + 36]
    mov eax, dword ptr [eax + 8]
    mov dword ptr [esp], ecx
    mov ecx, dword ptr [esp + 40]
    dec ecx
    js L3
    mov edx, dword ptr [esp + 36]
    push ebx
    push ebp
    push esi
    shl edx, 2
    inc ecx
    push edi
    mov edi, dword ptr [esp + 48]
    mov dword ptr [esp + 56], ecx
L0:
    mov ecx, dword ptr [esp + 44]
    mov esi, dword ptr [ecx]
    mov ebp, dword ptr [edi + 8]
    mov ebp, dword ptr [edx + ebp]
    add ecx, 4
    mov dword ptr [esp + 44], ecx
    mov ecx, dword ptr [edi]
    mov ebx, dword ptr [edx + ecx]
    mov ecx, dword ptr [edi + 4]
    mov ecx, dword ptr [edx + ecx]
    mov dword ptr [esp + 40], ebp
    mov ebp, dword ptr [esp + 16]
    add edx, 4
    test ebp, ebp
    mov dword ptr [esp + 32], edx
    jbe L2
    mov edx, dword ptr [esp + 40]
    sub ebx, ecx
    sub edx, ecx
    mov dword ptr [esp + 20], ebx
    mov dword ptr [esp + 28], edx
    mov dword ptr [esp + 40], ebp
    mov edi, edi
L1:
    movzx ebp, byte ptr [esi + 1]
    movzx edx, byte ptr [esi]
    movzx edi, byte ptr [esi + 2]
    mov ebx, dword ptr [eax + ebp*4 + 000000400h]
    mov dword ptr [esp + 24], edx
    mov edx, dword ptr [eax + edx*4 + 000000800h]
    add edx, ebx
    add edx, dword ptr [eax + edi*4]
    mov ebx, dword ptr [esp + 20]
    sar edx, 16
    mov byte ptr [ebx + ecx], dl
    mov edx, dword ptr [esp + 24]
    mov ebx, dword ptr [eax + edx*4 + 000001400h]
    add ebx, dword ptr [eax + ebp*4 + 000001000h]
    add esi, 3
    add ebx, dword ptr [eax + edi*4 + 000000C00h]
    sar ebx, 16
    mov byte ptr [ecx], bl
    mov edx, dword ptr [eax + edx*4 + 000001C00h]
    mov ebx, dword ptr [eax + ebp*4 + 000001800h]
    mov ebp, dword ptr [eax + edi*4 + 000001400h]
    mov edi, dword ptr [esp + 28]
    add edx, ebx
    add edx, ebp
    sar edx, 16
    mov byte ptr [edi + ecx], dl
    mov edx, dword ptr [esp + 40]
    inc ecx
    dec edx
    mov dword ptr [esp + 40], edx
    jne L1
    mov edi, dword ptr [esp + 48]
    mov edx, dword ptr [esp + 32]
L2:
    dec dword ptr [esp + 56]
    jne L0
    pop edi
    pop esi
    pop ebp
    pop ebx
L3:
    add esp, 20
    ret
FUN_100427b0 ENDP
END
