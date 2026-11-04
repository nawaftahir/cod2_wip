.686
.MODEL FLAT, C
EXTRN sub_1006DE24:PROC
EXTRN sub_1006EBA4:PROC
EXTRN sub_1006EBAA:PROC
EXTRN sub_1006EBB4:PROC
EXTRN sub_100F7882:PROC
EXTRN sub_100F78C2:PROC
.CODE
FUN_1006eb1e PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ebx
    push push esi
    mov mov esi, dword ptr [ebp + 16]
    mov mov eax, esi
    push push edi
    shl shl eax, 2
    push push eax
    mov mov edi, ecx
    call sub_100F7882
    mov mov ebx, eax
    test test ebx, ebx
    pop pop ecx
    jne L0
    mov mov eax, 08007000Eh
    jmp sub_1006EBA4
    push push ebx
    push push dword ptr [ebp + 8]
    mov mov ecx, edi
    call sub_1006DE24
    test test esi, esi
    jbe sub_1006EBAA
    mov mov edx, dword ptr [ebp + 12]
    mov mov ecx, ebx
    sub sub edx, ebx
    mov mov dword ptr [ebp + 16], esi
    mov mov esi, dword ptr [edi + 8]
    mov mov eax, dword ptr [edx + ecx]
L0:
    mov mov esi, dword ptr [esi + 20]
    mov mov eax, dword ptr [esi + eax*4]
    mov mov esi, dword ptr [ecx]
    or or dword ptr [eax], esi
    add add ecx, 4
    dec dec dword ptr [ebp + 16]
    jne sub_1006EBB4
    push push ebx
    call sub_100F78C2
    pop pop ecx
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    pop pop ebp
    ret ret 12
FUN_1006eb1e ENDP
END
