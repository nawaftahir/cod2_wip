.686
.MODEL FLAT, C
EXTRN sub_100855D9:PROC
EXTRN sub_1008563C:PROC
EXTRN sub_100856ED:PROC
.CODE
FUN_100c2e40 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 24
    push ebx
    push esi
    push edi
    mov esi, ecx
L0:
    xor edi, edi
    cmp dword ptr [esi + 12], edi
    mov dword ptr [ebp - 24], edi
    mov dword ptr [ebp - 12], edi
    jbe L12
L1:
    mov eax, dword ptr [esi + 24]
    mov ecx, dword ptr [eax + edi*4]
    call sub_100855D9
    test eax, eax
    je L11
    lea ebx, [edi + 1]
    cmp ebx, dword ptr [esi + 12]
    mov dword ptr [ebp - 8], 1
    mov dword ptr [ebp - 20], ebx
    jae L9
L2:
    mov eax, dword ptr [esi + 24]
    mov edi, dword ptr [eax + ebx*4]
    mov ecx, edi
    call sub_1008563C
    test eax, eax
    jne L8
    mov eax, dword ptr [edi]
    and eax, 0FFF00000h
    cmp eax, 010000000h
    jne L7
    mov ecx, dword ptr [edi + 12]
    test ecx, ecx
    jbe L6
    mov eax, dword ptr [edi + 8]
    mov edi, dword ptr [edi + 16]
    mov edx, dword ptr [esi + 20]
    mov dword ptr [ebp - 4], eax
    sub edi, eax
    mov dword ptr [ebp - 16], ecx
L3:
    mov ecx, dword ptr [ebp - 4]
    mov eax, dword ptr [edi + ecx]
    mov eax, dword ptr [edx + eax*4]
    mov ecx, dword ptr [ecx]
    mov ecx, dword ptr [edx + ecx*4]
    mov ebx, dword ptr [eax + 56]
    cmp ebx, dword ptr [ecx + 56]
    jne L4
    mov ebx, dword ptr [eax + 60]
    cmp ebx, dword ptr [ecx + 60]
    jne L4
    mov ebx, dword ptr [eax + 4]
    cmp ebx, dword ptr [ecx + 4]
    jne L4
    mov ebx, dword ptr [eax + 12]
    cmp ebx, dword ptr [ecx + 12]
    jne L4
    mov ebx, dword ptr [eax + 8]
    cmp ebx, dword ptr [ecx + 8]
    jne L4
    mov eax, dword ptr [eax + 16]
    cmp eax, dword ptr [ecx + 16]
    je L5
L4:
    and dword ptr [ebp - 8], 0
L5:
    add dword ptr [ebp - 4], 4
    dec dword ptr [ebp - 16]
    jne L3
    mov ebx, dword ptr [ebp - 20]
L6:
    inc ebx
    cmp ebx, dword ptr [esi + 12]
    mov dword ptr [ebp - 20], ebx
    jb L2
    jmp L8
L7:
    and dword ptr [ebp - 8], 0
L8:
    cmp dword ptr [ebp - 8], 0
    mov edi, dword ptr [ebp - 12]
    je L11
L9:
    cmp edi, dword ptr [esi + 12]
    mov dword ptr [ebp - 24], 1
    mov ebx, edi
    jae L11
L10:
    mov eax, dword ptr [esi + 24]
    mov ecx, dword ptr [eax + ebx*4]
    call sub_100856ED
    test eax, eax
    jne L11
    mov eax, dword ptr [esi + 24]
    mov eax, dword ptr [eax + ebx*4]
    and dword ptr [eax], 0
    inc ebx
    cmp ebx, dword ptr [esi + 12]
    jb L10
L11:
    inc edi
    cmp edi, dword ptr [esi + 12]
    mov dword ptr [ebp - 12], edi
    jb L1
    cmp dword ptr [ebp - 24], 0
    jne L0
L12:
    pop edi
    pop esi
    xor eax, eax
    pop ebx
    leave
    ret
FUN_100c2e40 ENDP
END
