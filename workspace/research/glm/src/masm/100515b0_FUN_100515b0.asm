.686
.MODEL FLAT, C
.CODE
FUN_100515b0 PROC
    push ebx
    mov ebx, dword ptr [esp + 8]
    push ebp
    push esi
    mov esi, dword ptr [ebx + 000000194h]
    mov eax, dword ptr [esi + 24]
    test eax, eax
    push edi
    jne L0
    mov ecx, dword ptr [esi + 16]
    mov edx, dword ptr [esi + 20]
    mov eax, dword ptr [ebx + 4]
    push 0
    push ecx
    mov ecx, dword ptr [esi + 8]
    push edx
    push ecx
    push ebx
    call dword ptr [eax + 0x1c]
    add esp, 20
    mov dword ptr [esi + 12], eax
L0:
    mov ebp, dword ptr [esi + 24]
    mov edi, dword ptr [esi + 16]
    mov eax, dword ptr [esp + 44]
    sub edi, ebp
    mov ebp, dword ptr [esp + 40]
    mov ecx, dword ptr [ebp]
    sub eax, ecx
    cmp edi, eax
    jbe L1
    mov edi, eax
L1:
    mov eax, dword ptr [ebx + 104]
    sub eax, dword ptr [esi + 20]
    cmp edi, eax
    jbe L2
    mov edi, eax
L2:
    mov eax, dword ptr [esp + 36]
    mov edx, dword ptr [ebx + 0000001B0h]
    lea ecx, [eax + ecx*4]
    mov eax, dword ptr [esi + 24]
    push edi
    push ecx
    mov ecx, dword ptr [esi + 12]
    lea eax, [ecx + eax*4]
    push eax
    push ebx
    call dword ptr [edx + 4]
    add dword ptr [ebp], edi
    mov ebx, dword ptr [esi + 24]
    mov eax, dword ptr [esi + 16]
    add ebx, edi
    mov ecx, ebx
    add esp, 16
    cmp ecx, eax
    mov dword ptr [esi + 24], ebx
    jb L3
    add dword ptr [esi + 20], eax
    mov dword ptr [esi + 24], 0
L3:
    pop edi
    pop esi
    pop ebp
    pop ebx
    ret
FUN_100515b0 ENDP
END
