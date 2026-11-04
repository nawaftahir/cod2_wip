.686
.MODEL FLAT, C
EXTRN sub_10067FC2:PROC
EXTRN sub_10069A8A:PROC
EXTRN sub_100840A0:PROC
EXTRN sub_1008411D:PROC
EXTRN sub_100841F2:PROC
EXTRN sub_10084254:PROC
EXTRN sub_10084273:PROC
EXTRN sub_10084296:PROC
EXTRN sub_100842BA:PROC
EXTRN sub_100842D5:PROC
EXTRN sub_100842F2:PROC
EXTRN sub_10084381:PROC
EXTRN sub_1008443B:PROC
EXTRN sub_100844B3:PROC
EXTRN sub_100F6A00:PROC
EXTRN sub_100F78F9:PROC
EXTRN sub_100F7916:PROC
EXTRN sub_100F7B31:PROC
EXTRN sub_100F7B39:PROC
.CODE
FUN_1006a3e6 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 80
    push ebx
    push esi
    push edi
    mov esi, ecx
    push 047554244h
    lea ecx, [ebp - 40]
    call sub_100840A0
    push 10
    pop ecx
    push 40
    xor eax, eax
    lea edi, [ebp - 80]
    rep stosd dword ptr es:[edi], eax
    pop eax
    xor ebx, ebx
    push ebx
    push 1
    push eax
    mov dword ptr [ebp - 80], eax
    lea eax, [ebp - 80]
    push eax
    lea ecx, [ebp - 40]
    mov dword ptr [ebp - 12], ebx
    mov dword ptr [ebp - 8], ebx
    call sub_1008411D
    cmp eax, ebx
    mov dword ptr [ebp - 4], eax
    jl L23
    mov eax, dword ptr [esi + 52]
    jmp L2
L0:
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L1
    cmp dword ptr [ecx + 4], 18
    je L3
L1:
    mov eax, dword ptr [eax + 12]
L2:
    test eax, eax
    jne L0
    jmp L4
L3:
    mov ebx, dword ptr [eax + 8]
L4:
    test ebx, ebx
    mov eax, ebx
    je L6
L5:
    inc dword ptr [ebp - 60]
    mov eax, dword ptr [eax + 12]
    test eax, eax
    jne L5
L6:
    mov eax, dword ptr [ebp - 60]
    test eax, eax
    je L16
    shl eax, 2
    push eax
    call sub_100F78F9
    mov edi, eax
    test edi, edi
    pop ecx
    mov dword ptr [ebp - 12], edi
    je L7
    mov ecx, dword ptr [ebp - 60]
    xor eax, eax
    rep stosd dword ptr es:[edi], eax
    mov eax, dword ptr [ebp - 60]
    shl eax, 3
    push eax
    call sub_100F7916
    test eax, eax
    pop ecx
    mov dword ptr [ebp - 8], eax
    jne L8
L7:
    mov dword ptr [ebp - 4], 08007000Eh
    jmp L23
L8:
    mov ecx, dword ptr [ebp - 60]
    mov edi, dword ptr [ebp - 8]
    shl ecx, 3
    mov dword ptr [ebp - 24], ecx
    mov edx, ecx
    shr ecx, 2
    xor eax, eax
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    test ebx, ebx
    rep stosb byte ptr es:[edi], al
    mov edi, ebx
    je L14
    mov eax, dword ptr [ebp - 60]
    mov ecx, dword ptr [ebp - 8]
    lea ebx, [ecx + eax*8 - 6]
L9:
    or word ptr [ebx], 00000FFFFh
    mov ax, word ptr [edi + 36]
    mov word ptr [ebx - 2], ax
    mov eax, dword ptr [edi + 88]
    mov dword ptr [ebx + 2], eax
    mov eax, dword ptr [edi + 32]
    test eax, eax
    je L13
    lea ecx, [ebp - 20]
    push ecx
    push 7
    push -1
    push eax
    lea ecx, [ebp - 40]
    call sub_100841F2
    test eax, eax
    jl L23
    mov ecx, dword ptr [ebp - 20]
    xor eax, eax
    cmp dword ptr [ebp - 68], eax
    mov dword ptr [ebp - 16], eax
    jbe L11
