.686
.MODEL FLAT, C
EXTRN sub_100F8536:PROC
EXTRN sub_100F8561:PROC
EXTRN sub_100F8567:PROC
EXTRN sub_100F867D:PROC
EXTRN sub_100F8685:PROC
EXTRN sub_100FC4BA:PROC
EXTRN sub_100FC4E5:PROC
EXTRN sub_100FD80C:PROC
EXTRN sub_100FFF41:PROC
EXTRN sub_101085D5:PROC
EXTRN sub_101085E5:PROC
EXTRN sub_101085F5:PROC
EXTRN sub_10108605:PROC
EXTRN sub_10108618:PROC
EXTRN sub_10108628:PROC
EXTRN sub_10108638:PROC
EXTRN sub_10108648:PROC
EXTRN sub_1010865B:PROC
EXTRN sub_1010866B:PROC
EXTRN sub_1010867B:PROC
EXTRN sub_1010868B:PROC
EXTRN sub_1010869E:PROC
EXTRN sub_101086AE:PROC
EXTRN sub_101086BE:PROC
EXTRN g_101A50CC:DWORD
EXTRN g_101AE168:DWORD
EXTRN g_101AE19C:DWORD
EXTRN g_101AE1A0:DWORD
EXTRN g_101AE1C8:DWORD
EXTRN g_1076AC88:DWORD
EXTRN g_1076AC8C:DWORD
.CODE
___init_monetary PROC
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    push esi
    xor esi, esi
    cmp dword ptr [g_101AE19C], esi
    push edi
    jne L0
    cmp dword ptr [g_101AE1A0], esi
    jne L0
    mov dword ptr [g_1076AC88], esi
    mov dword ptr [g_1076AC8C], esi
    mov dword ptr [g_101A50CC], 0101A509Ch
    mov dword ptr [g_101AE168], esi
    jmp L13
L0:
    push 48
    push 1
    call sub_100FD80C
    mov ebx, eax
    cmp ebx, esi
    pop ecx
    pop ecx
    je L4
    push 4
    call sub_100FC4BA
    mov edi, eax
    cmp edi, esi
    pop ecx
    mov dword ptr [ebp - 4], edi
    jne L2
    push ebx
    call sub_100F8536
L1:
    pop ecx
    jmp L4
L2:
    mov dword ptr [edi], esi
    cmp dword ptr [g_101AE19C], esi
    je L11
    push 4
    call sub_100FC4E5
    cmp eax, esi
    pop ecx
    mov dword ptr [g_1076AC88], eax
    jne L3
    push ebx
    call sub_100F8561
    push edi
    call sub_100F8567
    pop ecx
    jmp L1
L3:
    mov dword ptr [eax], esi
    movzx esi, word ptr [g_101AE1C8]
    lea eax, [ebx + 12]
    push eax
    push 21
    push esi
    push 1
    call sub_101085D5
    mov edi, eax
    lea eax, [ebx + 16]
    push eax
    push 20
    push esi
    push 1
    call sub_101085E5
    or edi, eax
    lea eax, [ebx + 20]
    push eax
    push 22
    push esi
    push 1
    call sub_101085F5
    or edi, eax
    lea eax, [ebx + 24]
    push eax
    push 23
    push esi
    push 1
    call sub_10108605
    add esp, 64
    or edi, eax
    lea eax, [ebx + 28]
    push eax
    push 24
    push esi
    push 1
    call sub_10108618
    or edi, eax
    lea eax, [ebx + 32]
    push eax
    push 80
    push esi
    push 1
    call sub_10108628
    or edi, eax
    lea eax, [ebx + 36]
    push eax
    push 81
    push esi
    push 1
    call sub_10108638
    or edi, eax
    lea eax, [ebx + 40]
    push eax
    push 26
    push esi
    push 0
    call sub_10108648
    add esp, 64
    or edi, eax
    lea eax, [ebx + 41]
    push eax
    push 25
    push esi
    push 0
    call sub_1010865B
    or edi, eax
    lea eax, [ebx + 42]
    push eax
    push 84
    push esi
    push 0
    call sub_1010866B
    or edi, eax
    lea eax, [ebx + 43]
    push eax
    push 85
    push esi
    push 0
    call sub_1010867B
    or edi, eax
    lea eax, [ebx + 44]
    push eax
    push 86
    push esi
    push 0
    call sub_1010868B
    add esp, 64
    or edi, eax
    lea eax, [ebx + 45]
    push eax
    push 87
    push esi
    push 0
    call sub_1010869E
    or edi, eax
    lea eax, [ebx + 46]
    push eax
    push 82
    push esi
    push 0
    call sub_101086AE
    or edi, eax
    lea eax, [ebx + 47]
    push eax
    push 83
    push esi
    push 0
    call sub_101086BE
    add esp, 48
    or eax, edi
    je L5
    push ebx
    call sub_100FFF41
    push ebx
    call sub_100F867D
    push dword ptr [ebp - 4]
    call sub_100F8685
    add esp, 12
L4:
    xor eax, eax
    inc eax
    jmp L14
L5:
    mov eax, dword ptr [ebx + 28]
    jmp L8
L6:
    mov cl, byte ptr [eax]
    cmp cl, 48
    jl L9
    cmp cl, 57
    jg L9
    sub cl, 48
    mov byte ptr [eax], cl
L7:
    inc eax
L8:
    cmp byte ptr [eax], 0
    jne L6
    jmp L12
L9:
    cmp cl, 59
    jne L7
    mov esi, eax
L10:
    lea edi, [esi + 1]
    mov cl, byte ptr [edi]
    mov byte ptr [esi], cl
    mov esi, edi
    cmp byte ptr [esi], 0
    jne L10
    jmp L8
L11:
    push 12
    pop ecx
    mov esi, 0101A509Ch
    mov edi, ebx
    rep movsd dword ptr es:[edi], dword ptr [esi]
    and dword ptr [g_1076AC88], 0
L12:
    mov eax, dword ptr [g_101A50CC]
    mov eax, dword ptr [eax]
    mov dword ptr [ebx], eax
    mov eax, dword ptr [g_101A50CC]
    mov eax, dword ptr [eax + 4]
    mov dword ptr [ebx + 4], eax
    mov eax, dword ptr [g_101A50CC]
    mov eax, dword ptr [eax + 8]
    mov dword ptr [ebx + 8], eax
    mov eax, dword ptr [ebp - 4]
    mov dword ptr [g_101A50CC], ebx
    mov dword ptr [g_1076AC8C], eax
    mov dword ptr [g_101AE168], ebx
L13:
    xor eax, eax
L14:
    pop edi
    pop esi
    pop ebx
    leave
    ret
___init_monetary ENDP
END
