.686
.MODEL FLAT, C
EXTRN sub_1006520E:PROC
EXTRN sub_10065238:PROC
EXTRN sub_1006535A:PROC
EXTRN sub_100653CC:PROC
EXTRN sub_10082A24:PROC
EXTRN sub_10082A4E:PROC
EXTRN sub_10082BE2:PROC
EXTRN sub_1008355E:PROC
EXTRN sub_100995F3:PROC
EXTRN sub_100998E3:PROC
EXTRN sub_10099C76:PROC
EXTRN sub_1009A7EA:PROC
EXTRN sub_1009A8FF:PROC
EXTRN sub_1009AD65:PROC
EXTRN sub_1009ADB8:PROC
EXTRN sub_1009B869:PROC
EXTRN sub_1009B8B0:PROC
EXTRN sub_1009BCBB:PROC
EXTRN sub_1009E16B:PROC
EXTRN sub_1009E1C2:PROC
EXTRN sub_1009EA1B:PROC
EXTRN sub_1009EAD8:PROC
EXTRN sub_1009EB38:PROC
EXTRN sub_100A0A65:PROC
EXTRN sub_100A1097:PROC
.CODE
FUN_100a1bf8 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 48
    mov eax, dword ptr [ebp + 8]
    push edi
    xor edi, edi
    cmp eax, edi
    mov dword ptr [ebp - 4], ecx
    mov dword ptr [ebp - 16], edi
    mov dword ptr [ebp - 24], edi
    mov dword ptr [ebp - 20], edi
    mov dword ptr [ebp - 40], edi
    mov dword ptr [ebp - 44], edi
    je L43
    cmp dword ptr [eax + 4], 3
    jne L43
    push ebx
    lea ebx, [eax + 16]
    mov eax, dword ptr [ecx + 24]
    cmp eax, edi
    push esi
    mov dword ptr [ebp - 8], ebx
    je L0
    mov eax, dword ptr [eax + 28]
    jmp L1
L0:
    xor eax, eax
L1:
    cmp dword ptr [ebp + 16], edi
    push 6
    pop ecx
    je L2
    push 22
    pop ecx
L2:
    lea edx, [ebp - 20]
    push edx
    lea edx, [ebp - 16]
    push edx
    push ecx
    mov ecx, dword ptr [ebp - 4]
    push dword ptr [ecx + 16]
    xor esi, esi
    push dword ptr [ebp + 12]
    push eax
    push ebx
    push 2
    call sub_1009E16B
    cmp eax, edi
    jl L41
    jne L3
    inc esi
L3:
    cmp dword ptr [ebp + 16], edi
    jne L4
    cmp esi, edi
    jne L10
    mov ecx, dword ptr [ebp - 4]
    lea eax, [ebp - 20]
    push eax
    lea eax, [ebp - 24]
    push eax
    push dword ptr [ebp + 12]
    push ebx
    call sub_1009AD65
    cmp eax, edi
    jl L41
    jne L5
    xor esi, esi
    inc esi
L4:
    cmp esi, edi
    jne L6
L5:
    mov ecx, dword ptr [ebp - 4]
    lea eax, [ebp - 20]
    push eax
    lea eax, [ebp - 16]
    push eax
    push 2
    push dword ptr [ecx + 16]
    push edi
    push edi
    push ebx
    push 2
    call sub_1009E1C2
    cmp eax, edi
    jl L41
    jne L6
    xor esi, esi
    inc esi
L6:
    cmp dword ptr [ebp + 16], edi
    jne L7
    cmp esi, edi
    jne L9
    mov ecx, dword ptr [ebp - 4]
    lea eax, [ebp - 20]
    push eax
    lea eax, [ebp - 24]
    push eax
    push edi
    push ebx
    call sub_1009ADB8
    cmp eax, edi
    jl L41
    jne L8
    xor esi, esi
    inc esi
L7:
    cmp esi, edi
    jne L9
L8:
    push dword ptr [ebx + 8]
    push 010114BB8h
    push 000000BBCh
    push ebx
    push dword ptr [ebp - 4]
    call sub_100995F3
    add esp, 20
    jmp L41
