.686
.MODEL FLAT, C
EXTRN sub_10067C68:PROC
EXTRN sub_10067CD3:PROC
EXTRN sub_10067F38:PROC
EXTRN sub_10067F92:PROC
EXTRN sub_100688FE:PROC
EXTRN sub_10068985:PROC
EXTRN sub_10068A95:PROC
EXTRN sub_10068CA9:PROC
EXTRN sub_10068D1A:PROC
EXTRN sub_10068DB9:PROC
EXTRN sub_10068E74:PROC
EXTRN sub_1006A89A:PROC
EXTRN sub_1006A8EF:PROC
EXTRN sub_1006A9B1:PROC
EXTRN sub_1006AA94:PROC
EXTRN sub_100846B8:PROC
.CODE
FUN_1006a8ce PROC
    push esi
    mov esi, ecx
    lea edx, [eax + 1]
L0:
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L0
    sub eax, edx
    cmp eax, 2
    ja L1
    push ebx
    push 01010F318h
    push 0000007D5h
    push dword ptr [ebp + 16]
    push dword ptr [ebp + 8]
    call sub_10067C68
    add esp, 20
    mov eax, 080004005h
    jmp L32
L1:
    mov ecx, dword ptr [ebp + 32]
    xor eax, eax
    push edi
    mov edi, dword ptr [ebp + 28]
    mov dword ptr [edi], eax
    mov dword ptr [ecx], eax
    mov ecx, dword ptr [ebp + 36]
    mov dword ptr [ecx], eax
    mov dx, word ptr [ebx]
    mov ecx, 01010F000h
    cmp dx, word ptr [ecx]
    jne L12
    mov eax, dword ptr [esi + 0000000B4h]
    cmp eax, 10
    jl L9
    cmp eax, 12
    jg L9
    lea eax, [ebp + 23]
    push eax
    lea eax, [ebp + 27]
    push eax
    lea eax, [ebx + 2]
    push eax
    call sub_100688FE
    test eax, eax
    jge L5
L2:
    push ebx
    push 01010F2F0h
L3:
    push 0000007D5h
    push dword ptr [ebp + 16]
    push dword ptr [ebp + 8]
    call sub_10067CD3
    add esp, 20
L4:
    mov eax, 080004005h
    jmp L31
L5:
    cmp byte ptr [ebp + 27], 5
    jne L6
    mov dword ptr [edi], 3
    jmp L7
L6:
    cmp byte ptr [ebp + 27], 10
    jne L8
    mov dword ptr [edi], 1
L7:
    movzx eax, byte ptr [ebp + 23]
    mov ecx, dword ptr [ebp + 36]
    mov dword ptr [ecx], eax
    jmp L30
L8:
    push ebx
    push 01010F2BCh
    jmp L3
L9:
    mov dword ptr [edi], 1
    lea edi, [esi + 28]
    push ebx
    mov ecx, edi
    call sub_10068CA9
    test eax, eax
    je L10
    mov eax, dword ptr [eax + 4]
    mov ecx, dword ptr [ebp + 36]
    mov dword ptr [ecx], eax
    jmp L11
L10:
    lea eax, [ebp + 23]
    push eax
    lea eax, [ebp + 31]
    push eax
    lea eax, [ebx + 2]
    push eax
    call sub_10068985
    test eax, eax
    jl L2
    mov ecx, dword ptr [ebp + 36]
    add esi, 00000009Ch
    mov eax, dword ptr [esi]
    push 1
    mov dword ptr [ecx], eax
    push dword ptr [esi]
    mov ecx, edi
    push ebx
    call sub_1006A89A
    inc dword ptr [esi]
L11:
    cmp dword ptr [ebp + 24], 0
    je L30
    push ebx
    push 01010F27Ch
    jmp L3
L12:
    mov dx, word ptr [ebx]
    mov ecx, 01010EFFCh
    cmp dx, word ptr [ecx]
    jne L15
    mov dword ptr [edi], eax
    lea edi, [esi + 84]
    push ebx
    mov ecx, edi
    call sub_10068D1A
    test eax, eax
    mov ecx, dword ptr [ebp + 36]
    je L13
    mov eax, dword ptr [eax + 4]
    mov dword ptr [ecx], eax
    jmp L14
L13:
    add esi, 0000000A4h
    mov eax, dword ptr [esi]
    push 1
    mov dword ptr [ecx], eax
    push dword ptr [esi]
    mov ecx, edi
    push ebx
    call sub_1006A8EF
    inc dword ptr [esi]
L14:
    cmp dword ptr [ebp + 24], 0
    je L30
    push ebx
    push 01010F23Ch
    jmp L3
