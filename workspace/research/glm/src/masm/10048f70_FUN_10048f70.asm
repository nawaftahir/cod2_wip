.686
.MODEL FLAT, C
EXTRN sub_10048D01:PROC
.CODE
FUN_10048f70 PROC
    sub esp, 8
    push ebx
    mov ebx, dword ptr [esp + 20]
    push ebp
    mov ebp, dword ptr [esp + 28]
    push edi
    mov edi, dword ptr [ebx + 28]
    shl edi, 3
    lea eax, [edi + edi]
    push eax
    mov eax, dword ptr [esp + 28]
    mov ecx, dword ptr [eax + 36]
    mov edx, dword ptr [eax + 0000000E4h]
    push ecx
    push edx
    push ebp
    mov dword ptr [esp + 28], edi
    call sub_10048D01
    mov eax, dword ptr [ebx + 12]
    add esp, 16
    test eax, eax
    mov dword ptr [esp + 24], 0
    jle L3
    mov edx, dword ptr [esp + 36]
    sub edx, ebp
    mov dword ptr [esp + 16], edx
    push esi
    mov edi, edi
L0:
    mov ecx, dword ptr [edx + ebp]
    mov eax, dword ptr [ebp]
    xor esi, esi
    test edi, edi
    jbe L2
    lea esp, [esp]
L1:
    movzx edx, byte ptr [eax + 1]
    movzx ebx, byte ptr [eax]
    add edx, esi
    add ebx, edx
    sar ebx, 1
    mov byte ptr [ecx], bl
    inc ecx
    xor esi, 1
    add eax, 2
    dec edi
    jne L1
    mov edi, dword ptr [esp + 16]
    mov ebx, dword ptr [esp + 32]
    mov edx, dword ptr [esp + 20]
L2:
    mov eax, dword ptr [esp + 28]
    mov ecx, dword ptr [ebx + 12]
    inc eax
    add ebp, 4
    cmp eax, ecx
    mov dword ptr [esp + 28], eax
    jl L0
    pop esi
L3:
    pop edi
    pop ebp
    pop ebx
    add esp, 8
    ret
FUN_10048f70 ENDP
END