L9:
    mov eax, dword ptr [ebp - 24]
    cmp eax, edi
    je L10
    mov dword ptr [ebp - 16], eax
L10:
    mov esi, dword ptr [ebp + 12]
    lea eax, [ebp - 40]
    mov dword ptr [ebp - 28], eax
    lea eax, [ebp - 44]
    mov dword ptr [ebp - 32], eax
    mov eax, dword ptr [ebp - 16]
    mov eax, dword ptr [eax + 36]
    jmp L24
L11:
    mov eax, dword ptr [ebp - 12]
    mov ecx, dword ptr [eax + 8]
    mov eax, dword ptr [eax + 12]
    xor edx, edx
    cmp eax, edi
    mov dword ptr [ebp - 48], ecx
    je L12
    mov ebx, dword ptr [eax + 8]
    cmp dword ptr [ebx + 4], 12
    mov ebx, dword ptr [ebp - 8]
    jne L12
    inc edx
    mov dword ptr [ebp - 12], eax
L12:
    cmp dword ptr [ebp + 16], edi
    je L13
    mov eax, dword ptr [ecx + 24]
    test byte ptr [eax + 28], 64
    je L23
L13:
    cmp esi, edi
    je L22
    mov eax, dword ptr [ecx + 24]
    mov ebx, dword ptr [eax + 32]
    mov dword ptr [ebp - 36], eax
    mov eax, dword ptr [esi + 8]
    cmp eax, edi
    je L14
    mov eax, dword ptr [eax + 16]
    mov dword ptr [ebp + 8], eax
    jmp L15
L14:
    mov dword ptr [ebp + 8], edi
L15:
    push 20
    call sub_1006520E
    cmp eax, edi
    je L16
    push 010115894h
    push edi
    push edi
    mov ecx, eax
    call sub_10082A24
    jmp L17
L16:
    xor eax, eax
L17:
    cmp eax, edi
    mov ecx, dword ptr [ebp - 28]
    mov dword ptr [ecx], eax
    je L41
    push 20
    call sub_10065238
    cmp eax, edi
    je L18
    push 01011588Ch
    push edi
    push edi
    mov ecx, eax
    call sub_10082A4E
    jmp L19
L18:
    xor eax, eax
L19:
    cmp eax, edi
    mov ecx, dword ptr [ebp - 32]
    mov dword ptr [ecx], eax
    je L41
    mov eax, dword ptr [ebp - 36]
    test byte ptr [eax + 28], 16
    je L20
    mov ecx, dword ptr [ebp - 4]
    push edi
    push dword ptr [ebp + 8]
    push ebx
    call sub_1009B869
    test eax, eax
    mov ecx, dword ptr [ebp - 4]
    push edi
    je L26
    push edi
    push dword ptr [esi + 8]
    push ebx
    call sub_1009EAD8
    mov ecx, dword ptr [ebp - 28]
    mov ecx, dword ptr [ecx]
    mov dword ptr [ecx + 8], eax
L20:
    mov eax, dword ptr [ebp - 36]
    test byte ptr [eax + 28], 32
    je L21
    push dword ptr [ebp + 8]
    mov ecx, dword ptr [ebp - 4]
    call sub_10099C76
    test eax, eax
    jne L28
    mov ecx, dword ptr [ebp - 4]
    push edi
    push ebx
    push dword ptr [ebp + 8]
    call sub_1009B8B0
    test eax, eax
    je L28
    push dword ptr [ebp - 36]
    mov eax, dword ptr [ebp - 48]
    push dword ptr [eax + 20]
    mov ecx, dword ptr [ebp - 4]
    call sub_1009EA1B
    cmp eax, edi
    je L41
    mov ecx, dword ptr [ebp - 4]
    push edi
    push edi
    push eax
    push dword ptr [ebp + 8]
    call sub_1009EB38
    cmp eax, edi
    je L41
    mov ecx, dword ptr [ebp - 4]
    push 1
    push eax
    push dword ptr [esi + 8]
    push 21
    call sub_100A1097
    cmp eax, edi
    je L41
    mov ecx, dword ptr [ebp - 32]
    mov ecx, dword ptr [ecx]
    mov dword ptr [ecx + 8], eax
