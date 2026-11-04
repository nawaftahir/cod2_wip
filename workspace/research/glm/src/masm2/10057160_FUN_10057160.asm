.686
.MODEL FLAT, C
EXTRN sub_10056E7A:PROC
EXTRN sub_10057068:PROC
EXTRN sub_1005731F:PROC
EXTRN sub_10057326:PROC
.CODE
FUN_10057160 PROC
    sub sub esp, 0184h
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 0198h]
    push push esi
    push push edi
    mov mov edi, dword ptr [esp + 019Ch]
    mov mov esi, eax
    mov mov eax, dword ptr [esp + 0198h]
    mov mov ecx, dword ptr [eax + 01B0h]
    mov mov edx, dword ptr [ecx + 24]
    sar sar ebp, 2
    sar sar edi, 2
    sar sar esi, 3
    mov mov dword ptr [esp + 01A0h], ebp
    lea lea ecx, [esp + 094h]
    push push ecx
    mov mov dword ptr [esp + 01A0h], edi
    mov mov ebx, esi
    shl shl ebp, 5
    shl shl edi, 5
    shl shl ebx, 5
    add add ebp, 4
    add add edi, 4
    add add ebx, 2
    push push ebp
    push push edi
    mov mov ecx, ebx
    mov mov dword ptr [esp + 28], edx
    call sub_10056E7A
    lea lea edx, [esp + 32]
    push push edx
    mov mov edx, dword ptr [esp + 01A8h]
    lea lea ecx, [esp + 0A4h]
    push push ecx
    push push eax
    push push ebp
    push push ebx
    push push edi
    push push edx
    call sub_10057068
    mov mov ecx, dword ptr [esp + 01C8h]
    mov mov edx, dword ptr [esp + 01C4h]
    shl shl esi, 3
    shl shl ecx, 2
    shl shl esi, 5
    add add esi, ecx
    mov mov ecx, dword ptr [esp + 56]
    shl shl edx, 2
    add add esp, 40
    lea lea eax, [esp + 20]
    shl shl esi, 1
    lea lea edi, [ecx + edx*4]
    mov mov dword ptr [esp + 16], 4
    lea lea esp, [esp]
    mov mov edx, esi
    mov mov ebx, 8
    movzx movzx bp, byte ptr [eax]
    mov mov ecx, dword ptr [edi]
    add add ecx, edx
    add add edx, 64
    inc inc ebp
    inc inc eax
    mov mov word ptr [ecx], bp
    movzx movzx bp, byte ptr [eax]
    inc inc ebp
    inc inc eax
    mov mov word ptr [ecx + 2], bp
    movzx movzx bp, byte ptr [eax]
    inc inc ebp
    inc inc eax
    mov mov word ptr [ecx + 4], bp
    movzx movzx bp, byte ptr [eax]
    inc inc ebp
    inc inc eax
    dec dec ebx
    mov mov word ptr [ecx + 6], bp
    jne sub_1005731F
    mov mov ecx, dword ptr [esp + 16]
    add add edi, 4
    dec dec ecx
    mov mov dword ptr [esp + 16], ecx
    jne sub_10057326
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 0184h
    ret ret
FUN_10057160 ENDP
END
