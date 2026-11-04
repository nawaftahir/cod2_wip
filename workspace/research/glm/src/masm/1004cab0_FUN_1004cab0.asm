.686
.MODEL FLAT, C
.CODE
FUN_1004cab0 PROC
    mov ecx, dword ptr [esi + 00000019Ch]
    push edi
    mov edi, dword ptr [esi + 0000001A0h]
    mov eax, dword ptr [edi + 16]
    cdq
    and edx, 7
    add eax, edx
    mov edx, dword ptr [ecx + 20]
    sar eax, 3
    add edx, eax
    mov dword ptr [ecx + 20], edx
    mov dword ptr [edi + 16], 0
    mov eax, dword ptr [esi + 00000019Ch]
    push esi
    call dword ptr [eax + 8]
    add esp, 4
    test al, al
    jne L0
    pop edi
    ret
L0:
    mov ecx, dword ptr [esi + 00000012Ch]
    xor eax, eax
    test ecx, ecx
    jle L2
    lea ecx, [edi + 20]
    lea ebx, [ebx]
L1:
    mov dword ptr [ecx], 0
    mov edx, dword ptr [esi + 00000012Ch]
    inc eax
    add ecx, 4
    cmp eax, edx
    jl L1
L2:
    mov ecx, dword ptr [esi + 000000104h]
    mov dword ptr [edi + 36], ecx
    mov eax, dword ptr [esi + 000000184h]
    test eax, eax
    jne L3
    mov byte ptr [edi + 8], 0
L3:
    mov al, 1
    pop edi
    ret
FUN_1004cab0 ENDP
END
