.686
.MODEL FLAT, C
EXTRN sub_1008544E:PROC
EXTRN sub_10085E0E:PROC
EXTRN sub_100861FE:PROC
EXTRN sub_10086218:PROC
.CODE
FUN_100baf09 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 12
    push ebx
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 000000100h]
    mov ecx, dword ptr [eax + 16]
    mov eax, dword ptr [esi + 20]
    mov edx, dword ptr [ecx]
    mov edx, dword ptr [eax + edx*4]
    mov ebx, dword ptr [esi + 16]
    push edi
    mov edi, dword ptr [edx + 4]
    mov edi, dword ptr [ebx + edi*4]
    test byte ptr [edi + 4], 1
    je L0
    cmp dword ptr [edx + 60], 0
    jne L0
    mov ecx, dword ptr [ecx + 4]
    mov ecx, dword ptr [eax + ecx*4]
    cmp dword ptr [ecx + 60], 0
    je L8
L0:
    and dword ptr [ebp - 8], 0
    cmp dword ptr [esi + 8], 0
    jbe L3
    mov edx, dword ptr [esi + 000000088h]
    mov edi, dword ptr [esi + 8]
L1:
    mov ecx, dword ptr [eax]
    cmp edx, dword ptr [ecx + 4]
    jne L2
    mov ecx, dword ptr [ecx + 12]
    cmp ecx, dword ptr [ebp - 8]
    jb L2
    inc ecx
    mov dword ptr [ebp - 8], ecx
L2:
    add eax, 4
    dec edi
    jne L1
L3:
    push 4
    push 4
    push 010000004h
    mov ecx, esi
    call sub_10086218
    cmp eax, -1
    je L5
    mov ecx, dword ptr [esi + 24]
    mov eax, dword ptr [ecx + eax*4]
    push dword ptr [esi + 000000100h]
    mov ecx, eax
    mov dword ptr [ebp - 12], eax
    call sub_1008544E
    test eax, eax
    jl L9
    and dword ptr [ebp - 4], 0
L4:
    mov edi, dword ptr [ebp - 4]
    fldz
    push ecx
    push ecx
    fstp qword ptr [esp]
    push edi
    push dword ptr [ebp - 8]
    mov ecx, esi
    push dword ptr [esi + 000000088h]
    call sub_100861FE
    mov ebx, eax
    cmp ebx, -1
    je L5
    mov ecx, dword ptr [esi + 000000100h]
    mov ecx, dword ptr [ecx + 16]
    mov eax, dword ptr [esi + 20]
    shl edi, 2
    mov ecx, dword ptr [edi + ecx]
    push dword ptr [eax + ecx*4]
    mov ecx, dword ptr [eax + ebx*4]
    call sub_10085E0E
    test eax, eax
    jl L9
    mov ecx, dword ptr [esi + 000000100h]
    mov ecx, dword ptr [ecx + 16]
    mov ecx, dword ptr [edi + ecx]
    mov eax, dword ptr [esi + 20]
    mov ecx, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [ecx + 24]
    mov eax, dword ptr [eax + ebx*4]
    mov dword ptr [eax + 24], ecx
    mov ecx, dword ptr [esi + 000000100h]
    mov ecx, dword ptr [ecx + 16]
    mov ecx, dword ptr [edi + ecx]
    mov eax, dword ptr [esi + 20]
    mov ecx, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [ecx + 20]
    mov eax, dword ptr [eax + ebx*4]
    inc dword ptr [ebp - 4]
    cmp dword ptr [ebp - 4], 4
    mov dword ptr [eax + 20], ecx
    mov eax, dword ptr [esi + 000000100h]
    mov ecx, dword ptr [eax + 16]
    mov ecx, dword ptr [edi + ecx]
    mov eax, dword ptr [ebp - 12]
    mov edx, dword ptr [eax + 16]
    mov dword ptr [edi + edx], ecx
    mov ecx, dword ptr [esi + 000000100h]
    mov ecx, dword ptr [ecx + 16]
    mov dword ptr [edi + ecx], ebx
    mov eax, dword ptr [eax + 8]
    mov dword ptr [edi + eax], ebx
    jb L4
    mov eax, dword ptr [esi + 12]
    dec eax
    dec eax
    lea ecx, [esi + 0000000FCh]
    jmp L7
L5:
    mov eax, 08007000Eh
    jmp L9
L6:
    mov edx, dword ptr [esi + 24]
    lea edx, [edx + eax*4]
    mov edi, dword ptr [edx]
    mov dword ptr [edx + 4], edi
    dec eax
L7:
    cmp eax, dword ptr [ecx]
    ja L6
    mov eax, dword ptr [ecx]
    mov ecx, dword ptr [esi + 24]
    mov edx, dword ptr [ebp - 12]
    mov dword ptr [ecx + eax*4 + 4], edx
L8:
    mov dword ptr [esi + 00000018Ch], 1
    xor eax, eax
L9:
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_100baf09 ENDP
END
