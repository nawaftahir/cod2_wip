.686
.MODEL FLAT, C
EXTRN sub_10048B18:PROC
EXTRN sub_10048D16:PROC
.CODE
FUN_10048c10 PROC
    test al, al
    je L0
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], 4
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    add esp, 4
L0:
    mov edx, dword ptr [esi + 4]
    push 64
    push 1
    push esi
    call dword ptr [edx]
    mov dword ptr [esi + 00000014Ch], eax
    mov dword ptr [eax], 0100485A0h
    mov ecx, dword ptr [esi + 00000015Ch]
    mov dl, byte ptr [ecx + 8]
    add esp, 12
    test dl, dl
    je L1
    push esi
    mov dword ptr [eax + 4], 010048860h
    call sub_10048B18
    add esp, 4
    ret
L1:
    mov dword ptr [eax + 4], 010048630h
    mov edx, dword ptr [esi + 68]
    mov ecx, dword ptr [esi + 76]
    push ebp
    xor ebp, ebp
    test edx, edx
    jle sub_10048D16
    push ebx
    push edi
    lea edi, [ecx + 8]
    lea ebx, [eax + 8]
    jmp L2
    lea ebx, [ebx]
L2:
    mov eax, dword ptr [edi + 20]
    imul eax, dword ptr [esi + 0000000E0h]
    mov edx, dword ptr [esi + 0000000E4h]
    push edx
    shl eax, 3
    cdq
    idiv dword ptr [edi]
    mov ecx, dword ptr [esi + 4]
    push eax
    push 1
    push esi
    call dword ptr [ecx + 8]
    add esp, 16
    mov dword ptr [ebx], eax
    mov eax, dword ptr [esi + 68]
    inc ebp
    add ebx, 4
    add edi, 84
    cmp ebp, eax
FUN_10048c10 ENDP
END
