.686
.MODEL FLAT, C
EXTRN sub_1004D605:PROC
.CODE
FUN_1004db80 PROC
    push ebx
    push ebp
    push esi
    push 80
    mov esi, eax
    mov eax, dword ptr [esi + 4]
    push 1
    push esi
    call dword ptr [eax]
    mov ebx, eax
    mov al, byte ptr [esp + 28]
    add esp, 12
    test al, al
    mov dword ptr [esi + 00000018Ch], ebx
    mov dword ptr [ebx], 01004D920h
    je L0
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 20], 4
    mov edx, dword ptr [esi]
    push esi
    call dword ptr [edx]
    add esp, 4
L0:
    mov eax, dword ptr [esi + 0000001A8h]
    mov cl, byte ptr [eax + 8]
    test cl, cl
    je L2
    cmp dword ptr [esi + 000000120h], 2
    jge L1
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 20], 47
    mov edx, dword ptr [esi]
    push esi
    call dword ptr [edx]
    add esp, 4
L1:
    call sub_1004D605
    mov eax, dword ptr [esi + 000000120h]
    add eax, 2
    jmp L3
L2:
    mov eax, dword ptr [esi + 000000120h]
L3:
    mov ecx, dword ptr [esi + 44]
    xor ebp, ebp
    test ecx, ecx
    mov dword ptr [esp + 16], eax
    mov eax, dword ptr [esi + 0000000CCh]
    jle L5
    push edi
    lea edi, [eax + 36]
    add ebx, 8
L4:
    mov ecx, dword ptr [edi]
    mov eax, dword ptr [edi - 24]
    imul eax, ecx
    cdq
    idiv dword ptr [esi + 000000120h]
    mov edx, dword ptr [esi + 4]
    imul eax, dword ptr [esp + 20]
    push eax
    mov eax, dword ptr [edi - 8]
    imul eax, ecx
    push eax
    push 1
    push esi
    call dword ptr [edx + 8]
    add esp, 16
    mov dword ptr [ebx], eax
    mov eax, dword ptr [esi + 44]
    inc ebp
    add ebx, 4
    add edi, 84
    cmp ebp, eax
    jl L4
    pop edi
L5:
    pop esi
    pop ebp
    pop ebx
    ret
FUN_1004db80 ENDP
END