L15:
    mov dx, word ptr [ebx]
    mov ecx, 01010F238h
    cmp dx, word ptr [ecx]
    mov eax, 01010F234h
    je L20
    mov ecx, eax
    cmp dx, word ptr [ecx]
    je L20
    mov ecx, 01010F230h
    cmp dx, word ptr [ecx]
    je L20
    mov ecx, 01010F22Ch
    cmp dx, word ptr [ecx]
    je L20
    cmp dword ptr [esi + 0000000B0h], 0
    je L19
    mov eax, 01010EFF8h
    mov cx, dx
    cmp cx, word ptr [eax]
    jne L19
    mov dword ptr [edi], 6
    lea edi, [esi + 56]
    push ebx
    mov ecx, edi
    call sub_10068DB9
    test eax, eax
    je L16
    mov eax, dword ptr [eax + 4]
    mov ecx, dword ptr [ebp + 36]
    mov dword ptr [ecx], eax
    jmp L18
L16:
    lea eax, [ebp + 23]
    push eax
    lea eax, [ebp + 31]
    push eax
    lea eax, [ebx + 2]
    push eax
    call sub_10068A95
    test eax, eax
    jge L17
    push ebx
    push 01010F204h
    jmp L3
L17:
    mov ecx, dword ptr [ebp + 36]
    add esi, 0000000A0h
    mov eax, dword ptr [esi]
    push 1
    mov dword ptr [ecx], eax
    push dword ptr [esi]
    mov ecx, edi
    push ebx
    call sub_1006A9B1
    inc dword ptr [esi]
L18:
    cmp dword ptr [ebp + 24], 0
    je L30
    push ebx
    push 01010F1C4h
    jmp L3
L19:
    push ebx
    push 01010F138h
    jmp L3
L20:
    mov cx, word ptr [ebx]
    cmp cx, word ptr [eax]
    jne L21
    mov dword ptr [edi], 14
    xor edi, edi
    jmp L25
L21:
    mov cx, word ptr [ebx]
    mov eax, 01010F230h
    cmp cx, word ptr [eax]
    jne L22
    mov dword ptr [edi], 7
    xor edi, edi
    inc edi
    jmp L25
L22:
    mov cx, word ptr [ebx]
    mov eax, 01010F22Ch
    cmp cx, word ptr [eax]
    jne L23
    mov dword ptr [edi], 10
    push 2
    jmp L24
L23:
    mov dword ptr [edi], 2
    push 3
L24:
    pop edi
L25:
    push ebx
    mov ecx, esi
    call sub_10068E74
    test eax, eax
    je L26
    mov edx, dword ptr [eax + 4]
    mov ecx, dword ptr [ebp + 36]
    mov dword ptr [ecx], edx
    mov eax, dword ptr [eax + 8]
    mov dword ptr [ebp + 32], eax
    jmp L28
L26:
    mov ecx, dword ptr [ebp + 12]
    lea eax, [ebp + 32]
    push eax
    push ebx
    push dword ptr [ebp + 16]
    call sub_100846B8
    test eax, eax
    jl L31
    cmp dword ptr [ebp + 32], 0
    jne L27
    lea eax, [ebx + 2]
    push eax
    push ebx
    push 01010F0F8h
    push 0000007D5h
    push dword ptr [ebp + 16]
    push dword ptr [ebp + 8]
    call sub_10067F38
    add esp, 24
    jmp L4
L27:
    push dword ptr [ebp + 32]
    mov ecx, dword ptr [ebp + 36]
    lea edi, [esi + edi*4 + 00000008Ch]
    mov eax, dword ptr [edi]
    mov dword ptr [ecx], eax
    push dword ptr [edi]
    mov ecx, esi
    push ebx
    call sub_1006AA94
    mov eax, dword ptr [ebp + 32]
    add dword ptr [edi], eax
    inc dword ptr [esi + 0000000ACh]
    mov ecx, dword ptr [ebp + 36]
L28:
    mov eax, dword ptr [ebp + 24]
    test eax, eax
    je L30
    mov eax, dword ptr [eax + 24]
    cmp eax, dword ptr [ebp + 32]
    jbe L29
    push eax
    push dword ptr [ebp + 32]
    push ebx
    push 01010F0A8h
    push 0000007D5h
    push dword ptr [ebp + 16]
    push dword ptr [ebp + 8]
    call sub_10067F92
    add esp, 28
    jmp L4
L29:
    add dword ptr [ecx], eax
L30:
    xor eax, eax
L31:
    pop edi
L32:
    pop esi
    pop ebx
    pop ebp
    ret 32
FUN_1006a8ce ENDP
END
