.686
.MODEL FLAT, C
EXTRN sub_100853E3:PROC
EXTRN sub_1008545E:PROC
EXTRN sub_10085E45:PROC
EXTRN sub_10086222:PROC
EXTRN sub_10086225:PROC
EXTRN sub_100862A7:PROC
EXTRN sub_1008842B:PROC
EXTRN sub_100886AD:PROC
.CODE
FUN_10088dca PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 12
    push ebx
    push esi
    mov esi, dword ptr [ebp + 8]
    push esi
    mov ebx, ecx
    call sub_100862A7
    cmp eax, -1
    jne L0
    mov eax, 08007000Eh
    jmp L9
L0:
    mov ecx, dword ptr [ebx + 24]
    push edi
    mov edi, dword ptr [ecx + eax*4]
    push esi
    mov ecx, edi
    call sub_100853E3
    mov esi, dword ptr [esi + 12]
    and dword ptr [ebp - 4], 0
    test esi, esi
    jbe L2
    mov eax, dword ptr [ebp + 8]
    mov eax, dword ptr [eax + 16]
    mov ecx, dword ptr [eax]
    mov dword ptr [ebp - 12], ecx
    mov dword ptr [ebp - 8], eax
L1:
    mov eax, dword ptr [ebp - 8]
    push dword ptr [eax]
    mov ecx, ebx
    push dword ptr [ebp - 12]
    call sub_1008842B
    test eax, eax
    je L2
    inc dword ptr [ebp - 4]
    add dword ptr [ebp - 8], 4
    cmp dword ptr [ebp - 4], esi
    jb L1
L2:
    cmp dword ptr [ebp - 4], esi
    je L7
    push -1
    and esi, 0000FFFFFh
    push -1
    or esi, 010000000h
    push esi
    mov ecx, ebx
    call sub_10086225
    cmp eax, -1
    jne L4
L3:
    mov eax, 08007000Eh
    jmp L8
L4:
    mov ecx, dword ptr [ebx + 24]
    mov esi, dword ptr [ecx + eax*4]
    push dword ptr [ebp + 8]
    mov ecx, esi
    mov dword ptr [ebp - 8], esi
    call sub_1008545E
    and dword ptr [ebp - 4], 0
    cmp dword ptr [edi + 12], 0
    jbe L6
L5:
    mov ecx, dword ptr [ebp - 8]
    fldz
    mov ecx, dword ptr [ecx + 16]
    mov esi, dword ptr [ebp - 4]
    mov eax, dword ptr [edi + 16]
    push ecx
    push ecx
    fstp qword ptr [esp]
    shl esi, 2
    mov eax, dword ptr [esi + eax]
    push -1
    mov dword ptr [esi + ecx], eax
    push -1
    push dword ptr [ebx + 000000088h]
    mov ecx, ebx
    call sub_10086222
    mov ecx, dword ptr [ebp - 8]
    mov edx, dword ptr [ecx + 8]
    mov dword ptr [esi + edx], eax
    mov eax, dword ptr [ecx + 8]
    mov eax, dword ptr [esi + eax]
    mov ecx, dword ptr [edi + 16]
    mov dword ptr [esi + ecx], eax
    mov eax, dword ptr [edi + 16]
    cmp dword ptr [esi + eax], -1
    je L3
    mov ecx, dword ptr [ebp + 8]
    mov ecx, dword ptr [ecx + 16]
    mov ecx, dword ptr [esi + ecx]
    mov eax, dword ptr [ebx + 20]
    push dword ptr [eax + ecx*4]
    mov ecx, dword ptr [edi + 16]
    mov ecx, dword ptr [esi + ecx]
    mov ecx, dword ptr [eax + ecx*4]
    call sub_10085E45
    mov eax, dword ptr [ebx + 20]
    mov ecx, dword ptr [ebp + 8]
    mov ecx, dword ptr [ecx + 16]
    mov ecx, dword ptr [esi + ecx]
    mov ecx, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [ecx + 20]
    mov edx, dword ptr [edi + 16]
    mov edx, dword ptr [esi + edx]
    mov eax, dword ptr [eax + edx*4]
    mov dword ptr [eax + 20], ecx
    mov ecx, dword ptr [ebp + 8]
    mov ecx, dword ptr [ecx + 16]
    mov ecx, dword ptr [esi + ecx]
    mov eax, dword ptr [ebx + 20]
    mov ecx, dword ptr [eax + ecx*4]
    mov edx, dword ptr [edi + 16]
    mov edx, dword ptr [esi + edx]
    mov eax, dword ptr [eax + edx*4]
    mov ecx, dword ptr [ecx + 24]
    inc dword ptr [ebp - 4]
    mov dword ptr [eax + 24], ecx
    mov ecx, dword ptr [ebp + 8]
    mov ecx, dword ptr [ecx + 16]
    mov eax, dword ptr [ebx + 20]
    mov ecx, dword ptr [esi + ecx]
    mov ecx, dword ptr [eax + ecx*4]
    mov edx, dword ptr [edi + 16]
    mov edx, dword ptr [esi + edx]
    mov eax, dword ptr [eax + edx*4]
    mov ecx, dword ptr [ecx]
    mov dword ptr [eax], ecx
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [edi + 12]
    jb L5
    mov esi, dword ptr [ebp - 8]
L6:
    push esi
    mov ecx, ebx
    call sub_100886AD
    test eax, eax
    jl L8
    and dword ptr [esi], 0
L7:
    xor eax, eax
L8:
    pop edi
L9:
    pop esi
    pop ebx
    leave
    ret 4
FUN_10088dca ENDP
END
