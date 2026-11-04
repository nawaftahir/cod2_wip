.686
.MODEL FLAT, C
EXTRN sub_1008B1A4:PROC
EXTRN sub_1008B1F3:PROC
.CODE
FUN_100c41a7 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    push ebx
    push esi
    xor ebx, ebx
    mov esi, ecx
    mov ecx, dword ptr [ebp + 20]
    cmp ecx, ebx
    push edi
    mov dword ptr [ebp - 8], ebx
    mov dword ptr [ebp - 4], ebx
    je L0
    mov dword ptr [ecx], ebx
L0:
    mov edi, dword ptr [ebp + 8]
    mov eax, dword ptr [edi + 4]
    cmp dword ptr [esi + 000000088h], eax
    jne L2
    mov eax, dword ptr [edi + 12]
    cmp eax, dword ptr [esi + 44]
    mov dword ptr [ebp - 8], ebx
    mov dword ptr [ebp - 4], eax
    jb L1
    push 01011A2A8h
    push 000001199h
    jmp L5
L1:
    mov ecx, dword ptr [esi + 80]
    cmp ecx, ebx
    je L7
    cmp eax, ecx
    jb L7
    sub eax, ecx
    mov dword ptr [ebp - 4], eax
    mov dword ptr [ebp - 8], 3
    jmp L7
L2:
    cmp dword ptr [esi + 00000008Ch], eax
    jne L3
    mov eax, dword ptr [edi + 12]
    cmp eax, 1
    mov dword ptr [ebp - 8], 3
    mov dword ptr [ebp - 4], eax
    jb L7
    push 01011A280h
    push 00000119Ch
    jmp L5
L3:
    cmp dword ptr [esi + 000000084h], eax
    jne L4
    mov eax, dword ptr [esi]
    push ecx
    lea ecx, [ebp - 8]
    push ecx
    lea ecx, [ebp - 4]
    push ecx
    push edi
    mov ecx, esi
    call dword ptr [eax + 0x84]
    test eax, eax
    jge L6
    mov eax, 080004005h
    jmp L11
L4:
    cmp dword ptr [esi + 000000090h], eax
    jne L9
    mov eax, dword ptr [edi + 12]
    cmp eax, dword ptr [esi + 52]
    mov dword ptr [ebp - 8], 19
    mov dword ptr [ebp - 4], eax
    jb L7
    push 01011A254h
    push 0000011C5h
L5:
    mov eax, dword ptr [esi + 000000100h]
    push dword ptr [eax + 60]
    push esi
    call sub_1008B1A4
    mov eax, 088760B59h
    jmp L10
L6:
    mov eax, dword ptr [ebp - 4]
L7:
    mov ecx, dword ptr [ebp + 12]
    cmp ecx, ebx
    je L8
    mov edx, dword ptr [ebp - 8]
    mov ebx, edx
    or ebx, 0FFFFFFF8h
    shl ebx, 20
    and edx, 24
    or ebx, edx
    shl ebx, 8
    and eax, 0000007FFh
    or ebx, eax
    mov dword ptr [ecx], ebx
    xor ebx, ebx
L8:
    push dword ptr [ebp + 16]
    mov eax, dword ptr [esi]
    push edi
    mov ecx, esi
    call dword ptr [eax + 0x7c]
    cmp eax, ebx
    jl L11
    xor eax, eax
    jmp L11
L9:
    push 01011A224h
    push ebx
    push ebx
    push esi
    call sub_1008B1F3
    mov eax, 080004005h
L10:
    add esp, 16
L11:
    pop edi
    pop esi
    pop ebx
    leave
    ret 16
FUN_100c41a7 ENDP
END
