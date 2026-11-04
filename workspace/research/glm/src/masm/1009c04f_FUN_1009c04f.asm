.686
.MODEL FLAT, C
EXTRN sub_10065090:PROC
EXTRN sub_1006510D:PROC
EXTRN sub_100828D9:PROC
EXTRN sub_10082923:PROC
EXTRN sub_1008328E:PROC
EXTRN sub_1009A5E2:PROC
.CODE
FUN_1009c04f PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    push ebx
    push esi
    mov esi, dword ptr [ebp + 8]
    push edi
    mov dword ptr [ebp - 8], ecx
    jmp L1
L0:
    mov esi, dword ptr [esi + 8]
L1:
    cmp dword ptr [esi + 4], 3
    jne L0
    push 80
    call sub_10065090
    xor edi, edi
    cmp eax, edi
    je L2
    add esi, 16
    push esi
    push 1
    push edi
    push edi
    push edi
    push edi
    mov ecx, eax
    call sub_1008328E
    mov ebx, eax
    mov dword ptr [ebp - 4], ebx
    jmp L3
L2:
    mov dword ptr [ebp - 4], edi
    mov ebx, edi
L3:
    cmp ebx, edi
    je L12
    mov ecx, dword ptr [ebp + 12]
    cmp ecx, edi
    je L4
    mov eax, dword ptr [ecx]
    call dword ptr [eax + 4]
    cmp eax, edi
    mov dword ptr [ebx + 32], eax
    je L12
L4:
    mov eax, dword ptr [ebx + 32]
    cmp eax, edi
    lea esi, [ebx + 16]
    mov dword ptr [ebp + 8], eax
    jne L8
L5:
    mov ecx, dword ptr [ebp - 8]
    push ebx
    call sub_1009A5E2
    mov eax, ebx
L6:
    pop edi
    pop esi
    pop ebx
    leave
    ret 8
L7:
    mov eax, dword ptr [ebp + 8]
L8:
    mov ebx, dword ptr [eax + 8]
    cmp ebx, edi
    je L11
    cmp dword ptr [ebx + 4], 13
    jne L11
    cmp dword ptr [ebx + 16], edi
    je L11
    push 20
    call sub_1006510D
    cmp eax, edi
    je L9
    push 010114AF0h
    push edi
    push edi
    mov ecx, eax
    call sub_10082923
    jmp L10
L9:
    xor eax, eax
L10:
    cmp eax, edi
    mov dword ptr [esi], eax
    je L12
    push dword ptr [ebx + 16]
    call sub_100828D9
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 8], eax
    mov esi, dword ptr [esi]
    cmp dword ptr [esi + 8], edi
    je L12
    mov eax, dword ptr [ebp + 8]
    add esi, 12
L11:
    mov eax, dword ptr [eax + 12]
    cmp eax, edi
    mov dword ptr [ebp + 8], eax
    jne L7
    mov ebx, dword ptr [ebp - 4]
    jmp L5
L12:
    xor eax, eax
    jmp L6
FUN_1009c04f ENDP
END
