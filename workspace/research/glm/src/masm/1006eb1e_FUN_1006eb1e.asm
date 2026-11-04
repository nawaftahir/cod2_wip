.686
.MODEL FLAT, C
EXTRN sub_1006DE24:PROC
EXTRN sub_100F7882:PROC
EXTRN sub_100F78C2:PROC
.CODE
FUN_1006eb1e PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    push esi
    mov esi, dword ptr [ebp + 16]
    mov eax, esi
    push edi
    shl eax, 2
    push eax
    mov edi, ecx
    call sub_100F7882
    mov ebx, eax
    test ebx, ebx
    pop ecx
    jne L0
    mov eax, 08007000Eh
    jmp L3
L0:
    push ebx
    push dword ptr [ebp + 8]
    mov ecx, edi
    call sub_1006DE24
    test esi, esi
    jbe L2
    mov edx, dword ptr [ebp + 12]
    mov ecx, ebx
    sub edx, ebx
    mov dword ptr [ebp + 16], esi
L1:
    mov esi, dword ptr [edi + 8]
    mov eax, dword ptr [edx + ecx]
    mov esi, dword ptr [esi + 20]
    mov eax, dword ptr [esi + eax*4]
    mov esi, dword ptr [ecx]
    or dword ptr [eax], esi
    add ecx, 4
    dec dword ptr [ebp + 16]
    jne L1
L2:
    push ebx
    call sub_100F78C2
    pop ecx
    xor eax, eax
L3:
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 12
FUN_1006eb1e ENDP
END
