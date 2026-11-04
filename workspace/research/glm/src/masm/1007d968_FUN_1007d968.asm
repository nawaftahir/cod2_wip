.686
.MODEL FLAT, C
.CODE
FUN_1007d968 PROC
L0:
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 24]
    push edi
    mov edi, dword ptr [ebp + 8]
    and dword ptr [ebp + 8], 0
    mov dword ptr [esi + 32], edi
    cmp word ptr [eax + 10], 0
    jbe L2
    mov ecx, dword ptr [esi + 56]
    push ebx
L1:
    mov ebx, dword ptr [ebp + 8]
    shl ebx, 2
    mov ecx, dword ptr [ecx + ebx]
    push edi
    call L0
    mov ecx, dword ptr [esi + 56]
    mov eax, dword ptr [ecx + ebx]
    mov dx, word ptr [eax + 8]
    mov ebx, dword ptr [eax + 24]
    movzx ebx, word ptr [ebx + 8]
    neg dx
    sbb edx, edx
    and edx, 3
    inc edx
    imul edx, ebx
    imul edx, dword ptr [eax + 44]
    mov eax, dword ptr [esi + 24]
    movzx eax, word ptr [eax + 10]
    inc dword ptr [ebp + 8]
    cmp dword ptr [ebp + 8], eax
    lea edi, [edi + edx*4]
    jb L1
    pop ebx
L2:
    pop edi
    xor eax, eax
    pop esi
    pop ebp
    ret 4
FUN_1007d968 ENDP
END
