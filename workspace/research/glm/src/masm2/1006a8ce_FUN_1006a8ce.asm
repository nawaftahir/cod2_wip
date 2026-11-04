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
EXTRN sub_1006AC66:PROC
EXTRN sub_1006AC68:PROC
EXTRN sub_1006ACC2:PROC
EXTRN sub_1006ACC6:PROC
EXTRN sub_1006ACCF:PROC
EXTRN sub_1006ACD0:PROC
EXTRN sub_1006ACDA:PROC
EXTRN sub_1006ACE8:PROC
EXTRN sub_1006ACF4:PROC
EXTRN sub_1006ACF6:PROC
EXTRN sub_1006AD01:PROC
EXTRN sub_1006AD05:PROC
EXTRN sub_1006AD0B:PROC
EXTRN sub_1006AD5B:PROC
EXTRN sub_1006ADA0:PROC
EXTRN sub_1006ADB0:PROC
EXTRN sub_1006ADCF:PROC
EXTRN sub_1006ADE2:PROC
EXTRN sub_1006ADFA:PROC
EXTRN sub_1006ADFE:PROC
EXTRN sub_1006AE10:PROC
EXTRN sub_1006AE42:PROC
EXTRN sub_1006AE72:PROC
EXTRN sub_1006AEB0:PROC
EXTRN sub_1006AEBB:PROC
EXTRN sub_1006AF08:PROC
EXTRN sub_1006AF5E:PROC
EXTRN sub_1006AF64:PROC
EXTRN sub_100846B8:PROC
.CODE
FUN_1006a8ce PROC
    push push esi
    mov mov esi, ecx
    lea lea edx, [eax + 1]
    mov mov cl, byte ptr [eax]
    inc inc eax
    test test cl, cl
    jne L0
    sub sub eax, edx
    cmp cmp eax, 2
    ja L2
    push push ebx
    push push 01010F318h
    push push 07D5h
    push push dword ptr [ebp + 16]
    push push dword ptr [ebp + 8]
    call sub_10067C68
    add add esp, 20
    mov mov eax, 080004005h
    jmp sub_1006AC66
    mov mov ecx, dword ptr [ebp + 32]
    xor xor eax, eax
    push push edi
    mov mov edi, dword ptr [ebp + 28]
    mov mov dword ptr [edi], eax
    mov mov dword ptr [ecx], eax
    mov mov ecx, dword ptr [ebp + 36]
    mov mov dword ptr [ecx], eax
    mov mov dx, word ptr [ebx]
    mov mov ecx, 01010F000h
    cmp cmp dx, word ptr [ecx]
    jne L12
    mov mov eax, dword ptr [esi + 0B4h]
    cmp cmp eax, 10
    jl L5
    cmp cmp eax, 12
    jg L6
    lea lea eax, [ebp + 23]
    push push eax
    lea lea eax, [ebp + 27]
    push push eax
    lea lea eax, [ebx + 2]
    push push eax
    call sub_100688FE
    test test eax, eax
    jge L4
    push push ebx
    push push 01010F2F0h
    push push 07D5h
    push push dword ptr [ebp + 16]
    push push dword ptr [ebp + 8]
    call sub_10067CD3
    add add esp, 20
    mov mov eax, 080004005h
    jmp sub_1006ACD0
    cmp cmp byte ptr [ebp + 27], 5
    jne L8
    mov mov dword ptr [edi], 3
    jmp L9
    cmp cmp byte ptr [ebp + 27], 10
    jne L10
    mov mov dword ptr [edi], 1
    movzx movzx eax, byte ptr [ebp + 23]
    mov mov ecx, dword ptr [ebp + 36]
    mov mov dword ptr [ecx], eax
    jmp sub_1006ACF6
    push push ebx
    push push 01010F2BCh
    jmp L7
    mov mov dword ptr [edi], 1
    lea lea edi, [esi + 28]
    push push ebx
    mov mov ecx, edi
    call sub_10068CA9
L3:
    test test eax, eax
    je L15
    mov mov eax, dword ptr [eax + 4]
    mov mov ecx, dword ptr [ebp + 36]
    mov mov dword ptr [ecx], eax
    jmp L17
    lea lea eax, [ebp + 23]
    push push eax
    lea lea eax, [ebp + 31]
    push push eax
    lea lea eax, [ebx + 2]
    push push eax
    call sub_10068985
    test test eax, eax
    jl L11
    mov mov ecx, dword ptr [ebp + 36]
    add add esi, 09Ch
    mov mov eax, dword ptr [esi]
    push push 1
    mov mov dword ptr [ecx], eax
    push push dword ptr [esi]
    mov mov ecx, edi
    push push ebx
    call sub_1006A89A
    inc inc dword ptr [esi]
    cmp cmp dword ptr [ebp + 24], 0
    je sub_1006AD5B
    push push ebx
    push push 01010F27Ch
    jmp L13
    mov mov dx, word ptr [ebx]
    mov mov ecx, 01010EFFCh
    cmp cmp dx, word ptr [ecx]
    jne L20
    mov mov dword ptr [edi], eax
    lea lea edi, [esi + 84]
    push push ebx
    mov mov ecx, edi
    call sub_10068D1A
    test test eax, eax
    mov mov ecx, dword ptr [ebp + 36]
    je L19
    mov mov eax, dword ptr [eax + 4]
    mov mov dword ptr [ecx], eax
    jmp L21
    add add esi, 0A4h
    mov mov eax, dword ptr [esi]
    push push 1
