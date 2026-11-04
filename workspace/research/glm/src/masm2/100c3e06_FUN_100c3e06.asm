.686
.MODEL FLAT, C
EXTRN sub_10084257:PROC
EXTRN sub_100842CD:PROC
EXTRN sub_10084313:PROC
EXTRN sub_10084353:PROC
EXTRN sub_100C408E:PROC
EXTRN sub_100C4096:PROC
EXTRN sub_100C409E:PROC
EXTRN sub_100C40A6:PROC
EXTRN sub_100C40AE:PROC
EXTRN sub_100C40C3:PROC
EXTRN sub_100C40CC:PROC
EXTRN sub_100C4169:PROC
EXTRN sub_100C41AC:PROC
EXTRN sub_100C41FB:PROC
EXTRN sub_100C4203:PROC
EXTRN sub_100C424A:PROC
EXTRN sub_100C425C:PROC
EXTRN sub_100C4272:PROC
EXTRN sub_100C42B3:PROC
EXTRN sub_100C42CF:PROC
EXTRN sub_100C42DD:PROC
EXTRN sub_100C42EA:PROC
EXTRN sub_100C4300:PROC
EXTRN sub_100F7A2E:PROC
EXTRN sub_100F7AA7:PROC
EXTRN sub_100F7AB8:PROC
EXTRN sub_100F7AC6:PROC
.CODE
FUN_100c3e06 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 16
    push push ebx
    xor xor ebx, ebx
    cmp cmp dword ptr [ebp + 24], ebx
    je L1
    mov mov ecx, dword ptr [ebp + 16]
    push push esi
    mov mov esi, dword ptr [ebp + 12]
    push push edi
    mov mov eax, dword ptr [esi + 4]
    dec dec eax
    je L12
    sub sub eax, 7
    jne L2
    mov mov eax, dword ptr [esi + 20]
    mov mov esi, dword ptr [esi + 16]
    imul imul ecx, eax
    jmp L0
    dec dec eax
    je L3
    mov mov eax, 080004005h
    jmp sub_100C40C3
    xor xor eax, eax
    jmp sub_100C40CC
    xor xor eax, eax
    lea lea edi, [ebp - 16]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
L1:
    mov mov eax, dword ptr [esi + 16]
    sub sub eax, ebx
    push push 2
    pop pop edi
    je L6
L2:
    dec dec eax
    je L5
    dec dec eax
    je L4
    dec dec eax
    jne L7
    mov mov word ptr [ebp - 16], 4
    jmp L8
    mov mov eax, dword ptr [esi + 32]
    shr shr eax, 10
    not not al
    and and eax, 1
    or or eax, edi
    mov mov word ptr [ebp - 16], ax
L3:
    jmp L9
    mov mov word ptr [ebp - 16], 1
    jmp L10
    mov mov word ptr [ebp - 16], bx
    mov mov eax, dword ptr [esi + 20]
    cmp cmp eax, 28
    ja L13
    jmp jmp dword ptr [eax*4 + 0100C408Bh]
    mov mov word ptr [ebp - 14], 1
    jmp L14
    mov mov word ptr [ebp - 14], 3
    jmp L16
    mov mov word ptr [ebp - 14], di
    jmp L18
    mov mov word ptr [ebp - 14], 4
    jmp L19
    mov mov word ptr [ebp - 14], 5
    jmp L20
    mov mov word ptr [ebp - 14], 6
    jmp L21
