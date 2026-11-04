.686
.MODEL FLAT, C
EXTRN sub_10044219:PROC
EXTRN sub_10044340:PROC
.CODE
FUN_100443a0 PROC
    sub esp, 40
    push ebp
    push esi
    mov esi, dword ptr [esp + 52]
    mov eax, dword ptr [esi + 32]
    mov ecx, dword ptr [eax]
    mov edx, dword ptr [eax + 4]
    mov ebp, dword ptr [esi + 000000164h]
    push edi
    lea edi, [ebp + 12]
    mov dword ptr [esp + 16], ecx
    mov eax, edi
    mov ecx, dword ptr [eax]
    mov dword ptr [esp + 20], edx
    mov edx, dword ptr [eax + 4]
    mov dword ptr [esp + 24], ecx
    mov ecx, dword ptr [eax + 8]
    mov dword ptr [esp + 28], edx
    mov edx, dword ptr [eax + 12]
    mov dword ptr [esp + 32], ecx
    mov ecx, dword ptr [eax + 16]
    mov dword ptr [esp + 36], edx
    mov edx, dword ptr [eax + 20]
    mov eax, dword ptr [esi + 0000000C4h]
    test eax, eax
    mov dword ptr [esp + 40], ecx
    mov dword ptr [esp + 44], edx
    mov dword ptr [esp + 48], esi
    je L0
    mov eax, dword ptr [ebp + 36]
    test eax, eax
    jne L0
    mov eax, dword ptr [ebp + 40]
    push eax
    lea eax, [esp + 20]
    call sub_10044340
    add esp, 4
    test al, al
    jne L0
    pop edi
    pop esi
    pop ebp
    add esp, 40
    ret
L0:
    mov eax, dword ptr [esi + 000000108h]
    push ebx
    xor ebx, ebx
    test eax, eax
    jle L2
    lea ecx, [esi + 00000010Ch]
    mov dword ptr [esp + 60], ecx
    jmp L1
    lea esp, [esp]
    mov edi, edi
L1:
    mov edx, dword ptr [esp + 60]
    mov eax, dword ptr [edx]
    mov ecx, dword ptr [esi + eax*4 + 0000000F0h]
    mov edx, dword ptr [ecx + 24]
    mov edx, dword ptr [ebp + edx*4 + 60]
    mov ecx, dword ptr [ecx + 20]
    push edx
    mov edx, dword ptr [ebp + ecx*4 + 44]
    mov ecx, dword ptr [esp + 68]
    lea eax, [esp + eax*4 + 40]
    mov dword ptr [esp + 20], eax
    mov eax, dword ptr [eax]
    push edx
    mov edx, dword ptr [ecx + ebx*4]
    push eax
    push edx
    lea eax, [esp + 36]
    call sub_10044219
    add esp, 16
    test al, al
    je L5
    mov eax, dword ptr [esp + 64]
    mov ecx, dword ptr [eax + ebx*4]
    movsx edx, word ptr [ecx]
    mov eax, dword ptr [esp + 16]
    mov ecx, dword ptr [esp + 60]
    mov dword ptr [eax], edx
    mov eax, dword ptr [esi + 000000108h]
    inc ebx
    add ecx, 4
    cmp ebx, eax
    mov dword ptr [esp + 60], ecx
    jl L1
L2:
    mov ecx, dword ptr [esi + 32]
    mov edx, dword ptr [esp + 20]
    mov dword ptr [ecx], edx
    mov eax, dword ptr [esi + 32]
    mov ecx, dword ptr [esp + 24]
    mov edx, dword ptr [esp + 28]
    mov dword ptr [eax + 4], ecx
    mov eax, dword ptr [esp + 32]
    mov ecx, dword ptr [esp + 36]
    mov dword ptr [edi], edx
    mov edx, dword ptr [esp + 40]
    mov dword ptr [edi + 4], eax
    mov eax, dword ptr [esp + 44]
    mov dword ptr [edi + 8], ecx
    mov ecx, dword ptr [esp + 48]
    mov dword ptr [edi + 12], edx
    mov dword ptr [edi + 16], eax
    mov dword ptr [edi + 20], ecx
    mov esi, dword ptr [esi + 0000000C4h]
    test esi, esi
    je L4
    mov eax, dword ptr [ebp + 36]
    test eax, eax
    jne L3
    mov edx, dword ptr [ebp + 40]
    inc edx
    and edx, 7
    mov dword ptr [ebp + 36], esi
    mov dword ptr [ebp + 40], edx
L3:
    dec dword ptr [ebp + 36]
L4:
    pop ebx
    pop edi
    pop esi
    mov al, 1
    pop ebp
    add esp, 40
    ret
L5:
    pop ebx
FUN_100443a0 ENDP
END
