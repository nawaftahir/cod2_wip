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
EXTRN sub_101000DF:PROC
EXTRN sub_101000E5:PROC
EXTRN sub_101001D1:PROC
EXTRN sub_10100209:PROC
EXTRN sub_1010020E:PROC
EXTRN sub_10100217:PROC
EXTRN sub_1010021C:PROC
EXTRN sub_10100226:PROC
EXTRN sub_10100239:PROC
EXTRN sub_10100245:PROC
EXTRN sub_10100253:PROC
EXTRN sub_1010026A:PROC
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
EXTRN EXTRN g_101A50CC:DWORD:DWORD
EXTRN EXTRN g_101AE168:DWORD:DWORD
EXTRN EXTRN g_101AE19C:DWORD:DWORD
EXTRN EXTRN g_101AE1A0:DWORD:DWORD
EXTRN EXTRN g_101AE1C8:DWORD:DWORD
EXTRN EXTRN g_1076AC88:DWORD:DWORD
EXTRN EXTRN g_1076AC8C:DWORD:DWORD
.CODE
___init_monetary PROC
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ebx
    push push esi
    xor xor esi, esi
    cmp cmp dword ptr [g_101AE19C], esi
    push push edi
    jne L0
    cmp cmp dword ptr [g_101AE1A0], esi
    jne L1
    mov mov dword ptr [g_1076AC88], esi
    mov mov dword ptr [g_1076AC8C], esi
    mov mov dword ptr [g_101A50CC], 0101A509Ch
    mov mov dword ptr [g_101AE168], esi
    jmp sub_101000E5
    push push 48
    push push 1
    call sub_100FD80C
    mov mov ebx, eax
    cmp cmp ebx, esi
    pop pop ecx
    pop pop ecx
    je L6
    push push 4
    call sub_100FC4BA
    mov mov edi, eax
    cmp cmp edi, esi
    pop pop ecx
    mov mov dword ptr [ebp - 4], edi
    jne L2
    push push ebx
    call sub_100F8536
    pop pop ecx
    jmp L7
    mov mov dword ptr [edi], esi
    cmp cmp dword ptr [g_101AE19C], esi
    je sub_101000DF
    push push 4
    call sub_100FC4E5
    cmp cmp eax, esi
    pop pop ecx
    mov mov dword ptr [g_1076AC88], eax
    jne L5
    push push ebx
    call sub_100F8561
    push push edi
    call sub_100F8567
    pop pop ecx
    jmp L4
    mov mov dword ptr [eax], esi
    movzx movzx esi, word ptr [g_101AE1C8]
    lea lea eax, [ebx + 12]
    push push eax
    push push 21
    push push esi
    push push 1
    call sub_101085D5
    mov mov edi, eax
    lea lea eax, [ebx + 16]
    push push eax
    push push 20
    push push esi
    push push 1
    call sub_101085E5
    or or edi, eax
    lea lea eax, [ebx + 20]
    push push eax
    push push 22
    push push esi
    push push 1
L2:
    call sub_101085F5
    or or edi, eax
    lea lea eax, [ebx + 24]
    push push eax
    push push 23
    push push esi
    push push 1
    call sub_10108605
    add add esp, 64
    or or edi, eax
    lea lea eax, [ebx + 28]
    push push eax
    push push 24
    push push esi
    push push 1
    call sub_10108618
    or or edi, eax
    lea lea eax, [ebx + 32]
    push push eax
    push push 80
    push push esi
    push push 1
    call sub_10108628
    or or edi, eax
    lea lea eax, [ebx + 36]
    push push eax
    push push 81
    push push esi
    push push 1
    call sub_10108638
    or or edi, eax
    lea lea eax, [ebx + 40]
    push push eax
    push push 26
    push push esi
    push push 0
    call sub_10108648
    add add esp, 64
    or or edi, eax
    lea lea eax, [ebx + 41]
    push push eax
    push push 25
    push push esi
    push push 0
    call sub_1010865B
    or or edi, eax
    lea lea eax, [ebx + 42]
    push push eax
    push push 84
    push push esi
    push push 0
    call sub_1010866B
    or or edi, eax
    lea lea eax, [ebx + 43]
    push push eax
    push push 85
    push push esi
    push push 0
    call sub_1010867B
    or or edi, eax
    lea lea eax, [ebx + 44]
    push push eax
    push push 86
    push push esi
    push push 0
    call sub_1010868B
    add add esp, 64
    or or edi, eax
    lea lea eax, [ebx + 45]
    push push eax
    push push 87
    push push esi
    push push 0
    call sub_1010869E
    or or edi, eax
    lea lea eax, [ebx + 46]
    push push eax
    push push 82
    push push esi
    push push 0
    call sub_101086AE
    or or edi, eax
    lea lea eax, [ebx + 47]
    push push eax
    push push 83
    push push esi
    push push 0
    call sub_101086BE
    add add esp, 48
    or or eax, edi
    je sub_101001D1
    push push ebx
    call L3
    push push ebx
    call sub_100F867D
    push push dword ptr [ebp - 4]
    call sub_100F8685
    add add esp, 12
    xor xor eax, eax
    inc inc eax
    jmp sub_1010026A
    mov mov eax, dword ptr [ebx + 28]
    jmp sub_10100209
    mov mov cl, byte ptr [eax]
    cmp cmp cl, 48
    jl sub_10100217
    cmp cmp cl, 57
    jg sub_1010021C
    sub sub cl, 48
    mov mov byte ptr [eax], cl
    inc inc eax
    cmp cmp byte ptr [eax], 0
    jne sub_1010020E
    jmp sub_10100253
    cmp cmp cl, 59
    jne sub_10100226
    mov mov esi, eax
    lea lea edi, [esi + 1]
    mov mov cl, byte ptr [edi]
    mov mov byte ptr [esi], cl
    mov mov esi, edi
    cmp cmp byte ptr [esi], 0
    jne sub_10100245
    jmp sub_10100239
    push push 12
    pop pop ecx
    mov mov esi, 0101A509Ch
    mov mov edi, ebx
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    and and dword ptr [g_1076AC88], 0
    mov mov eax, dword ptr [g_101A50CC]
    mov mov eax, dword ptr [eax]
    mov mov dword ptr [ebx], eax
    mov mov eax, dword ptr [g_101A50CC]
    mov mov eax, dword ptr [eax + 4]
    mov mov dword ptr [ebx + 4], eax
    mov mov eax, dword ptr [g_101A50CC]
    mov mov eax, dword ptr [eax + 8]
    mov mov dword ptr [ebx + 8], eax
L7:
    mov mov eax, dword ptr [ebp - 4]
    mov mov dword ptr [g_101A50CC], ebx
    mov mov dword ptr [g_1076AC8C], eax
    mov mov dword ptr [g_101AE168], ebx
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
___init_monetary ENDP
END
