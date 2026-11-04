.686
.MODEL FLAT, C
EXTRN sub_10065094:PROC
EXTRN sub_100650BB:PROC
EXTRN sub_100650E5:PROC
EXTRN sub_1006511F:PROC
EXTRN sub_10082937:PROC
EXTRN sub_10082E9B:PROC
EXTRN sub_1008328D:PROC
EXTRN sub_100834DF:PROC
EXTRN sub_1009A645:PROC
.CODE
FUN_1009bf69 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    mov ebx, dword ptr [ebp + 8]
    push edi
    xor edi, edi
    cmp ebx, edi
    mov dword ptr [ebp - 4], ecx
    jne L0
    xor eax, eax
    jmp L13
L0:
    push esi
    push 80
    add ebx, 16
    call sub_10065094
    cmp eax, edi
    je L1
    push ebx
    push 1
    push edi
    push edi
    push edi
    push edi
    mov ecx, eax
    call sub_1008328D
    mov esi, eax
    jmp L2
L1:
    xor esi, esi
L2:
    cmp esi, edi
    je L10
    push 36
    call sub_100650BB
    cmp eax, edi
    je L3
    push 000000200h
    push 1
    push 1
    push 14
    push 3
    mov ecx, eax
    call sub_10082E9B
    jmp L4
L3:
    xor eax, eax
L4:
    cmp eax, edi
    mov dword ptr [esi + 16], eax
    je L10
    push 64
    call sub_100650E5
    cmp eax, edi
    mov dword ptr [ebp + 8], eax
    je L6
    mov edi, dword ptr [ebx + 8]
    mov edx, edi
    lea ecx, [edx + 1]
L5:
    mov al, byte ptr [edx]
    inc edx
    test al, al
    jne L5
    sub edx, ecx
    mov ecx, dword ptr [ebp + 8]
    push ebx
    inc edx
    push edx
    push edi
    push 5
    call sub_100834DF
    xor edi, edi
    jmp L7
L6:
    xor eax, eax
L7:
    cmp eax, edi
    mov dword ptr [esi + 32], eax
    je L10
    push 20
    call sub_1006511F
    cmp eax, edi
    je L8
    push 010114AE8h
    push edi
    push dword ptr [esi + 32]
    mov ecx, eax
    call sub_10082937
    jmp L9
L8:
    xor eax, eax
L9:
    cmp eax, edi
    jne L11
L10:
    xor eax, eax
    jmp L12
L11:
    mov ecx, dword ptr [ebp - 4]
    push esi
    mov dword ptr [esi + 32], eax
    call sub_1009A645
    mov eax, esi
L12:
    pop esi
L13:
    pop edi
    pop ebx
    leave
    ret 4
FUN_1009bf69 ENDP
END
