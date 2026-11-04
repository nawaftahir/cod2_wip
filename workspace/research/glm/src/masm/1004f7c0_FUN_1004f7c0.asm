.686
.MODEL FLAT, C
.CODE
FUN_1004f7c0 PROC
    mov eax, dword ptr [esi + 4]
    push ebx
    push 0000000A8h
    xor ebx, ebx
    push ebx
    push esi
    call dword ptr [eax]
    mov dword ptr [esi + 00000019Ch], eax
    add esp, 12
    mov dword ptr [eax], 01004F790h
    mov dword ptr [eax + 4], 01004F280h
    mov dword ptr [eax + 8], 01004F600h
    mov dword ptr [eax + 24], 01004F040h
    mov dword ptr [eax + 92], ebx
    lea ecx, [eax + 96]
    mov edx, 16
    mov edi, edi
L0:
    mov dword ptr [ecx - 68], 01004F040h
    mov dword ptr [ecx], ebx
    add ecx, 4
    dec edx
    jne L0
    mov ecx, 01004EC80h
    mov dword ptr [eax + 28], ecx
    mov dword ptr [eax + 84], ecx
    mov eax, dword ptr [esi + 00000019Ch]
    mov dword ptr [esi + 0000000CCh], ebx
    mov dword ptr [esi + 000000084h], ebx
    mov dword ptr [esi + 000000184h], ebx
    mov byte ptr [eax + 12], bl
    mov byte ptr [eax + 13], bl
    mov dword ptr [eax + 20], ebx
    mov dword ptr [eax + 0000000A0h], ebx
    pop ebx
    ret
FUN_1004f7c0 ENDP
END