L5:
    mov mov word ptr [ebp - 14], 7
    jmp L22
    mov mov word ptr [ebp - 14], 8
    jmp L23
    mov mov word ptr [ebp - 14], 9
    jmp L24
    mov mov eax, dword ptr [ebp + 20]
    test test eax, 0200000h
    je L15
    mov mov word ptr [ebp - 14], 12
    jmp L25
    test test eax, 0400000h
    je L19
    mov mov word ptr [ebp - 14], 13
    jmp L26
    shr shr eax, 22
    and and ax, di
    or or ax, 12
    mov mov word ptr [ebp - 14], ax
    jmp L27
    mov mov word ptr [ebp - 14], 11
    jmp L28
    mov mov word ptr [ebp - 14], 14
    jmp sub_100C408E
    mov mov word ptr [ebp - 14], 15
    jmp sub_100C4096
    mov mov word ptr [ebp - 14], 16
    jmp sub_100C409E
    mov mov word ptr [ebp - 14], 17
    jmp sub_100C40A6
    mov mov word ptr [ebp - 14], 18
    jmp sub_100C40AE
    mov mov word ptr [ebp - 14], bx
    mov mov ax, word ptr [esi + 24]
    push push dword ptr [ebp + 24]
    mov mov word ptr [ebp - 12], ax
    mov mov ax, word ptr [esi + 28]
    push push edi
    mov mov word ptr [ebp - 10], ax
    push push 16
    lea lea eax, [ebp - 16]
    mov mov word ptr [ebp - 8], cx
    mov mov ecx, dword ptr [ebp + 8]
    push push eax
    call sub_10084257
    cmp cmp eax, ebx
    jmp sub_100C4203
    xor xor eax, eax
    lea lea edi, [ebp - 16]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    push push esi
    mov mov word ptr [ebp - 16], 5
    mov mov word ptr [ebp - 14], bx
    mov mov word ptr [ebp - 12], 1
    call L11
    mov mov word ptr [ebp - 10], ax
    mov mov word ptr [ebp - 8], cx
    mov mov eax, esi
    inc inc word ptr [ebp - 6]
    mov mov eax, dword ptr [eax + 12]
    cmp cmp eax, ebx
    jne sub_100C4169
    movzx movzx eax, word ptr [ebp - 6]
    shl shl eax, 3
    push push eax
    call sub_100F7A2E
    mov mov ebx, eax
    test test ebx, ebx
    pop pop ecx
    mov mov dword ptr [ebp + 16], ebx
    jne sub_100C41AC
    mov mov eax, 08007000Eh
    jmp sub_100C425C
    mov mov eax, dword ptr [esi + 8]
    mov mov edi, dword ptr [eax + 24]
    mov mov eax, dword ptr [eax + 20]
    mov mov eax, dword ptr [eax + 24]
    mov mov ecx, dword ptr [ebp + 8]
L13:
    push push ebx
    push push 7
    push push -1
    push push eax
    call sub_100842CD
    test test eax, eax
    mov mov dword ptr [ebp + 12], eax
    jl sub_100C424A
    lea lea eax, [ebx + 4]
    push push eax
L14:
    push push dword ptr [ebp + 20]
    push push 1
    push push dword ptr [edi + 32]
    push push dword ptr [ebp + 8]
L16:
    call L17
L17:
    mov mov edi, eax
    test test edi, edi
L18:
    jl sub_100C4272
    mov mov esi, dword ptr [esi + 12]
    add add ebx, 8
    test test esi, esi
    jne sub_100C41FB
    mov mov ecx, dword ptr [ebp + 8]
    lea lea eax, [ebp - 4]
    push push eax
    movzx movzx eax, word ptr [ebp - 6]
    push push 2
    pop pop edi
    push push edi
    shl shl eax, 3
L21:
    push push eax
    push push dword ptr [ebp + 16]
    call sub_10084313
    push push dword ptr [ebp + 16]
    mov mov esi, eax
    call sub_100F7AA7
    test test esi, esi
    pop pop ecx
    jge sub_100C42B3
L24:
    mov mov eax, esi
    jmp sub_100C42CF
    push push dword ptr [ebp + 16]
    call sub_100F7AB8
    mov mov eax, dword ptr [ebp + 12]
    pop pop ecx
    jmp sub_100C42DD
L25:
    push push dword ptr [ebp + 16]
    call sub_100F7AC6
    pop pop ecx
    mov mov eax, edi
    jmp sub_100C42EA
    push push dword ptr [ebp + 24]
    mov mov ecx, dword ptr [ebp + 8]
    push push edi
    push push 16
    lea lea eax, [ebp - 16]
    push push eax
    call sub_10084353
L27:
    test test eax, eax
    jl sub_100C4300
    xor xor eax, eax
    pop pop edi
    pop pop esi
L28:
    pop pop ebx
    leave leave
    ret ret 20
FUN_100c3e06 ENDP
END
