.686
.MODEL FLAT, C
EXTRN sub_1006515C:PROC
EXTRN sub_100651C8:PROC
EXTRN sub_1006531B:PROC
EXTRN sub_1006531E:PROC
EXTRN sub_10065361:PROC
EXTRN sub_100653D4:PROC
EXTRN sub_10065449:PROC
EXTRN sub_1006633B:PROC
EXTRN sub_100678A5:PROC
EXTRN sub_100678D7:PROC
EXTRN sub_1006792E:PROC
EXTRN sub_10067955:PROC
EXTRN sub_10082B78:PROC
EXTRN sub_10082BE4:PROC
EXTRN sub_100F7894:PROC
EXTRN sub_100F78D9:PROC
EXTRN sub_100F7929:PROC
EXTRN sub_100F7999:PROC
.CODE
FUN_100663c0 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 100
    push ebx
    push esi
    push edi
    mov esi, ecx
    mov eax, dword ptr [esi + 00000026Ch]
    push 8
    mov dword ptr [ebp - 12], eax
    pop ecx
    xor eax, eax
    lea edi, [ebp - 44]
    push 20
    mov dword ptr [ebp - 8], esi
    rep stosd dword ptr es:[edi], eax
    call sub_100F7894
    xor ebx, ebx
    cmp eax, ebx
    pop ecx
    je L0
    mov dword ptr [eax], 01010C91Ch
    mov dword ptr [eax + 4], ebx
    mov dword ptr [eax + 8], ebx
    mov dword ptr [eax + 12], ebx
    mov dword ptr [eax + 16], ebx
    mov dword ptr [ebp - 4], eax
    jmp L1
L0:
    mov dword ptr [ebp - 4], ebx
L1:
    cmp dword ptr [ebp - 4], ebx
    je L12
    push dword ptr [ebp - 4]
    mov ecx, esi
    call sub_1006531E
    mov edi, eax
    cmp edi, ebx
    jl L16
    push 20
    call sub_100F78D9
    cmp eax, ebx
    pop ecx
    je L2
    mov dword ptr [eax], 01010C914h
    mov dword ptr [eax + 4], ebx
    mov dword ptr [eax + 8], ebx
    mov dword ptr [eax + 12], ebx
    mov dword ptr [eax + 16], ebx
    mov dword ptr [ebp - 4], eax
    jmp L3
L2:
    mov dword ptr [ebp - 4], ebx
L3:
    cmp dword ptr [ebp - 4], ebx
    je L12
    push dword ptr [ebp - 4]
    mov ecx, esi
    call sub_10065361
    mov edi, eax
    cmp edi, ebx
    jl L16
    push 2
    pop esi
    push 20
    mov dword ptr [ebp - 44], esi
    mov dword ptr [ebp - 36], 000000900h
    call sub_100F7929
    cmp eax, ebx
    pop ecx
    je L4
    mov dword ptr [eax], 01010C900h
    mov dword ptr [eax + 4], ebx
    mov dword ptr [eax + 8], ebx
    mov dword ptr [eax + 12], ebx
    mov dword ptr [eax + 16], ebx
    mov dword ptr [ebp - 4], eax
    jmp L5
L4:
    mov dword ptr [ebp - 4], ebx
L5:
    cmp dword ptr [ebp - 4], ebx
    je L12
    push 48
    call sub_1006515C
    cmp eax, ebx
    je L6
    lea ecx, [ebp - 44]
    push ecx
    mov ecx, eax
    call sub_10082B78
    jmp L7
L6:
    xor eax, eax
L7:
    cmp eax, ebx
    mov ecx, dword ptr [ebp - 4]
    mov dword ptr [ecx + 8], eax
    je L12
    push ecx
    mov ecx, dword ptr [ebp - 8]
    call sub_100653D4
    mov edi, eax
    cmp edi, ebx
    jl L16
    push 20
    mov dword ptr [ebp - 44], esi
    mov dword ptr [ebp - 36], 000000902h
    call sub_100F7999
    cmp eax, ebx
    pop ecx
    je L8
    mov dword ptr [eax], 01010C8F0h
    mov dword ptr [eax + 4], ebx
    mov dword ptr [eax + 8], ebx
    mov dword ptr [eax + 12], ebx
    mov dword ptr [eax + 16], ebx
    mov dword ptr [ebp - 4], eax
    jmp L9
L8:
    mov dword ptr [ebp - 4], ebx
L9:
    cmp dword ptr [ebp - 4], ebx
    je L12
    push 48
    call sub_100651C8
    cmp eax, ebx
    je L10
    lea ecx, [ebp - 44]
    push ecx
    mov ecx, eax
    call sub_10082BE4
    jmp L11
L10:
    xor eax, eax
L11:
    cmp eax, ebx
    mov ecx, dword ptr [ebp - 4]
    mov dword ptr [ecx + 8], eax
    jne L13
L12:
    mov edi, 08007000Eh
    jmp L16
L13:
    push dword ptr [ebp - 4]
    mov ecx, dword ptr [ebp - 8]
    call sub_10065449
    mov edi, eax
    cmp edi, ebx
    jl L16
    mov esi, dword ptr [ebp + 8]
    cmp esi, ebx
    mov dword ptr [ebp - 4], ebx
    je L15
    lea ecx, [ebp - 100]
    call sub_100678A5
    mov edi, dword ptr [ebp - 8]
    lea eax, [ebp - 100]
    mov dword ptr [edi + 00000026Ch], eax
    cmp dword ptr [esi], ebx
    jne L19
L14:
    lea ecx, [ebp - 100]
    call sub_100678D7
L15:
    xor edi, edi
L16:
    mov ecx, dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 12]
    mov dword ptr [ecx + 00000026Ch], eax
    mov ecx, dword ptr [ebp - 4]
    cmp ecx, ebx
    je L17
    push 1
    call sub_1006531B
L17:
    mov eax, edi
    pop edi
    pop esi
    pop ebx
    leave
    ret 4
L18:
    mov edi, dword ptr [ebp - 8]
L19:
    mov edx, dword ptr [esi + 4]
    cmp edx, ebx
    je L21
    mov eax, edx
    lea ecx, [eax + 1]
    mov dword ptr [ebp + 8], ecx
L20:
    mov cl, byte ptr [eax]
    inc eax
    cmp cl, bl
    jne L20
    sub eax, dword ptr [ebp + 8]
    jmp L22
L21:
    xor eax, eax
L22:
    lea ecx, [edi + 24]
    push ecx
    push edi
    push ebx
    push ebx
    push eax
    push edx
    lea ecx, [ebp - 100]
    call sub_1006792E
    mov edi, eax
    cmp edi, ebx
    jl L23
    mov ecx, dword ptr [ebp - 8]
    push ebx
    push dword ptr [esi]
    call sub_1006633B
    mov edi, eax
    cmp edi, ebx
    jl L23
    add esi, 8
    cmp dword ptr [esi], ebx
    jne L18
    jmp L14
L23:
    lea ecx, [ebp - 100]
    call sub_10067955
    jmp L16
FUN_100663c0 ENDP
END
