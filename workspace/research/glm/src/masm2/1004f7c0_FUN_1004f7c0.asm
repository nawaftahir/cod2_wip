.686
.MODEL FLAT, C
EXTRN sub_1004F84F:PROC
.CODE
FUN_1004f7c0 PROC
    mov mov eax, dword ptr [esi + 4]
    push push ebx
    push push 0A8h
    xor xor ebx, ebx
    push push ebx
    push push esi
    call call dword ptr [eax]
    mov mov dword ptr [esi + 019Ch], eax
    add add esp, 12
    mov mov dword ptr [eax], 01004F790h
    mov mov dword ptr [eax + 4], 01004F280h
    mov mov dword ptr [eax + 8], 01004F600h
    mov mov dword ptr [eax + 24], 01004F040h
    mov mov dword ptr [eax + 92], ebx
    lea lea ecx, [eax + 96]
    mov mov edx, 16
    mov mov edi, edi
    mov mov dword ptr [ecx - 68], 01004F040h
    mov mov dword ptr [ecx], ebx
    add add ecx, 4
    dec dec edx
    jne sub_1004F84F
    mov mov ecx, 01004EC80h
    mov mov dword ptr [eax + 28], ecx
    mov mov dword ptr [eax + 84], ecx
    mov mov eax, dword ptr [esi + 019Ch]
    mov mov dword ptr [esi + 0CCh], ebx
    mov mov dword ptr [esi + 084h], ebx
    mov mov dword ptr [esi + 0184h], ebx
    mov mov byte ptr [eax + 12], bl
    mov mov byte ptr [eax + 13], bl
    mov mov dword ptr [eax + 20], ebx
    mov mov dword ptr [eax + 0A0h], ebx
    pop pop ebx
    ret ret
FUN_1004f7c0 ENDP
END
