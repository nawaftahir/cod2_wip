.686
.MODEL FLAT, C
EXTRN sub_10056E7A:PROC
EXTRN sub_10057068:PROC
.CODE
FUN_10057160 PROC
    sub esp, 000000184h
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 000000198h]
    push esi
    push edi
    mov edi, dword ptr [esp + 00000019Ch]
    mov esi, eax
    mov eax, dword ptr [esp + 000000198h]
    mov ecx, dword ptr [eax + 0000001B0h]
    mov edx, dword ptr [ecx + 24]
    sar ebp, 2
    sar edi, 2
    sar esi, 3
    mov dword ptr [esp + 0000001A0h], ebp
    lea ecx, [esp + 000000094h]
    push ecx
    mov dword ptr [esp + 0000001A0h], edi
    mov ebx, esi
    shl ebp, 5
    shl edi, 5
    shl ebx, 5
    add ebp, 4
    add edi, 4
    add ebx, 2
    push ebp
    push edi
    mov ecx, ebx
    mov dword ptr [esp + 28], edx
    call sub_10056E7A
    lea edx, [esp + 32]
    push edx
    mov edx, dword ptr [esp + 0000001A8h]
    lea ecx, [esp + 0000000A4h]
    push ecx
    push eax
    push ebp
    push ebx
    push edi
    push edx
    call sub_10057068
    mov ecx, dword ptr [esp + 0000001C8h]
    mov edx, dword ptr [esp + 0000001C4h]
    shl esi, 3
    shl ecx, 2
    shl esi, 5
    add esi, ecx
    mov ecx, dword ptr [esp + 56]
    shl edx, 2
    add esp, 40
    lea eax, [esp + 20]
    shl esi, 1
    lea edi, [ecx + edx*4]
    mov dword ptr [esp + 16], 4
    lea esp, [esp]
L0:
    mov edx, esi
    mov ebx, 8
L1:
    movzx bp, byte ptr [eax]
    mov ecx, dword ptr [edi]
    add ecx, edx
    add edx, 64
    inc ebp
    inc eax
    mov word ptr [ecx], bp
    movzx bp, byte ptr [eax]
    inc ebp
    inc eax
    mov word ptr [ecx + 2], bp
    movzx bp, byte ptr [eax]
    inc ebp
    inc eax
    mov word ptr [ecx + 4], bp
    movzx bp, byte ptr [eax]
    inc ebp
    inc eax
    dec ebx
    mov word ptr [ecx + 6], bp
    jne L1
    mov ecx, dword ptr [esp + 16]
    add edi, 4
    dec ecx
    mov dword ptr [esp + 16], ecx
    jne L0
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 000000184h
    ret
FUN_10057160 ENDP
END
