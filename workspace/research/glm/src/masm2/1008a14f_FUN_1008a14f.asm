.686
.MODEL FLAT, C
EXTRN sub_1008A27A:PROC
EXTRN sub_1008A27F:PROC
EXTRN sub_1008A285:PROC
EXTRN sub_1008A288:PROC
EXTRN sub_1008A2D1:PROC
EXTRN sub_1008A2EA:PROC
EXTRN sub_1008A319:PROC
.CODE
FUN_1008a14f PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ecx
    mov mov edx, ecx
    mov mov eax, dword ptr [edx + 20]
    mov mov ecx, dword ptr [ebp + 12]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [ebp + 20]
    push push ebx
    push push esi
    mov mov esi, dword ptr [ebp + 16]
    lea lea eax, [eax + esi*4]
    mov mov esi, dword ptr [ebp + 8]
    push push edi
    mov mov edi, dword ptr [esi + 28]
    mov mov eax, dword ptr [edi + eax*4]
    cmp cmp eax, -1
    mov mov dword ptr [ebp - 4], edx
    mov mov dword ptr [ebp - 8], ecx
    mov mov dword ptr [ebp + 16], eax
    jne L1
    or or eax, -1
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 16
    mov mov eax, dword ptr [ebp + 16]
    mov mov edx, dword ptr [ebp - 4]
    mov mov edx, dword ptr [edx + 20]
    mov mov edi, dword ptr [edx + eax*4]
    mov mov edx, dword ptr [edi + 72]
    cmp cmp edx, dword ptr [ecx + 88]
    jae sub_1008A288
    mov mov ebx, dword ptr [ecx + 72]
    cmp cmp ebx, dword ptr [edi + 88]
    jae L2
    mov mov edx, dword ptr [edi + 20]
    cmp cmp dword ptr [ecx + 20], edx
    jne L4
    cmp cmp dword ptr [ecx + 24], edx
    je L3
    cmp cmp ebx, dword ptr [edi + 72]
    jae L5
    mov mov eax, ecx
    mov mov dword ptr [ebp + 20], edi
    jmp L6
    mov mov eax, edi
L1:
    mov mov dword ptr [ebp + 20], ecx
    mov mov eax, dword ptr [eax + 116]
    mov mov edx, dword ptr [esi + 80]
    mov mov ebx, dword ptr [esi + 84]
    and and dword ptr [ebp + 12], 0
    shl shl eax, 2
    mov mov edx, dword ptr [eax + edx]
    lea lea ebx, [ebx + edx*4]
    mov mov edx, dword ptr [esi + 76]
    mov mov eax, dword ptr [eax + edx]
    test test eax, eax
    mov mov dword ptr [ebp + 8], eax
    jbe sub_1008A2D1
    mov mov eax, dword ptr [ebp + 12]
    mov mov eax, dword ptr [ebx + eax*4]
    lea lea edx, [eax + eax*2]
    mov mov eax, dword ptr [esi + 88]
    lea lea eax, [eax + edx*4]
    mov mov edx, dword ptr [ebp + 20]
    mov mov edx, dword ptr [edx + 72]
    cmp cmp dword ptr [eax], edx
    jbe sub_1008A2EA
    push push dword ptr [eax + 8]
    mov mov ecx, dword ptr [ebp - 4]
    push push dword ptr [eax + 4]
    mov mov eax, dword ptr [ebp + 20]
    push push dword ptr [eax + 24]
    push push dword ptr [eax + 20]
    call L0
    test test eax, eax
    je sub_1008A319
    inc inc dword ptr [ebp + 12]
    mov mov eax, dword ptr [ebp + 12]
    cmp cmp eax, dword ptr [ebp + 8]
    mov mov ecx, dword ptr [ebp - 8]
    jb sub_1008A2D1
    mov mov edi, dword ptr [edi + 48]
    cmp cmp edi, -1
    mov mov dword ptr [ebp + 16], edi
    jne sub_1008A27F
    jmp sub_1008A27A
    mov mov eax, dword ptr [ebp + 16]
    jmp sub_1008A285
FUN_1008a14f ENDP
END
