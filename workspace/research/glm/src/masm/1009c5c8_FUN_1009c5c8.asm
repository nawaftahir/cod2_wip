.686
.MODEL FLAT, C
EXTRN sub_100650F5:PROC
EXTRN sub_1006511F:PROC
EXTRN sub_1006514A:PROC
EXTRN sub_10065173:PROC
EXTRN sub_1008298B:PROC
EXTRN sub_10082F00:PROC
EXTRN sub_100832F1:PROC
EXTRN sub_10083535:PROC
EXTRN sub_1009A695:PROC
.CODE
FUN_1009c5c8 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    xor ebx, ebx
    cmp edi, ebx
    mov dword ptr [ebp - 4], ecx
    je L12
    cmp dword ptr [edi + 4], 15
    jne L12
    mov eax, dword ptr [edi + 48]
    cmp eax, ebx
    je L12
    cmp dword ptr [edi + 52], 4
    jb L12
    mov eax, dword ptr [eax]
    mov ecx, 0FFFF0000h
    and eax, ecx
    cmp eax, 07FFE0000h
    je L2
    cmp eax, 07FFF0000h
    je L1
    cmp eax, 0FFFE0000h
    je L0
    cmp eax, ecx
    jne L12
    mov dword ptr [ebp + 8], 25
    jmp L3
L0:
    mov dword ptr [ebp + 8], 26
    jmp L3
L1:
    mov dword ptr [ebp + 8], 27
    jmp L3
L2:
    mov dword ptr [ebp + 8], 28
L3:
    push 80
    call sub_100650F5
    cmp eax, ebx
    je L4
    lea ecx, [edi + 16]
    push ecx
    push 1
    push ebx
    push ebx
    push ebx
    push ebx
    mov ecx, eax
    call sub_100832F1
    mov esi, eax
    jmp L5
L4:
    xor esi, esi
L5:
    cmp esi, ebx
    je L12
    push 36
    call sub_1006511F
    cmp eax, ebx
    je L6
    push 000000200h
    push 1
    push 1
    push dword ptr [ebp + 8]
    mov ecx, eax
    push 3
    call sub_10082F00
    jmp L7
L6:
    xor eax, eax
L7:
    cmp eax, ebx
    mov dword ptr [esi + 16], eax
    je L12
    push 64
    call sub_1006514A
    cmp eax, ebx
    je L8
    lea ecx, [edi + 16]
    push ecx
    push dword ptr [edi + 52]
    mov ecx, eax
    push dword ptr [edi + 48]
    push 5
    call sub_10083535
    jmp L9
L8:
    xor eax, eax
L9:
    cmp eax, ebx
    mov dword ptr [esi + 32], eax
    je L12
    push 20
    call sub_10065173
    cmp eax, ebx
    je L10
    push 010114AE8h
    push ebx
    push dword ptr [esi + 32]
    mov ecx, eax
    call sub_1008298B
    jmp L11
L10:
    xor eax, eax
L11:
    cmp eax, ebx
    je L12
    mov ecx, dword ptr [ebp - 4]
    push esi
    mov dword ptr [esi + 32], eax
    call sub_1009A695
    mov eax, esi
    jmp L13
L12:
    xor eax, eax
L13:
    pop edi
    pop esi
    pop ebx
    leave
    ret 4
FUN_1009c5c8 ENDP
END