L10:
    mov edx, dword ptr [ebp - 12]
    cmp dword ptr [edx + eax*4], ecx
    je L11
    inc eax
    cmp eax, dword ptr [ebp - 68]
    mov dword ptr [ebp - 16], eax
    jb L10
L11:
    mov edx, dword ptr [ebp - 68]
    cmp eax, edx
    jne L12
    mov eax, dword ptr [ebp - 12]
    mov dword ptr [eax + edx*4], ecx
    inc dword ptr [ebp - 68]
    mov eax, dword ptr [ebp - 16]
L12:
    mov word ptr [ebx], ax
L13:
    mov edi, dword ptr [edi + 12]
    sub ebx, 8
    test edi, edi
    jne L9
L14:
    mov eax, dword ptr [ebp - 68]
    test eax, eax
    je L15
    lea ecx, [ebp - 64]
    push ecx
    push 1
    shl eax, 2
    push eax
    push dword ptr [ebp - 12]
    lea ecx, [ebp - 40]
    call sub_10084254
    test eax, eax
    mov dword ptr [ebp - 4], eax
    jl L23
L15:
    lea eax, [ebp - 56]
    push eax
    push 1
    push dword ptr [ebp - 24]
    lea ecx, [ebp - 40]
    push dword ptr [ebp - 8]
    call sub_10084273
    test eax, eax
    mov dword ptr [ebp - 4], eax
    jl L23
L16:
    mov eax, dword ptr [esi + 116]
    test eax, eax
    je L17
    lea ecx, [ebp - 44]
    push ecx
    push 7
    push -1
    push eax
    lea ecx, [ebp - 40]
    call sub_10084296
    test eax, eax
    mov dword ptr [ebp - 4], eax
    jl L23
L17:
    mov eax, dword ptr [esi + 108]
    test eax, eax
    je L18
    lea ecx, [ebp - 72]
    push ecx
    push 5
    push dword ptr [esi + 112]
    lea ecx, [ebp - 40]
    push eax
    call sub_100842BA
    test eax, eax
    jl L23
    push 0
    push 5
    push 1
    push 01019166Eh
    lea ecx, [ebp - 40]
    call sub_100842D5
    test eax, eax
    jl L23
L18:
    lea eax, [ebp - 76]
    push eax
    push 5
    push -1
    push 01010F030h
    lea ecx, [ebp - 40]
    call sub_100842F2
    test eax, eax
    jl L23
    lea ecx, [ebp - 40]
    call sub_1008443B
    mov edi, eax
    cmp edi, 000008000h
    ja L21
    push edi
    mov ecx, esi
    call sub_10069A8A
    test eax, eax
    mov dword ptr [ebp - 4], eax
    jl L23
    mov ecx, dword ptr [esi + 92]
    mov eax, dword ptr [esi + 88]
    lea ecx, [ecx*4 - 4]
    push ecx
    lea ecx, [eax + 4]
    push ecx
    lea eax, [eax + edi*4 + 4]
    push eax
    call sub_100F6A00
    xor ecx, ecx
    add esp, 12
    cmp dword ptr [ebp - 60], ecx
    jbe L20
    mov eax, dword ptr [ebp - 8]
    add eax, 4
L19:
    mov edx, dword ptr [esi + 104]
    add edx, edi
    shl edx, 2
    add dword ptr [eax], edx
    inc ecx
    add eax, 8
    cmp ecx, dword ptr [ebp - 60]
    jb L19
L20:
    mov eax, dword ptr [esi + 88]
    push edi
    add eax, 4
    push eax
    lea ecx, [ebp - 40]
    call sub_100844B3
    test eax, eax
    mov dword ptr [ebp - 4], eax
    jl L23
    add dword ptr [esi + 92], edi
    mov eax, dword ptr [esi + 92]
    add dword ptr [esi + 104], edi
    mov dword ptr [esi + 100], eax
    jmp L22
L21:
    push 01010F064h
    push 0000007EEh
    lea eax, [esi + 16]
    push eax
    push dword ptr [esi]
    call sub_10067FC2
    add esp, 16
L22:
    and dword ptr [ebp - 4], 0
L23:
    push dword ptr [ebp - 12]
    call sub_100F7B31
    push dword ptr [ebp - 8]
    call sub_100F7B39
    pop ecx
    pop ecx
    lea ecx, [ebp - 40]
    call sub_10084381
    mov eax, dword ptr [ebp - 4]
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_1006a3e6 ENDP
END
