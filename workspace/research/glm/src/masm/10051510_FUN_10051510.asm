.686
.MODEL FLAT, C
.CODE
FUN_10051510 PROC
    push ebx
    push esi
    push edi
    mov edi, dword ptr [esp + 16]
    mov esi, dword ptr [edi + 000000194h]
    mov eax, dword ptr [esi + 24]
    test eax, eax
    lea ebx, [esi + 24]
    jne L0
    mov ecx, dword ptr [esi + 16]
    mov edx, dword ptr [esi + 20]
    mov eax, dword ptr [edi + 4]
    push 1
    push ecx
    mov ecx, dword ptr [esi + 8]
    push edx
    push ecx
    push edi
    call dword ptr [eax + 0x1c]
    add esp, 20
    mov dword ptr [esi + 12], eax
L0:
    mov eax, dword ptr [esi + 16]
    mov ecx, dword ptr [esi + 12]
    mov edx, dword ptr [edi + 0000001A8h]
    push ebp
    mov ebp, dword ptr [ebx]
    push eax
    mov eax, dword ptr [esp + 36]
    push ebx
    push ecx
    mov ecx, dword ptr [esp + 40]
    push eax
    mov eax, dword ptr [esp + 40]
    push ecx
    push eax
    push edi
    call dword ptr [edx + 4]
    mov eax, dword ptr [ebx]
    add esp, 28
    cmp eax, ebp
    jbe L1
    mov edx, dword ptr [esi + 12]
    mov ecx, dword ptr [edi + 0000001B0h]
    sub eax, ebp
    push eax
    mov dword ptr [esp + 24], eax
    push 0
    lea eax, [edx + ebp*4]
    push eax
    push edi
    call dword ptr [ecx + 4]
    mov eax, dword ptr [esp + 56]
    mov edx, dword ptr [eax]
    mov ecx, dword ptr [esp + 36]
    add esp, 16
    add edx, ecx
    mov dword ptr [eax], edx
L1:
    mov eax, dword ptr [esi + 16]
    cmp dword ptr [ebx], eax
    pop ebp
    jb L2
    add dword ptr [esi + 20], eax
    mov dword ptr [ebx], 0
L2:
    pop edi
    pop esi
    pop ebx
    ret
FUN_10051510 ENDP
END
