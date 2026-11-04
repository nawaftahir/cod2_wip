.686
.MODEL FLAT, C
EXTRN sub_1005F390:PROC
EXTRN sub_1005F6D3:PROC
EXTRN sub_1005FBD8:PROC
EXTRN sub_1005FBED:PROC
EXTRN sub_1005FC02:PROC
EXTRN g_101AAC70:DWORD
EXTRN g_101AAC74:DWORD
EXTRN g_101AAC78:DWORD
.CODE
FUN_1001ab70 PROC
    mov eax, dword ptr [g_101AAC70]
    imul eax, eax, 00000045Ch
    add eax, 0101A66B0h
    mov cl, byte ptr [eax + 000000404h]
    test cl, cl
    je L0
    mov ecx, dword ptr [eax + 000000418h]
    mov byte ptr [eax + 000000404h], 0
    mov dword ptr [ebx], ecx
    mov edx, dword ptr [eax + 000000414h]
    mov dword ptr [eax + 000000400h], edx
L0:
    push ebp
    push esi
    push edi
    push ebx
    mov eax, 1
    call sub_1005F6D3
    add esp, 4
    mov ebp, eax
    xor edi, edi
    lea ebx, [ebx]
L1:
    mov ecx, dword ptr [edi*8 + 010190250h]
    mov esi, ebp
    lea esp, [esp]
L2:
    mov al, byte ptr [ecx]
    mov dl, al
    cmp al, byte ptr [esi]
    jne L4
    test dl, dl
    je L3
    mov al, byte ptr [ecx + 1]
    mov dl, al
    cmp al, byte ptr [esi + 1]
    jne L4
    add ecx, 2
    add esi, 2
    test dl, dl
    jne L2
L3:
    xor ecx, ecx
    jmp L5
L4:
    sbb ecx, ecx
    sbb ecx, -1
L5:
    test ecx, ecx
    je L7
    inc edi
    cmp edi, 5
    jne L1
    mov ecx, dword ptr [esp + 20]
    mov byte ptr [ecx], 1
    mov esi, dword ptr [g_101AAC70]
    imul esi, esi, 00000045Ch
    add esi, 0101A66B0h
    mov al, byte ptr [esi + 000000404h]
    test al, al
    je L6
    push 01019B90Ch
    call sub_1005F390
    add esp, 4
L6:
    mov byte ptr [esi + 000000404h], 1
    mov edx, dword ptr [g_101AAC78]
    pop edi
    pop esi
    mov dword ptr [g_101AAC74], edx
    pop ebp
    ret
L7:
    push 1
    push 010195544h
    mov ecx, ebx
    call sub_1005FBD8
    add esp, 8
    test eax, eax
    je L8
    push 1
    push 010195540h
    mov ecx, ebx
    call sub_1005FBED
    add esp, 8
    test eax, eax
    je L8
    push 1
    push 010195820h
    mov ecx, ebx
    call sub_1005FC02
    add esp, 8
    test eax, eax
    jne L9
L8:
    mov ecx, dword ptr [esp + 24]
    pop edi
    pop esi
    mov byte ptr [ecx], 1
    pop ebp
    ret
L9:
    mov edx, dword ptr [edi*8 + 010190254h]
    mov eax, dword ptr [esp + 16]
    pop edi
    pop esi
    mov byte ptr [eax + edx], 1
    pop ebp
    ret
FUN_1001ab70 ENDP
END
