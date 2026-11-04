.686
.MODEL FLAT, C
.CODE
FUN_100c1df2 PROC
L0:
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 16
    push esi
    push edi
    mov edi, dword ptr [ebp + 16]
    cmp edi, 30
    mov esi, ecx
    jbe L1
    mov eax, 080004005h
    jmp L21
L1:
    mov eax, dword ptr [esi + 0000000FCh]
    cmp eax, dword ptr [esi + 12]
    push ebx
    jae L19
    mov ebx, dword ptr [ebp + 12]
L2:
    mov eax, dword ptr [esi + 0000000FCh]
    mov ecx, dword ptr [esi + 24]
    mov ecx, dword ptr [ecx + eax*4]
    mov eax, dword ptr [ecx]
    and eax, 0FFF00000h
    cmp eax, 073400000h
    mov dword ptr [ebp + 16], ecx
    je L19
    cmp dword ptr [ebp + 20], 0
    je L3
    cmp eax, 073100000h
    je L19
    cmp eax, 073300000h
    je L19
L3:
    cmp eax, 073000000h
    je L4
    cmp eax, 073300000h
    je L4
    cmp eax, 073100000h
    je L4
    cmp eax, 073200000h
    jne L16
L4:
    cmp eax, 073100000h
    mov dword ptr [ebp - 4], 1
    je L5
    cmp eax, 073200000h
    jne L6
L5:
    and dword ptr [ebp - 4], 0
L6:
    and dword ptr [ebp - 12], 0
    cmp edi, 1
    jb L14
    mov ecx, dword ptr [ecx + 16]
    mov ecx, dword ptr [ecx]
    mov edx, dword ptr [ebp + 8]
    mov dword ptr [ebp - 16], ecx
    lea ecx, [ebx + 4]
    sub edx, ebx
    mov dword ptr [ebp - 8], edi
L7:
    mov ebx, dword ptr [ebp - 16]
    cmp ebx, dword ptr [edx + ecx]
    jne L8
    mov ebx, dword ptr [ebp - 4]
    cmp dword ptr [ecx], ebx
    jne L8
    mov dword ptr [ebp - 12], 1
L8:
    add ecx, 4
    dec dword ptr [ebp - 8]
    jne L7
    cmp dword ptr [ebp - 12], 0
    je L13
    cmp eax, 073000000h
    je L9
    cmp eax, 073200000h
    je L9
    mov eax, dword ptr [ebp + 16]
    mov dword ptr [eax], 073400000h
    jmp L10
L9:
    mov eax, dword ptr [ebp + 16]
    and dword ptr [eax], 0
L10:
    inc dword ptr [esi + 0000000FCh]
    mov ecx, dword ptr [ebp + 8]
    mov eax, dword ptr [ecx + edi*4]
    mov ebx, dword ptr [ebp + 12]
    mov dword ptr [ecx + edi*4 + 4], eax
    lea eax, [ebx + edi*4]
    mov edx, dword ptr [eax]
    push 1
    mov dword ptr [eax + 4], edx
    lea eax, [edi + 1]
    push eax
    push ebx
    push ecx
    mov ecx, esi
    call L0
    mov eax, dword ptr [esi + 0000000FCh]
    mov ecx, dword ptr [esi + 24]
    mov ecx, dword ptr [ecx + eax*4]
    mov eax, dword ptr [ecx]
    and eax, 0FFF00000h
    cmp eax, 073400000h
    jne L11
    and dword ptr [ecx], 0
    jmp L16
L11:
    cmp eax, 073100000h
    jne L12
    mov dword ptr [ecx], 073200001h
    jmp L16
L12:
    cmp eax, 073300000h
    jne L16
    mov dword ptr [ecx], 073000001h
    jmp L16
L13:
    mov ebx, dword ptr [ebp + 12]
    mov ecx, dword ptr [ebp + 16]
L14:
    cmp eax, 073000000h
    je L15
    cmp eax, 073200000h
    jne L16
L15:
    mov eax, dword ptr [esi + 0000000FCh]
    inc eax
    mov dword ptr [esi + 0000000FCh], eax
    mov eax, dword ptr [ecx + 16]
    mov ecx, dword ptr [eax]
    mov eax, dword ptr [ebp + 8]
    mov dword ptr [eax + edi*4 + 4], ecx
    mov ecx, dword ptr [ebp - 4]
    mov dword ptr [ebx + edi*4 + 4], ecx
    push 0
    lea ecx, [edi + 1]
    push ecx
    push ebx
    push eax
    mov ecx, esi
    call L0
L16:
    mov eax, dword ptr [esi + 0000000FCh]
    cmp eax, dword ptr [esi + 12]
    jae L22
    mov ecx, dword ptr [esi + 24]
    mov eax, dword ptr [ecx + eax*4]
    mov eax, dword ptr [eax]
    and eax, 0FFF00000h
    cmp eax, 073100000h
    je L17
    cmp eax, 073300000h
    jne L18
L17:
    xor eax, eax
    cmp dword ptr [ebx + edi*4], eax
    sete al
    mov dword ptr [ebx + edi*4], eax
L18:
    inc dword ptr [esi + 0000000FCh]
    mov eax, dword ptr [esi + 0000000FCh]
    cmp eax, dword ptr [esi + 12]
    jb L2
L19:
    xor eax, eax
L20:
    pop ebx
L21:
    pop edi
    pop esi
    leave
    ret 16
L22:
    mov eax, 080004005h
    jmp L20
FUN_100c1df2 ENDP
END
