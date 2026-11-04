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
EXTRN sub_1009EAF9:PROC
EXTRN sub_1009EB35:PROC
EXTRN sub_1009EB3E:PROC
EXTRN sub_1009EB59:PROC
EXTRN sub_1009EB61:PROC
EXTRN sub_1009EB75:PROC
EXTRN sub_1009EBAA:PROC
EXTRN sub_1009EBBE:PROC
EXTRN sub_1009EBBF:PROC
EXTRN sub_1009EBC3:PROC
EXTRN sub_1009EBC9:PROC
EXTRN sub_1009EBDE:PROC
EXTRN sub_1009EBFF:PROC
EXTRN sub_1009EC00:PROC
EXTRN sub_1009EC16:PROC
EXTRN sub_1009EC2C:PROC
EXTRN sub_1009EC66:PROC
EXTRN sub_1009EC76:PROC
EXTRN sub_1009EC7C:PROC
EXTRN sub_1009EC8E:PROC
EXTRN sub_1009EC8F:PROC
EXTRN sub_1009ECD1:PROC
EXTRN sub_1009ECF6:PROC
.CODE
FUN_1009e8bf PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ecx
    push push ebx
    push push esi
    push push edi
    mov mov edi, dword ptr [ebp + 8]
    xor xor ebx, ebx
    cmp cmp edi, ebx
    mov mov esi, ecx
    mov mov dword ptr [ebp - 4], esi
    mov mov dword ptr [ebp - 8], ebx
    je L0
    cmp cmp dword ptr [edi + 4], 3
    jne L1
    push push ebx
    lea lea eax, [ebp - 8]
    push push eax
    push push 1
    push push dword ptr [esi + 16]
    add add edi, 16
    push push ebx
    push push ebx
    push push edi
    push push ebx
    call sub_1009E132
    mov mov edi, dword ptr [ebp - 8]
    cmp cmp dword ptr [ebp + 16], ebx
    lea lea eax, [esi + 32]
    mov mov dword ptr [ebp + 8], eax
    je L5
    cmp cmp edi, ebx
    je L2
    cmp cmp dword ptr [edi + 4], 9
    jne L3
    push push edi
    mov mov ecx, esi
    call sub_10099B2F
    test test eax, eax
    je L6
L1:
    mov mov ebx, dword ptr [ebp + 12]
    test test ebx, ebx
    je L4
    cmp cmp dword ptr [ebx + 4], 1
    jne sub_1009EB3E
    push push edi
    mov mov ecx, esi
    call sub_10099AB5
    mov mov dword ptr [ebp + 12], eax
    jmp L8
    push push 010114D50h
    push push 0BDDh
    push push dword ptr [ebp + 8]
    push push esi
    jmp sub_1009EB59
    mov mov dword ptr [ebp - 8], ebx
    mov mov ebx, dword ptr [ebp + 12]
    test test ebx, ebx
    je L7
    cmp cmp dword ptr [ebx + 4], 13
    jne sub_1009EB75
    mov mov eax, dword ptr [ebx + 16]
    mov mov dword ptr [ebp - 8], eax
    lea lea eax, [ebx + 48]
    mov mov dword ptr [ebp + 8], eax
    push push dword ptr [ebp + 20]
    mov mov ecx, esi
    push push dword ptr [ebp - 8]
    push push edi
    call sub_1009B723
    test test eax, eax
    mov mov ecx, esi
    jne L9
    push push dword ptr [ebp + 20]
    push push dword ptr [ebp - 8]
    push push edi
    push push eax
L3:
    push push dword ptr [ebp + 8]
L4:
    call sub_1009BA71
    jmp sub_1009EBAA
    push push edi
    call sub_10099B1F
    test test eax, eax
    jne L10
    push push dword ptr [ebp - 8]
    mov mov ecx, esi
    call sub_10099B2D
    test test eax, eax
    jne L11
    and and dword ptr [ebp + 12], eax
    jmp L12
    mov mov dword ptr [ebp + 12], 1
    push push ebx
    mov mov ecx, esi
    call sub_1009A4D2
    or or dword ptr [ebp + 12], eax
    push push 80
    call sub_1006517C
    xor xor esi, esi
    cmp cmp eax, esi
    je sub_1009EAF9
    push push dword ptr [ebp + 8]
    mov mov ecx, eax
    push push 1
    push push esi
    push push esi
    push push esi
    push push esi
    call sub_10083379
    mov mov esi, eax
    test test esi, esi
    je sub_1009EC00
    test test edi, edi
    je sub_1009EB35
    mov mov eax, dword ptr [edi]
    mov mov ecx, edi
    call call dword ptr [eax + 4]
    test test eax, eax
    mov mov dword ptr [esi + 16], eax
    je sub_1009EC16
    test test ebx, ebx
    je sub_1009EB61
L7:
    mov mov eax, dword ptr [ebx]
    mov mov ecx, ebx
    call call dword ptr [eax + 4]
    test test eax, eax
    mov mov dword ptr [esi + 32], eax
    je sub_1009EC2C
    cmp cmp dword ptr [ebp + 16], 0
    je sub_1009EBBE
    mov mov edi, dword ptr [esi + 32]
    jmp sub_1009EBBF
    mov mov eax, dword ptr [edi + 8]
    test test eax, eax
    je sub_1009EBC3
    cmp cmp dword ptr [eax + 4], 13
    jne sub_1009EBC9
    push push dword ptr [eax + 16]
    mov mov ecx, dword ptr [ebp - 4]
L8:
    call sub_10099C55
    test test eax, eax
    je sub_1009EBFF
    cmp cmp dword ptr [ebp + 12], 0
    jne sub_1009EBDE
    mov mov eax, dword ptr [edi + 8]
    push push dword ptr [eax + 16]
    mov mov ecx, dword ptr [ebp - 4]
    call sub_10099BD6
    mov mov dword ptr [ebp + 12], eax
    mov mov edi, dword ptr [edi + 12]
L9:
    test test edi, edi
    jne sub_1009EBC3
    cmp cmp dword ptr [ebp + 12], 0
    je sub_1009EC16
    mov mov ecx, dword ptr [ebp - 4]
    push push 1
    push push dword ptr [esi + 16]
    call sub_10099AD1
    cmp cmp dword ptr [ebp + 16], 0
    je sub_1009EC8E
    mov mov edi, dword ptr [esi + 32]
    xor xor ebx, ebx
    jmp sub_1009EC66
    push push 010114D1Ch
    push push 0BC9h
    jmp sub_1009EC8F
    mov mov eax, dword ptr [edi + 8]
    test test eax, eax
    je sub_1009EC76
    cmp cmp dword ptr [eax + 4], 13
    jne sub_1009EC7C
    push push dword ptr [eax + 16]
    mov mov ecx, dword ptr [ebp - 4]
    call sub_10099D32
    add add ebx, eax
L11:
    mov mov edi, dword ptr [edi + 12]
    test test edi, edi
    jne sub_1009EC76
    push push dword ptr [esi + 16]
    mov mov ecx, dword ptr [ebp - 4]
    call sub_10099D46
    cmp cmp ebx, eax
    je sub_1009ECD1
    push push 010114CE0h
    push push 0BC6h
    push push dword ptr [ebp + 8]
    push push dword ptr [ebp - 4]
    call sub_100996ED
    add add esp, 16
    xor xor esi, esi
    jmp sub_1009ECF6
    mov mov ecx, dword ptr [ebp - 4]
    push push esi
    call sub_1009A788
    pop pop edi
    mov mov eax, esi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 16
FUN_1009e8bf ENDP
END
