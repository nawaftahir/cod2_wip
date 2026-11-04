.686
.MODEL FLAT, C
EXTRN sub_1008A16A:PROC
.CODE
FUN_1008a14f PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    mov edx, ecx
    mov eax, dword ptr [edx + 20]
    mov ecx, dword ptr [ebp + 12]
    mov ecx, dword ptr [eax + ecx*4]
    mov eax, dword ptr [ebp + 20]
    push ebx
    push esi
    mov esi, dword ptr [ebp + 16]
    lea eax, [eax + esi*4]
    mov esi, dword ptr [ebp + 8]
    push edi
    mov edi, dword ptr [esi + 28]
    mov eax, dword ptr [edi + eax*4]
    cmp eax, -1
    mov dword ptr [ebp - 4], edx
    mov dword ptr [ebp - 8], ecx
    mov dword ptr [ebp + 16], eax
    jne L3
L0:
    or eax, 0FFFFFFFFh
L1:
    pop edi
    pop esi
    pop ebx
    leave
    ret 16
L2:
    mov eax, dword ptr [ebp + 16]
    mov edx, dword ptr [ebp - 4]
L3:
    mov edx, dword ptr [edx + 20]
    mov edi, dword ptr [edx + eax*4]
    mov edx, dword ptr [edi + 72]
    cmp edx, dword ptr [ecx + 88]
    jae L8
    mov ebx, dword ptr [ecx + 72]
    cmp ebx, dword ptr [edi + 88]
    jae L0
    mov edx, dword ptr [edi + 20]
    cmp dword ptr [ecx + 20], edx
    jne L4
    cmp dword ptr [ecx + 24], edx
    je L1
L4:
    cmp ebx, dword ptr [edi + 72]
    jae L5
    mov eax, ecx
    mov dword ptr [ebp + 20], edi
    jmp L6
L5:
    mov eax, edi
    mov dword ptr [ebp + 20], ecx
L6:
    mov eax, dword ptr [eax + 116]
    mov edx, dword ptr [esi + 80]
    mov ebx, dword ptr [esi + 84]
    and dword ptr [ebp + 12], 0
    shl eax, 2
    mov edx, dword ptr [eax + edx]
    lea ebx, [ebx + edx*4]
    mov edx, dword ptr [esi + 76]
    mov eax, dword ptr [eax + edx]
    test eax, eax
    mov dword ptr [ebp + 8], eax
    jbe L8
L7:
    mov eax, dword ptr [ebp + 12]
    mov eax, dword ptr [ebx + eax*4]
    lea edx, [eax + eax*2]
    mov eax, dword ptr [esi + 88]
    lea eax, [eax + edx*4]
    mov edx, dword ptr [ebp + 20]
    mov edx, dword ptr [edx + 72]
    cmp dword ptr [eax], edx
    jbe L8
    push dword ptr [eax + 8]
    mov ecx, dword ptr [ebp - 4]
    push dword ptr [eax + 4]
    mov eax, dword ptr [ebp + 20]
    push dword ptr [eax + 24]
    push dword ptr [eax + 20]
    call sub_1008A16A
    test eax, eax
    je L9
    inc dword ptr [ebp + 12]
    mov eax, dword ptr [ebp + 12]
    cmp eax, dword ptr [ebp + 8]
    mov ecx, dword ptr [ebp - 8]
    jb L7
L8:
    mov edi, dword ptr [edi + 48]
    cmp edi, -1
    mov dword ptr [ebp + 16], edi
    jne L2
    jmp L0
L9:
    mov eax, dword ptr [ebp + 16]
    jmp L1
FUN_1008a14f ENDP
END
