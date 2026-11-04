.686
.MODEL FLAT, C
.CODE
FUN_100140e0 PROC
    sub esp, 16
    push ebx
    push ebp
    push edi
    push esi
    mov ebx, eax
    call dword ptr [esp + 0x24]
    add esp, 8
    test al, al
    je L0
    mov ecx, esi
    mov eax, dword ptr [ecx]
    mov edx, dword ptr [ecx + 4]
    mov dword ptr [esp + 12], edx
    mov edx, dword ptr [ecx + 8]
    mov ecx, dword ptr [ecx + 12]
    mov dword ptr [esp + 16], edx
    mov dword ptr [esp + 20], ecx
    mov edx, edi
    mov ebp, dword ptr [edx]
    mov ecx, esi
    mov dword ptr [ecx], ebp
    mov ebp, dword ptr [edx + 4]
    mov dword ptr [ecx + 4], ebp
    mov ebp, dword ptr [edx + 8]
    mov dword ptr [ecx + 8], ebp
    mov edx, dword ptr [edx + 12]
    mov dword ptr [ecx + 12], edx
    mov edx, dword ptr [esp + 12]
    mov ecx, edi
    mov dword ptr [ecx], eax
    mov eax, dword ptr [esp + 16]
    mov dword ptr [ecx + 4], edx
    mov edx, dword ptr [esp + 20]
    mov dword ptr [ecx + 8], eax
    mov dword ptr [ecx + 12], edx
L0:
    push esi
    push ebx
    call dword ptr [esp + 0x24]
    add esp, 8
    test al, al
    je L1
    mov edx, ebx
    mov eax, dword ptr [edx]
    mov ecx, dword ptr [edx + 4]
    mov ebp, dword ptr [edx + 8]
    mov edx, dword ptr [edx + 12]
    mov dword ptr [esp + 20], edx
    mov dword ptr [esp + 16], ebp
    mov edx, esi
    mov ebp, dword ptr [edx]
    mov dword ptr [ebx], ebp
    mov ebp, dword ptr [edx + 4]
    mov dword ptr [ebx + 4], ebp
    mov ebp, dword ptr [edx + 8]
    mov dword ptr [ebx + 8], ebp
    mov edx, dword ptr [edx + 12]
    mov dword ptr [ebx + 12], edx
    mov edx, esi
    mov dword ptr [edx], eax
    mov eax, dword ptr [esp + 16]
    mov dword ptr [edx + 4], ecx
    mov ecx, dword ptr [esp + 20]
    mov dword ptr [edx + 8], eax
    mov dword ptr [edx + 12], ecx
L1:
    push edi
    push esi
    call dword ptr [esp + 0x24]
    add esp, 8
    test al, al
    je L2
    mov ebx, esi
    mov eax, dword ptr [ebx]
    mov ecx, dword ptr [ebx + 4]
    mov edx, dword ptr [ebx + 8]
    mov ebx, dword ptr [ebx + 12]
    mov dword ptr [esp + 20], ebx
    mov ebx, edi
    mov ebp, dword ptr [ebx]
    mov dword ptr [esi], ebp
    mov ebp, dword ptr [ebx + 4]
    mov dword ptr [esi + 4], ebp
    mov ebp, dword ptr [ebx + 8]
    mov dword ptr [esi + 8], ebp
    mov ebx, dword ptr [ebx + 12]
    mov dword ptr [esi + 12], ebx
    mov dword ptr [edi], eax
    mov dword ptr [edi + 4], ecx
    mov dword ptr [edi + 8], edx
    mov edx, dword ptr [esp + 20]
    mov dword ptr [edi + 12], edx
L2:
    pop ebp
    pop ebx
    add esp, 16
    ret
FUN_100140e0 ENDP
END
