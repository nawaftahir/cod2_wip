.686
.MODEL FLAT, C
EXTRN sub_1006517C:PROC
EXTRN sub_10083379:PROC
EXTRN sub_100996ED:PROC
EXTRN sub_10099AB5:PROC
EXTRN sub_10099AD1:PROC
EXTRN sub_10099B1F:PROC
EXTRN sub_10099B2D:PROC
EXTRN sub_10099B2F:PROC
EXTRN sub_10099BD6:PROC
EXTRN sub_10099C55:PROC
EXTRN sub_10099D32:PROC
EXTRN sub_10099D46:PROC
EXTRN sub_1009A4D2:PROC
EXTRN sub_1009A788:PROC
EXTRN sub_1009B723:PROC
EXTRN sub_1009BA71:PROC
EXTRN sub_1009E132:PROC
.CODE
FUN_1009e8bf PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    push ebx
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    xor ebx, ebx
    cmp edi, ebx
    mov esi, ecx
    mov dword ptr [ebp - 4], esi
    mov dword ptr [ebp - 8], ebx
    je L0
    cmp dword ptr [edi + 4], 3
    jne L0
    push ebx
    lea eax, [ebp - 8]
    push eax
    push 1
    push dword ptr [esi + 16]
    add edi, 16
    push ebx
    push ebx
    push edi
    push ebx
    call sub_1009E132
    mov edi, dword ptr [ebp - 8]
L0:
    cmp dword ptr [ebp + 16], ebx
    lea eax, [esi + 32]
    mov dword ptr [ebp + 8], eax
    je L3
    cmp edi, ebx
    je L2
    cmp dword ptr [edi + 4], 9
    jne L2
    push edi
    mov ecx, esi
    call sub_10099B2F
    test eax, eax
    je L2
    mov ebx, dword ptr [ebp + 12]
    test ebx, ebx
    je L1
    cmp dword ptr [ebx + 4], 1
    jne L22
L1:
    push edi
    mov ecx, esi
    call sub_10099AB5
    mov dword ptr [ebp + 12], eax
    jmp L7
L2:
    push 010114D50h
    push 000000BDDh
    push dword ptr [ebp + 8]
    push esi
    jmp L21
L3:
    mov dword ptr [ebp - 8], ebx
    mov ebx, dword ptr [ebp + 12]
    test ebx, ebx
    je L4
    cmp dword ptr [ebx + 4], 13
    jne L22
    mov eax, dword ptr [ebx + 16]
    mov dword ptr [ebp - 8], eax
    lea eax, [ebx + 48]
    mov dword ptr [ebp + 8], eax
L4:
    push dword ptr [ebp + 20]
    mov ecx, esi
    push dword ptr [ebp - 8]
    push edi
    call sub_1009B723
    test eax, eax
    mov ecx, esi
    jne L5
    push dword ptr [ebp + 20]
    push dword ptr [ebp - 8]
    push edi
    push eax
    push dword ptr [ebp + 8]
    call sub_1009BA71
    jmp L22
L5:
    push edi
    call sub_10099B1F
    test eax, eax
    jne L6
    push dword ptr [ebp - 8]
    mov ecx, esi
    call sub_10099B2D
    test eax, eax
    jne L6
    and dword ptr [ebp + 12], eax
    jmp L7
L6:
    mov dword ptr [ebp + 12], 1
L7:
    push ebx
    mov ecx, esi
    call sub_1009A4D2
    or dword ptr [ebp + 12], eax
    push 80
    call sub_1006517C
    xor esi, esi
    cmp eax, esi
    je L8
    push dword ptr [ebp + 8]
    mov ecx, eax
    push 1
    push esi
    push esi
    push esi
    push esi
    call sub_10083379
    mov esi, eax
L8:
    test esi, esi
    je L22
    test edi, edi
    je L9
    mov eax, dword ptr [edi]
    mov ecx, edi
    call dword ptr [eax + 4]
    test eax, eax
    mov dword ptr [esi + 16], eax
    je L22
L9:
    test ebx, ebx
    je L10
    mov eax, dword ptr [ebx]
    mov ecx, ebx
    call dword ptr [eax + 4]
    test eax, eax
    mov dword ptr [esi + 32], eax
    je L22
L10:
    cmp dword ptr [ebp + 16], 0
    je L14
    mov edi, dword ptr [esi + 32]
    jmp L13
L11:
    mov eax, dword ptr [edi + 8]
    test eax, eax
    je L12
    cmp dword ptr [eax + 4], 13
    jne L12
    push dword ptr [eax + 16]
    mov ecx, dword ptr [ebp - 4]
    call sub_10099C55
    test eax, eax
    je L16
    cmp dword ptr [ebp + 12], 0
    jne L12
    mov eax, dword ptr [edi + 8]
    push dword ptr [eax + 16]
    mov ecx, dword ptr [ebp - 4]
    call sub_10099BD6
    mov dword ptr [ebp + 12], eax
L12:
    mov edi, dword ptr [edi + 12]
L13:
    test edi, edi
    jne L11
L14:
    cmp dword ptr [ebp + 12], 0
    je L15
    mov ecx, dword ptr [ebp - 4]
    push 1
    push dword ptr [esi + 16]
    call sub_10099AD1
L15:
    cmp dword ptr [ebp + 16], 0
    je L23
    mov edi, dword ptr [esi + 32]
    xor ebx, ebx
    jmp L19
L16:
    push 010114D1Ch
    push 000000BC9h
    jmp L20
L17:
    mov eax, dword ptr [edi + 8]
    test eax, eax
    je L18
    cmp dword ptr [eax + 4], 13
    jne L18
    push dword ptr [eax + 16]
    mov ecx, dword ptr [ebp - 4]
    call sub_10099D32
    add ebx, eax
L18:
    mov edi, dword ptr [edi + 12]
L19:
    test edi, edi
    jne L17
    push dword ptr [esi + 16]
    mov ecx, dword ptr [ebp - 4]
    call sub_10099D46
    cmp ebx, eax
    je L23
    push 010114CE0h
    push 000000BC6h
L20:
    push dword ptr [ebp + 8]
    push dword ptr [ebp - 4]
L21:
    call sub_100996ED
    add esp, 16
L22:
    xor esi, esi
    jmp L24
L23:
    mov ecx, dword ptr [ebp - 4]
    push esi
    call sub_1009A788
L24:
    pop edi
    mov eax, esi
    pop esi
    pop ebx
    leave
    ret 16
FUN_1009e8bf ENDP
END
