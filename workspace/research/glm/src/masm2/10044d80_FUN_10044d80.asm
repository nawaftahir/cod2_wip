.686
.MODEL FLAT, C
EXTRN sub_10044E20:PROC
EXTRN sub_10044E45:PROC
EXTRN sub_10044E4B:PROC
.CODE
FUN_10044d80 PROC
    mov mov eax, dword ptr [esi + 4]
    push push 64
    push push 1
    push push esi
    call call dword ptr [eax]
    mov mov dword ptr [esi + 0148h], eax
    mov mov dword ptr [eax], 010044C80h
    mov mov cl, byte ptr [esi + 0B8h]
    add add esp, 12
    test test cl, cl
    jne sub_10044E20
    mov mov cl, byte ptr [esp + 4]
    test test cl, cl
    je L0
    mov mov ecx, dword ptr [esi]
    mov mov dword ptr [ecx + 20], 4
    mov mov edx, dword ptr [esi]
    mov mov dword ptr [esp + 4], esi
    jmp jmp dword ptr [edx]
    mov mov edx, dword ptr [esi + 68]
    mov mov ecx, dword ptr [esi + 76]
    push push ebp
    xor xor ebp, ebp
    test test edx, edx
    jle sub_10044E45
    push push ebx
    push push edi
    lea lea edi, [ecx + 28]
    lea lea ebx, [eax + 24]
    mov mov ecx, dword ptr [edi - 16]
    mov mov edx, dword ptr [edi]
    mov mov eax, dword ptr [esi + 4]
    shl shl ecx, 3
    push push ecx
    shl shl edx, 3
    push push edx
    push push 1
    push push esi
    call call dword ptr [eax + 8]
L0:
    add add esp, 16
    mov mov dword ptr [ebx], eax
    mov mov eax, dword ptr [esi + 68]
    inc inc ebp
    add add ebx, 4
    add add edi, 84
    cmp cmp ebp, eax
    jl sub_10044E4B
    pop pop edi
    pop pop ebx
    pop pop ebp
    ret ret
FUN_10044d80 ENDP
END
