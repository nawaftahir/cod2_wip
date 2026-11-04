.686
.MODEL FLAT, C
EXTRN sub_100650C9:PROC
EXTRN sub_100832CA:PROC
EXTRN sub_100998E8:PROC
EXTRN sub_10099BF6:PROC
EXTRN sub_10099C37:PROC
EXTRN sub_10099C5A:PROC
EXTRN sub_10099CC3:PROC
EXTRN sub_10099F51:PROC
EXTRN sub_10099F89:PROC
EXTRN sub_1009A598:PROC
EXTRN sub_1009A82B:PROC
EXTRN sub_1009A940:PROC
EXTRN sub_1009B98F:PROC
EXTRN sub_1009BCDC:PROC
EXTRN sub_1009BF87:PROC
EXTRN sub_1009BFA9:PROC
EXTRN sub_1009EC45:PROC
EXTRN sub_1009EC7D:PROC
EXTRN sub_100A0AA6:PROC
.CODE
FUN_100a0e06 PROC
L0:
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 20
    push ebx
    mov ebx, dword ptr [ebp + 12]
    push esi
    xor esi, esi
    cmp ebx, esi
    mov dword ptr [ebp - 4], ecx
    mov dword ptr [ebp - 16], esi
    mov dword ptr [ebp - 20], esi
    mov dword ptr [ebp - 8], esi
    mov dword ptr [ebp - 12], esi
    je L1
    cmp dword ptr [ebx + 4], 13
    jne L2
L1:
    mov eax, dword ptr [ebp + 16]
    cmp eax, esi
    je L5
    cmp dword ptr [eax + 4], 13
    je L3
L2:
    xor eax, eax
    jmp L51
L3:
    add eax, 48
L4:
    mov dword ptr [ebp + 12], eax
    jmp L7
L5:
    cmp ebx, esi
    je L6
    lea eax, [ebx + 48]
    jmp L4
L6:
    add ecx, 32
    mov dword ptr [ebp + 12], ecx
L7:
    push edi
    push 80
    call sub_100650C9
    cmp eax, esi
    mov edi, dword ptr [ebp + 8]
    je L8
    push dword ptr [ebp + 12]
    xor ecx, ecx
    push dword ptr [ebp + 20]
    push ecx
    push ecx
    push edi
    push ecx
    mov ecx, eax
    call sub_100832CA
    mov esi, eax
    jmp L9
L8:
    xor esi, esi
L9:
    test esi, esi
    jne L10
    xor eax, eax
    jmp L50
L10:
    test ebx, ebx
    je L11
    mov eax, dword ptr [ebx]
    mov ecx, ebx
    call dword ptr [eax + 4]
    test eax, eax
    mov dword ptr [esi + 32], eax
    je L48
L11:
    cmp edi, 28
    push 21
    pop ecx
    je L12
    cmp edi, 29
    je L12
    cmp edi, 30
    je L12
    cmp edi, 31
    je L12
    cmp edi, 32
    je L12
    cmp edi, 33
    je L12
    cmp edi, 34
    je L12
    cmp dword ptr [ebp + 16], 0
    je L23
    mov ecx, dword ptr [ebp + 16]
    mov eax, dword ptr [ecx]
    call dword ptr [eax + 4]
    test eax, eax
    mov dword ptr [esi + 36], eax
    jne L23
    jmp L48
L12:
    mov eax, edi
    sub eax, 28
    je L18
    dec eax
    je L17
    dec eax
    je L16
    dec eax
    je L15
    dec eax
    je L14
    dec eax
    je L13
    dec eax
    jne L21
    xor edi, edi
    inc edi
    push 3
    jmp L20
L13:
    xor edi, edi
    inc edi
    push 2
    jmp L20
L14:
    push 11
    jmp L19
L15:
    push 10
    jmp L19
L16:
    push 9
    jmp L19
L17:
    push 8
    jmp L19
L18:
    push 7
L19:
    mov edi, ecx
L20:
    pop eax
    jmp L22
L21:
    mov eax, dword ptr [ebp + 16]
L22:
    mov ecx, dword ptr [ebp - 4]
    push 0
    push dword ptr [ebp + 16]
    push ebx
    push eax
    call L0
    test eax, eax
    mov dword ptr [esi + 36], eax
    je L48
    mov dword ptr [esi + 28], edi
L23:
    mov eax, dword ptr [esi + 32]
    test eax, eax
    je L24
    mov eax, dword ptr [eax + 16]
    mov dword ptr [ebp - 16], eax
    mov dword ptr [ebp - 20], eax
    jmp L25
L24:
    mov eax, dword ptr [ebp - 16]
L25:
    test edi, edi
    je L27
    cmp edi, 1
    je L27
    cmp edi, 20
    je L27
    cmp edi, 21
    je L27
    cmp edi, 16
    je L27
    cmp edi, 17
    je L27
    test eax, eax
    je L26
    mov eax, dword ptr [ebp - 16]
    cmp dword ptr [eax + 4], 9
    jne L26
    mov ecx, dword ptr [ebp - 4]
    push eax
    call sub_10099C5A
    test eax, eax
    jne L27
L26:
    push 01011536Ch
    push 000000BCEh
    jmp L47
L27:
    cmp edi, 2
    je L28
    cmp edi, 3
    je L28
    cmp edi, 20
    je L28
    cmp edi, 21
    jne L30
L28:
    mov ebx, dword ptr [ebp - 16]
    mov ecx, dword ptr [ebp - 4]
    push ebx
    call sub_10099BF6
    test eax, eax
    jne L46
    mov edx, dword ptr [ebp - 4]
    push dword ptr [esi + 32]
    mov ecx, edx
    call sub_1009A598
    test eax, eax
    jne L46
    mov eax, dword ptr [edx + 16]
    mov eax, dword ptr [eax + 16]
    cmp eax, 3
    je L29
    cmp eax, 4
    jne L31
