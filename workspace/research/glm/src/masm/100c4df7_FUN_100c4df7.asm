.686
.MODEL FLAT, C
EXTRN sub_10068CA3:PROC
EXTRN sub_10068CBE:PROC
EXTRN sub_1006A7FE:PROC
EXTRN sub_1008420E:PROC
EXTRN sub_10084229:PROC
EXTRN sub_10084252:PROC
EXTRN sub_100F5F8A:PROC
EXTRN sub_100F63E6:PROC
EXTRN sub_100F78AF:PROC
EXTRN sub_100F7A15:PROC
.CODE
FUN_100c4df7 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 56
    push esi
    push edi
    xor edi, edi
    mov esi, ecx
    cmp dword ptr [esi + 000000158h], edi
    mov dword ptr [ebp - 4], edi
    mov dword ptr [ebp - 8], edi
    jne L0
    xor eax, eax
    jmp L10
L0:
    mov eax, dword ptr [esi + 0000001D0h]
    add eax, dword ptr [esi + 0000001F0h]
    add eax, dword ptr [esi + 0000001F4h]
    je L9
    shl eax, 2
    push ebx
    push eax
    call sub_100F78AF
    mov ebx, eax
    cmp ebx, edi
    pop ecx
    mov dword ptr [ebp - 8], ebx
    jne L1
    mov dword ptr [ebp - 4], 08007000Eh
    jmp L8
L1:
    cmp dword ptr [esi + 44], 0
    jbe L3
    lea ebx, [esi + 0000001B4h]
L2:
    push edi
    lea eax, [ebp - 56]
    push 01011A3ACh
    push eax
    call sub_100F5F8A
    add esp, 12
    push 1
    push edi
    lea eax, [ebp - 56]
    push eax
    mov ecx, ebx
    call sub_1006A7FE
    test eax, eax
    mov dword ptr [ebp - 4], eax
    jl L8
    inc edi
    cmp edi, dword ptr [esi + 44]
    jb L2
    mov ebx, dword ptr [ebp - 8]
L3:
    push ebx
    lea ecx, [esi + 0000001B4h]
    call sub_10068CA3
    mov edi, dword ptr [esi + 0000001D0h]
    add edi, dword ptr [esi + 0000001F4h]
    lea ecx, [esi + 0000001D4h]
    lea eax, [ebx + edi*4]
    push eax
    call sub_10068CBE
    add edi, dword ptr [esi + 0000001F0h]
    push 01006A087h
    push 4
    push edi
    push ebx
    call sub_100F63E6
    mov eax, dword ptr [ebp + 16]
    mov edx, dword ptr [ebp + 12]
    xor ecx, ecx
    add esp, 16
    cmp edi, ecx
    lea eax, [eax + eax*4]
    mov word ptr [ebp - 24], 1
    mov word ptr [ebp - 22], 3
    mov word ptr [ebp - 20], 1
    mov word ptr [ebp - 18], 4
    mov word ptr [ebp - 16], 1
    mov word ptr [ebp - 14], cx
    mov dword ptr [ebp - 12], ecx
    lea esi, [edx + eax*4]
    mov dword ptr [ebp + 16], ecx
    jbe L7
    jmp L5
L4:
    mov ebx, dword ptr [ebp - 8]
L5:
    mov eax, dword ptr [ebp + 16]
    mov ecx, dword ptr [ebp + 8]
    push esi
    push 7
    lea ebx, [ebx + eax*4]
    mov eax, dword ptr [ebx]
    push -1
    push dword ptr [eax]
    call sub_1008420E
    test eax, eax
    mov dword ptr [ebp - 4], eax
    jl L8
    mov ecx, dword ptr [ebp + 8]
    lea eax, [esi + 12]
    push eax
    push 6
    push 16
    lea eax, [ebp - 24]
    push eax
    call sub_10084229
    test eax, eax
    mov dword ptr [ebp - 4], eax
    jl L8
    mov eax, dword ptr [ebx]
    cmp dword ptr [eax + 12], 0
    je L6
    or byte ptr [esi + 10], 1
    mov ecx, dword ptr [ebp + 8]
    lea eax, [esi + 16]
    push eax
    mov eax, dword ptr [ebx]
    push 7
    push 16
    add eax, 16
    push eax
    call sub_10084252
    test eax, eax
    mov dword ptr [ebp - 4], eax
    jl L8
L6:
    inc dword ptr [ebp + 16]
    mov word ptr [esi + 4], 2
    mov eax, dword ptr [ebx]
    mov ax, word ptr [eax + 4]
    mov word ptr [esi + 6], ax
    mov word ptr [esi + 8], 1
    add esi, 20
    cmp dword ptr [ebp + 16], edi
    jb L4
L7:
    and dword ptr [ebp - 4], 0
L8:
    pop ebx
L9:
    push dword ptr [ebp - 8]
    call sub_100F7A15
    mov eax, dword ptr [ebp - 4]
    pop ecx
L10:
    pop edi
    pop esi
    leave
    ret 12
FUN_100c4df7 ENDP
END
