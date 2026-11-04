.686
.MODEL FLAT, C
EXTRN sub_1001ACD7:PROC
EXTRN sub_1001ACE9:PROC
EXTRN sub_1001AD78:PROC
EXTRN sub_1001AD8D:PROC
EXTRN sub_1001ADAD:PROC
EXTRN sub_1005F390:PROC
EXTRN sub_1005F6D3:PROC
EXTRN sub_1005FBD8:PROC
EXTRN sub_1005FBED:PROC
EXTRN sub_1005FC02:PROC
EXTRN EXTRN g_101AAC70:DWORD:DWORD
EXTRN EXTRN g_101AAC74:DWORD:DWORD
EXTRN EXTRN g_101AAC78:DWORD:DWORD
.CODE
FUN_1001ab70 PROC
    mov mov eax, dword ptr [g_101AAC70]
    imul imul eax, eax, 045Ch
    add add eax, 0101A66B0h
    mov mov cl, byte ptr [eax + 0404h]
    test test cl, cl
    je L0
    mov mov ecx, dword ptr [eax + 0418h]
    mov mov byte ptr [eax + 0404h], 0
    mov mov dword ptr [ebx], ecx
    mov mov edx, dword ptr [eax + 0414h]
    mov mov dword ptr [eax + 0400h], edx
    push push ebp
    push push esi
    push push edi
    push push ebx
    mov mov eax, 1
    call sub_1005F6D3
    add add esp, 4
    mov mov ebp, eax
    xor xor edi, edi
    lea lea ebx, [ebx]
    mov mov ecx, dword ptr [edi*8 + 010190250h]
    mov mov esi, ebp
    lea lea esp, [esp]
    mov mov al, byte ptr [ecx]
    mov mov dl, al
    cmp cmp al, byte ptr [esi]
    jne L3
    test test dl, dl
    je L3
    mov mov al, byte ptr [ecx + 1]
    mov mov dl, al
    cmp cmp al, byte ptr [esi + 1]
    jne L4
    add add ecx, 2
    add add esi, 2
    test test dl, dl
    jne L1
    xor xor ecx, ecx
    jmp L5
    sbb sbb ecx, ecx
    sbb sbb ecx, -1
    test test ecx, ecx
    je sub_1001ACD7
    inc inc edi
    cmp cmp edi, 5
    jne L2
    mov mov ecx, dword ptr [esp + 20]
    mov mov byte ptr [ecx], 1
    mov mov esi, dword ptr [g_101AAC70]
    imul imul esi, esi, 045Ch
    add add esi, 0101A66B0h
    mov mov al, byte ptr [esi + 0404h]
    test test al, al
    je sub_1001ACE9
    push push 01019B90Ch
    call sub_1005F390
    add add esp, 4
    mov mov byte ptr [esi + 0404h], 1
    mov mov edx, dword ptr [g_101AAC78]
    pop pop edi
    pop pop esi
    mov mov dword ptr [g_101AAC74], edx
    pop pop ebp
    ret ret
    push push 1
    push push 010195544h
    mov mov ecx, ebx
L2:
    call sub_1005FBD8
    add add esp, 8
    test test eax, eax
    je sub_1001AD78
    push push 1
    push push 010195540h
    mov mov ecx, ebx
    call sub_1005FBED
    add add esp, 8
    test test eax, eax
    je sub_1001AD8D
    push push 1
    push push 010195820h
    mov mov ecx, ebx
L5:
    call sub_1005FC02
    add add esp, 8
    test test eax, eax
    jne sub_1001ADAD
    mov mov ecx, dword ptr [esp + 24]
    pop pop edi
    pop pop esi
    mov mov byte ptr [ecx], 1
    pop pop ebp
    ret ret
    mov mov edx, dword ptr [edi*8 + 010190254h]
    mov mov eax, dword ptr [esp + 16]
    pop pop edi
    pop pop esi
    mov mov byte ptr [eax + edx], 1
    pop pop ebp
    ret ret
FUN_1001ab70 ENDP
END