L9:
    mov mov dword ptr [ecx], eax
    push push dword ptr [esi]
    mov mov ecx, edi
    push push ebx
    call L1
    inc inc dword ptr [esi]
    cmp cmp dword ptr [ebp + 24], 0
    je sub_1006ADB0
    push push ebx
    push push 01010F23Ch
    jmp L16
    mov mov dx, word ptr [ebx]
    mov mov ecx, 01010F238h
    cmp cmp dx, word ptr [ecx]
    mov mov eax, 01010F234h
    je sub_1006ACCF
    mov mov ecx, eax
    cmp cmp dx, word ptr [ecx]
    je sub_1006ACDA
    mov mov ecx, 01010F230h
    cmp cmp dx, word ptr [ecx]
    je sub_1006ACE8
    mov mov ecx, 01010F22Ch
    cmp cmp dx, word ptr [ecx]
L14:
    je sub_1006ACF6
    cmp cmp dword ptr [esi + 0B0h], 0
    je sub_1006ACF4
    mov mov eax, 01010EFF8h
    mov mov cx, dx
    cmp cmp cx, word ptr [eax]
    jne sub_1006AD01
    mov mov dword ptr [edi], 6
    lea lea edi, [esi + 56]
    push push ebx
    mov mov ecx, edi
    call sub_10068DB9
    test test eax, eax
    je sub_1006ACC6
    mov mov eax, dword ptr [eax + 4]
    mov mov ecx, dword ptr [ebp + 36]
    mov mov dword ptr [ecx], eax
    jmp sub_1006AD0B
    lea lea eax, [ebp + 23]
    push push eax
    lea lea eax, [ebp + 31]
    push push eax
    lea lea eax, [ebx + 2]
    push push eax
    call sub_10068A95
    test test eax, eax
L16:
    jge sub_1006AD05
L17:
    push push ebx
    push push 01010F204h
    jmp L18
    mov mov ecx, dword ptr [ebp + 36]
    add add esi, 0A0h
    mov mov eax, dword ptr [esi]
    push push 1
    mov mov dword ptr [ecx], eax
    push push dword ptr [esi]
    mov mov ecx, edi
    push push ebx
    call L3
    inc inc dword ptr [esi]
    cmp cmp dword ptr [ebp + 24], 0
    je sub_1006AE72
    push push ebx
    push push 01010F1C4h
    jmp L20
    push push ebx
    push push 01010F138h
    jmp L22
    mov mov cx, word ptr [ebx]
    cmp cmp cx, word ptr [eax]
    jne sub_1006ADA0
    mov mov dword ptr [edi], 14
    xor xor edi, edi
    jmp sub_1006ADE2
    mov mov cx, word ptr [ebx]
    mov mov eax, 01010F230h
    cmp cmp cx, word ptr [eax]
    jne sub_1006ADCF
    mov mov dword ptr [edi], 7
    xor xor edi, edi
    inc inc edi
    jmp sub_1006ADFA
    mov mov cx, word ptr [ebx]
    mov mov eax, 01010F22Ch
    cmp cmp cx, word ptr [eax]
    jne sub_1006ADFE
    mov mov dword ptr [edi], 10
    push push 2
    jmp sub_1006AE10
    mov mov dword ptr [edi], 2
    push push 3
    pop pop edi
L18:
    push push ebx
    mov mov ecx, esi
    call sub_10068E74
    test test eax, eax
    je sub_1006AE42
    mov mov edx, dword ptr [eax + 4]
    mov mov ecx, dword ptr [ebp + 36]
    mov mov dword ptr [ecx], edx
    mov mov eax, dword ptr [eax + 8]
L19:
    mov mov dword ptr [ebp + 32], eax
    jmp sub_1006AEBB
    mov mov ecx, dword ptr [ebp + 12]
    lea lea eax, [ebp + 32]
    push push eax
    push push ebx
    push push dword ptr [ebp + 16]
    call sub_100846B8
    test test eax, eax
    jl sub_1006AF08
    cmp cmp dword ptr [ebp + 32], 0
    jne sub_1006AEB0
    lea lea eax, [ebx + 2]
    push push eax
    push push ebx
    push push 01010F0F8h
    push push 07D5h
    push push dword ptr [ebp + 16]
    push push dword ptr [ebp + 8]
    call sub_10067F38
    add add esp, 24
    jmp sub_1006AC68
    push push dword ptr [ebp + 32]
    mov mov ecx, dword ptr [ebp + 36]
    lea lea edi, [esi + edi*4 + 08Ch]
    mov mov eax, dword ptr [edi]
    mov mov dword ptr [ecx], eax
    push push dword ptr [edi]
    mov mov ecx, esi
    push push ebx
    call L14
    mov mov eax, dword ptr [ebp + 32]
    add add dword ptr [edi], eax
    inc inc dword ptr [esi + 0ACh]
    mov mov ecx, dword ptr [ebp + 36]
    mov mov eax, dword ptr [ebp + 24]
    test test eax, eax
    je sub_1006AF5E
    mov mov eax, dword ptr [eax + 24]
    cmp cmp eax, dword ptr [ebp + 32]
    jbe sub_1006AF64
    push push eax
    push push dword ptr [ebp + 32]
    push push ebx
    push push 01010F0A8h
    push push 07D5h
    push push dword ptr [ebp + 16]
    push push dword ptr [ebp + 8]
    call sub_10067F92
    add add esp, 28
    jmp sub_1006ACC2
    add add dword ptr [ecx], eax
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    pop pop ebp
    ret ret 32
FUN_1006a8ce ENDP
END