L29:
    mov ecx, dword ptr [ebp - 4]
    push ebx
    call sub_10099CC3
    test eax, eax
    jne L31
    push 010115338h
    push 000000BF9h
    jmp L47
L30:
    mov ebx, dword ptr [ebp - 16]
L31:
    mov eax, dword ptr [esi + 36]
    test eax, eax
    je L32
    mov eax, dword ptr [eax + 16]
    mov dword ptr [ebp - 8], eax
    mov dword ptr [ebp - 12], eax
L32:
    cmp edi, 20
    je L39
    cmp edi, 21
    je L39
    test edi, edi
    jne L33
    test ebx, ebx
    je L42
    mov eax, dword ptr [ebx]
    mov ecx, ebx
    call dword ptr [eax + 4]
    test eax, eax
    mov dword ptr [esi + 16], eax
    je L48
    jmp L42
L33:
    cmp edi, 4
    je L37
    cmp edi, 5
    je L37
    cmp edi, 6
    je L37
    cmp edi, 2
    je L37
    cmp edi, 3
    je L37
    cmp edi, 1
    je L37
    cmp edi, 12
    je L34
    cmp edi, 13
    je L34
    cmp edi, 14
    je L34
    cmp edi, 15
    je L34
    cmp edi, 16
    je L34
    cmp edi, 17
    je L34
    cmp edi, 18
    je L34
    cmp edi, 19
    je L34
    mov ecx, dword ptr [ebp - 4]
    lea eax, [esi + 16]
    push eax
    lea eax, [ebp - 12]
    push eax
    lea eax, [ebp - 20]
    push eax
    push dword ptr [ebp - 8]
    push ebx
    call sub_1009BF87
    test eax, eax
    jge L42
    jmp L35
L34:
    mov ecx, dword ptr [ebp - 4]
    lea edi, [esi + 16]
    push edi
    lea eax, [ebp - 12]
    push eax
    lea eax, [ebp - 20]
    push eax
    push dword ptr [ebp - 8]
    push ebx
    call sub_1009BFA9
    test eax, eax
    jge L36
L35:
    push 010115328h
    push 000000BCCh
    jmp L47
L36:
    mov eax, dword ptr [edi]
    and dword ptr [eax + 20], 0
    jmp L42
L37:
    test ebx, ebx
    je L38
    mov eax, dword ptr [ebx]
    mov ecx, ebx
    call dword ptr [eax + 4]
    test eax, eax
    mov dword ptr [esi + 16], eax
    je L48
L38:
    mov ecx, dword ptr [ebp - 4]
    push 1
    push dword ptr [esi + 16]
    call sub_10099C37
    jmp L42
L39:
    mov ecx, dword ptr [ebp - 4]
    xor edi, edi
    push edi
    push dword ptr [ebp - 8]
    push ebx
    call sub_1009B98F
    test eax, eax
    jne L40
    mov ecx, dword ptr [ebp - 4]
    push edi
    push dword ptr [ebp - 8]
    push ebx
    push edi
    push dword ptr [ebp + 12]
    call sub_1009BCDC
    jmp L48
L40:
    cmp ebx, edi
    je L41
    mov eax, dword ptr [ebx]
    mov ecx, ebx
    call dword ptr [eax + 4]
    cmp eax, edi
    mov dword ptr [esi + 16], eax
    je L48
L41:
    mov dword ptr [ebp - 12], ebx
L42:
    mov edx, dword ptr [esi + 32]
    test edx, edx
    je L43
    cmp ebx, dword ptr [ebp - 20]
    je L43
    push dword ptr [ebp - 20]
    mov ecx, dword ptr [ebp - 4]
    push ebx
    call sub_10099F51
    test eax, eax
    jne L43
    mov ecx, dword ptr [ebp - 4]
    push eax
    push eax
    push edx
    push dword ptr [ebp - 20]
    call sub_1009EC45
    test eax, eax
    je L48
    mov dword ptr [esi + 32], eax
L43:
    mov edx, dword ptr [esi + 36]
    test edx, edx
    je L44
    mov eax, dword ptr [ebp - 12]
    cmp dword ptr [ebp - 8], eax
    je L44
    mov ecx, dword ptr [ebp - 4]
    push eax
    push dword ptr [ebp - 8]
    call sub_10099F89
    test eax, eax
    jne L44
    mov ecx, dword ptr [ebp - 4]
    push eax
    push eax
    push edx
    push dword ptr [ebp - 12]
    call sub_1009EC7D
    test eax, eax
    je L48
    mov dword ptr [esi + 36], eax
L44:
    cmp dword ptr [esi + 16], 0
    jne L45
    and dword ptr [esi + 16], 0
L45:
    mov ecx, dword ptr [ebp - 4]
    push esi
    call sub_1009A940
    mov ecx, dword ptr [ebp - 4]
    push esi
    call sub_1009A82B
    test eax, eax
    je L49
    mov ecx, dword ptr [ebp - 4]
    push esi
    call sub_100A0AA6
    test eax, eax
    je L49
    mov esi, eax
    jmp L49
L46:
    push 010115308h
    push 000000BD1h
L47:
    push dword ptr [ebp + 12]
    push dword ptr [ebp - 4]
    call sub_100998E8
    add esp, 16
L48:
    xor esi, esi
L49:
    mov eax, esi
L50:
    pop edi
L51:
    pop esi
    pop ebx
    leave
    ret 16
FUN_100a0e06 ENDP
END
