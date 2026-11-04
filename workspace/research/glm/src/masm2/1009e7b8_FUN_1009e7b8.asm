.686
.MODEL FLAT, C
EXTRN sub_100650C8:PROC
EXTRN sub_100650FA:PROC
EXTRN sub_1006513C:PROC
EXTRN sub_100828CB:PROC
EXTRN sub_10082954:PROC
EXTRN sub_100832C1:PROC
EXTRN sub_1008351F:PROC
EXTRN sub_100999E6:PROC
EXTRN sub_1009A662:PROC
EXTRN sub_1009E143:PROC
EXTRN sub_1009E8D3:PROC
EXTRN sub_1009E8DD:PROC
EXTRN sub_1009E8E3:PROC
EXTRN sub_1009E8EC:PROC
EXTRN sub_1009E8F2:PROC
EXTRN sub_1009E902:PROC
EXTRN sub_1009E918:PROC
EXTRN sub_1009E93C:PROC
EXTRN sub_1009E94F:PROC
EXTRN sub_1009E96E:PROC
EXTRN sub_1009E982:PROC
EXTRN sub_1009E990:PROC
EXTRN sub_1009E9A0:PROC
EXTRN sub_1009E9BA:PROC
.CODE
FUN_1009e7b8 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ecx
    mov mov eax, dword ptr [ebp + 8]
    push push ebx
    xor xor ebx, ebx
    cmp cmp eax, ebx
    mov mov dword ptr [ebp - 8], ecx
    mov mov dword ptr [ebp - 4], ebx
    je sub_1009E8D3
    cmp cmp dword ptr [eax + 4], 3
    jne sub_1009E8DD
    push push esi
    push push edi
    mov mov edi, dword ptr [ebp + 12]
    cmp cmp edi, ebx
    lea lea esi, [eax + 16]
    mov mov dword ptr [ebp + 8], esi
    jne L0
    push push ebx
    lea lea eax, [ebp - 4]
    push push eax
    push push 1
    push push dword ptr [ecx + 16]
    push push ebx
    push push ebx
    push push esi
    push push 1
    call sub_1009E143
    test test eax, eax
    jne sub_1009E8F2
    mov mov edi, dword ptr [ebp - 4]
    push push 80
    call sub_100650C8
    cmp cmp eax, ebx
    je L1
    push push esi
    push push 1
    push push ebx
    push push ebx
    push push ebx
    push push ebx
    mov mov ecx, eax
    call sub_100832C1
    mov mov esi, eax
    jmp L2
    xor xor esi, esi
    cmp cmp esi, ebx
    je sub_1009E918
    cmp cmp dword ptr [edi + 36], ebx
    je L3
    mov mov ecx, dword ptr [edi + 36]
    mov mov eax, dword ptr [ecx]
    call call dword ptr [eax + 4]
    jmp sub_1009E8E3
    push push 64
L0:
    call sub_100650FA
    cmp cmp eax, ebx
    je sub_1009E8EC
    push push dword ptr [ebp + 8]
    mov mov ecx, eax
    push push dword ptr [edi + 20]
    push push dword ptr [edi + 16]
    push push 6
    call sub_1008351F
    jmp sub_1009E902
    xor xor eax, eax
    cmp cmp eax, ebx
    mov mov dword ptr [esi + 32], eax
    je sub_1009E94F
    push push dword ptr [edi + 32]
    call sub_100828CB
    cmp cmp dword ptr [ebp + 12], ebx
    mov mov dword ptr [esi + 16], eax
    je sub_1009E93C
    mov mov ecx, dword ptr [ebp - 8]
    push push ebx
    push push eax
    call sub_100999E6
    push push 20
    call sub_1006513C
L1:
    cmp cmp eax, ebx
    je sub_1009E96E
    push push 010114AE8h
    push push ebx
    push push dword ptr [esi + 32]
    mov mov ecx, eax
    call sub_10082954
L2:
    jmp sub_1009E982
    xor xor eax, eax
    cmp cmp eax, ebx
    jne sub_1009E990
    xor xor esi, esi
    jmp sub_1009E9A0
    mov mov ecx, dword ptr [ebp - 8]
    push push esi
    mov mov dword ptr [esi + 32], eax
    call sub_1009A662
    pop pop edi
    mov mov eax, esi
    pop pop esi
    jmp sub_1009E9BA
L3:
    xor xor eax, eax
    pop pop ebx
    leave leave
    ret ret 8
FUN_1009e7b8 ENDP
END