L21:
    mov eax, dword ptr [ebp - 28]
    mov eax, dword ptr [eax]
    mov esi, dword ptr [esi + 12]
    mov ebx, dword ptr [ebp - 8]
    add eax, 12
    mov dword ptr [ebp - 28], eax
    mov eax, dword ptr [ebp - 32]
    mov eax, dword ptr [eax]
    add eax, 12
    mov dword ptr [ebp - 32], eax
    jmp L23
L22:
    cmp edx, edi
    je L25
L23:
    mov eax, dword ptr [ebp - 12]
    mov eax, dword ptr [eax + 12]
L24:
    cmp eax, edi
    mov dword ptr [ebp - 12], eax
    jne L11
    cmp esi, edi
    jne L34
L25:
    cmp dword ptr [ebp - 12], edi
    jne L34
    push 80
    call sub_1006535A
    cmp eax, edi
    je L29
    xor ecx, ecx
    cmp dword ptr [ebp - 24], edi
    push ebx
    setne cl
    push 1
    push edi
    push edi
    add ecx, 25
    push ecx
    push edi
    mov ecx, eax
    call sub_1008355E
    mov esi, eax
    jmp L30
L26:
    push dword ptr [ebp + 8]
    push ebx
L27:
    mov eax, dword ptr [ebp - 8]
    push dword ptr [eax + 8]
    push eax
    call sub_1009BCBB
    jmp L41
L28:
    mov ecx, dword ptr [ebp - 4]
    push edi
    push ebx
    push dword ptr [ebp + 8]
    jmp L27
L29:
    xor esi, esi
L30:
    cmp esi, edi
    je L41
    mov eax, dword ptr [ebp - 16]
    cmp dword ptr [eax + 32], edi
    je L31
    mov ecx, dword ptr [eax + 32]
    mov eax, dword ptr [ecx]
    call dword ptr [eax + 4]
    cmp eax, edi
    mov dword ptr [esi + 16], eax
    je L41
L31:
    mov eax, dword ptr [ebp - 20]
    push 20
    mov dword ptr [esi + 32], eax
    call sub_100653CC
    cmp eax, edi
    je L32
    push 010115880h
    push edi
    push edi
    mov ecx, eax
    call sub_10082BE2
    jmp L33
L32:
    xor eax, eax
L33:
    cmp eax, edi
    mov dword ptr [esi + 36], eax
    je L41
    mov ecx, dword ptr [ebp - 40]
    mov dword ptr [eax + 8], ecx
    mov eax, dword ptr [esi + 36]
    mov ecx, dword ptr [ebp - 44]
    mov dword ptr [eax + 12], ecx
    mov ecx, dword ptr [ebp - 4]
    push esi
    call sub_1009A8FF
    mov ecx, dword ptr [ebp - 4]
    push esi
    call sub_1009A7EA
    test eax, eax
    je L42
    mov ecx, dword ptr [ebp - 4]
    push esi
    call sub_100A0A65
    cmp eax, edi
    je L42
    mov esi, eax
    jmp L42
L34:
    mov eax, dword ptr [ebp + 12]
    xor ecx, ecx
    jmp L36
L35:
    mov eax, dword ptr [eax + 12]
    inc ecx
L36:
    cmp eax, edi
    jne L35
    cmp dword ptr [ebp - 24], edi
    mov eax, 01010E8DCh
    jne L38
    cmp ecx, 1
    jne L37
    mov eax, 01019166Eh
L37:
    push eax
    push ecx
    push dword ptr [ebx + 8]
    push 010115854h
    jmp L40
L38:
    cmp ecx, 1
    jne L39
    mov eax, 01019166Eh
L39:
    push eax
    push ecx
    push dword ptr [ebx + 8]
    push 01011581Ch
L40:
    push 000000BC5h
    push ebx
    push dword ptr [ebp - 4]
    call sub_100998E3
    add esp, 28
L41:
    xor esi, esi
L42:
    mov eax, esi
    pop esi
    pop ebx
    jmp L44
L43:
    xor eax, eax
L44:
    pop edi
    leave
    ret 12
FUN_100a1bf8 ENDP
END
