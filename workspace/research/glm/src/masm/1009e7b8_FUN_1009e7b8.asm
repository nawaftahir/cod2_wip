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
.CODE
FUN_1009e7b8 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    mov eax, dword ptr [ebp + 8]
    push ebx
    xor ebx, ebx
    cmp eax, ebx
    mov dword ptr [ebp - 8], ecx
    mov dword ptr [ebp - 4], ebx
    je L12
    cmp dword ptr [eax + 4], 3
    jne L12
    push esi
    push edi
    mov edi, dword ptr [ebp + 12]
    cmp edi, ebx
    lea esi, [eax + 16]
    mov dword ptr [ebp + 8], esi
    jne L0
    push ebx
    lea eax, [ebp - 4]
    push eax
    push 1
    push dword ptr [ecx + 16]
    push ebx
    push ebx
    push esi
    push 1
    call sub_1009E143
    test eax, eax
    jne L9
    mov edi, dword ptr [ebp - 4]
L0:
    push 80
    call sub_100650C8
    cmp eax, ebx
    je L1
    push esi
    push 1
    push ebx
    push ebx
    push ebx
    push ebx
    mov ecx, eax
    call sub_100832C1
    mov esi, eax
    jmp L2
L1:
    xor esi, esi
L2:
    cmp esi, ebx
    je L9
    cmp dword ptr [edi + 36], ebx
    je L3
    mov ecx, dword ptr [edi + 36]
    mov eax, dword ptr [ecx]
    call dword ptr [eax + 4]
    jmp L5
L3:
    push 64
    call sub_100650FA
    cmp eax, ebx
    je L4
    push dword ptr [ebp + 8]
    mov ecx, eax
    push dword ptr [edi + 20]
    push dword ptr [edi + 16]
    push 6
    call sub_1008351F
    jmp L5
L4:
    xor eax, eax
L5:
    cmp eax, ebx
    mov dword ptr [esi + 32], eax
    je L9
    push dword ptr [edi + 32]
    call sub_100828CB
    cmp dword ptr [ebp + 12], ebx
    mov dword ptr [esi + 16], eax
    je L6
    mov ecx, dword ptr [ebp - 8]
    push ebx
    push eax
    call sub_100999E6
L6:
    push 20
    call sub_1006513C
    cmp eax, ebx
    je L7
    push 010114AE8h
    push ebx
    push dword ptr [esi + 32]
    mov ecx, eax
    call sub_10082954
    jmp L8
L7:
    xor eax, eax
L8:
    cmp eax, ebx
    jne L10
L9:
    xor esi, esi
    jmp L11
L10:
    mov ecx, dword ptr [ebp - 8]
    push esi
    mov dword ptr [esi + 32], eax
    call sub_1009A662
L11:
    pop edi
    mov eax, esi
    pop esi
    jmp L13
L12:
    xor eax, eax
L13:
    pop ebx
    leave
    ret 8
FUN_1009e7b8 ENDP
END
