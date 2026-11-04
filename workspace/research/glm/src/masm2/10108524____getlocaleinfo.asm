.686
.MODEL FLAT, C
EXTRN sub_100F5EB7:PROC
EXTRN sub_100F857E:PROC
EXTRN sub_100F85A5:PROC
EXTRN sub_100F86FC:PROC
EXTRN sub_100FC4D2:PROC
EXTRN sub_100FC4FD:PROC
EXTRN sub_10100E0A:PROC
EXTRN sub_1010865F:PROC
EXTRN sub_1010867B:PROC
EXTRN sub_10108686:PROC
EXTRN sub_101086B0:PROC
EXTRN sub_101086CB:PROC
EXTRN sub_101086FD:PROC
EXTRN sub_10108716:PROC
EXTRN sub_1010871F:PROC
EXTRN sub_10108744:PROC
EXTRN sub_10108754:PROC
EXTRN sub_10109B6F:PROC
EXTRN sub_10109BEB:PROC
EXTRN sub_10109C0D:PROC
EXTRN sub_10109C38:PROC
EXTRN EXTRN fp_1010C054:DWORD:DWORD
EXTRN EXTRN g_101A50D0:DWORD:DWORD
.CODE
___getlocaleinfo PROC
    push push ebp
    mov mov ebp, esp
    sub sub esp, 084h
    mov mov eax, dword ptr [g_101A50D0]
    push push ebx
    push push esi
    xor xor ebx, ebx
    cmp cmp dword ptr [ebp + 8], 1
    mov mov dword ptr [ebp - 4], eax
    push push edi
    jne L1
    push push ebx
    lea lea edi, [ebp - 084h]
    push push 080h
    mov mov eax, edi
    push push eax
    push push dword ptr [ebp + 16]
    mov mov dword ptr [ebp + 8], ebx
    push push dword ptr [ebp + 12]
    call sub_10109BEB
    mov mov esi, eax
    add add esp, 20
    cmp cmp esi, ebx
    jne L0
    call dword ptr [fp_1010C054]
    cmp cmp eax, 122
    jne L2
    push push ebx
    push push ebx
    push push ebx
    push push dword ptr [ebp + 16]
    push push dword ptr [ebp + 12]
    call sub_10109C0D
    mov mov esi, eax
    add add esp, 20
    cmp cmp esi, ebx
    je L3
    push push esi
    call sub_100FC4D2
    mov mov edi, eax
    cmp cmp edi, ebx
    pop pop ecx
    je L4
    push push ebx
    push push esi
    push push edi
    push push dword ptr [ebp + 16]
    mov mov dword ptr [ebp + 8], 1
    push push dword ptr [ebp + 12]
    call sub_10109C38
    mov mov esi, eax
    add add esp, 20
    cmp cmp esi, ebx
    je sub_1010865F
    push push esi
    call sub_100FC4FD
    cmp cmp eax, ebx
    pop pop ecx
    mov mov ecx, dword ptr [ebp + 20]
    mov mov dword ptr [ecx], eax
    jne sub_10108686
    cmp cmp dword ptr [ebp + 8], ebx
    je sub_1010867B
    push push edi
    call sub_100F857E
    pop pop ecx
    or or eax, -1
    mov mov ecx, dword ptr [ebp - 4]
    pop pop edi
    pop pop esi
    pop pop ebx
    call sub_10100E0A
    leave leave
    ret ret
    push push esi
    push push edi
    push push eax
    call sub_100F5EB7
    add add esp, 12
    cmp cmp dword ptr [ebp + 8], ebx
    je sub_10108716
    push push edi
    call sub_100F85A5
    pop pop ecx
    jmp sub_1010871F
    cmp cmp dword ptr [ebp + 8], ebx
    jne sub_101086B0
    push push ebx
    push push 4
    mov mov edi, 0101AE250h
    push push edi
    push push dword ptr [ebp + 16]
    push push dword ptr [ebp + 12]
    call sub_10109B6F
    add add esp, 20
    test test eax, eax
    je sub_101086CB
L1:
    mov mov esi, dword ptr [ebp + 20]
    mov mov byte ptr [esi], bl
    mov mov bl, byte ptr [edi]
    movzx movzx eax, bl
    push push eax
    call sub_100F86FC
    test test eax, eax
    pop pop ecx
    je sub_10108754
    mov mov al, byte ptr [esi]
    mov mov cl, 10
    imul imul cl
    add add al, bl
    sub sub al, 48
L3:
    inc inc edi
    inc inc edi
    cmp cmp edi, 0101AE258h
    mov mov byte ptr [esi], al
    jl sub_10108744
    xor xor eax, eax
    jmp sub_101086FD
___getlocaleinfo ENDP
END
