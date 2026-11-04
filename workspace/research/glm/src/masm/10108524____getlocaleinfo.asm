.686
.MODEL FLAT, C
EXTRN sub_100F5EB7:PROC
EXTRN sub_100F857E:PROC
EXTRN sub_100F85A5:PROC
EXTRN sub_100F86FC:PROC
EXTRN sub_100FC4D2:PROC
EXTRN sub_100FC4FD:PROC
EXTRN sub_10100E0A:PROC
EXTRN sub_10109B6F:PROC
EXTRN sub_10109BEB:PROC
EXTRN sub_10109C0D:PROC
EXTRN sub_10109C38:PROC
EXTRN fp_1010C054:DWORD
EXTRN g_101A50D0:DWORD
.CODE
___getlocaleinfo PROC
    push ebp
    mov ebp, esp
    sub esp, 000000084h
    mov eax, dword ptr [g_101A50D0]
    push ebx
    push esi
    xor ebx, ebx
    cmp dword ptr [ebp + 8], 1
    mov dword ptr [ebp - 4], eax
    push edi
    jne L5
    push ebx
    lea edi, [ebp - 000000084h]
    push 000000080h
    mov eax, edi
    push eax
    push dword ptr [ebp + 16]
    mov dword ptr [ebp + 8], ebx
    push dword ptr [ebp + 12]
    call sub_10109BEB
    mov esi, eax
    add esp, 20
    cmp esi, ebx
    jne L0
    call dword ptr [fp_1010C054]
    cmp eax, 122
    jne L2
    push ebx
    push ebx
    push ebx
    push dword ptr [ebp + 16]
    push dword ptr [ebp + 12]
    call sub_10109C0D
    mov esi, eax
    add esp, 20
    cmp esi, ebx
    je L2
    push esi
    call sub_100FC4D2
    mov edi, eax
    cmp edi, ebx
    pop ecx
    je L2
    push ebx
    push esi
    push edi
    push dword ptr [ebp + 16]
    mov dword ptr [ebp + 8], 1
    push dword ptr [ebp + 12]
    call sub_10109C38
    mov esi, eax
    add esp, 20
    cmp esi, ebx
    je L1
L0:
    push esi
    call sub_100FC4FD
    cmp eax, ebx
    pop ecx
    mov ecx, dword ptr [ebp + 20]
    mov dword ptr [ecx], eax
    jne L4
    cmp dword ptr [ebp + 8], ebx
    je L2
L1:
    push edi
    call sub_100F857E
    pop ecx
L2:
    or eax, 0FFFFFFFFh
L3:
    mov ecx, dword ptr [ebp - 4]
    pop edi
    pop esi
    pop ebx
    call sub_10100E0A
    leave
    ret
L4:
    push esi
    push edi
    push eax
    call sub_100F5EB7
    add esp, 12
    cmp dword ptr [ebp + 8], ebx
    je L7
    push edi
    call sub_100F85A5
    pop ecx
    jmp L7
L5:
    cmp dword ptr [ebp + 8], ebx
    jne L2
    push ebx
    push 4
    mov edi, 0101AE250h
    push edi
    push dword ptr [ebp + 16]
    push dword ptr [ebp + 12]
    call sub_10109B6F
    add esp, 20
    test eax, eax
    je L2
    mov esi, dword ptr [ebp + 20]
    mov byte ptr [esi], bl
L6:
    mov bl, byte ptr [edi]
    movzx eax, bl
    push eax
    call sub_100F86FC
    test eax, eax
    pop ecx
    je L7
    mov al, byte ptr [esi]
    mov cl, 10
    imul cl
    add al, bl
    sub al, 48
    inc edi
    inc edi
    cmp edi, 0101AE258h
    mov byte ptr [esi], al
    jl L6
L7:
    xor eax, eax
    jmp L3
___getlocaleinfo ENDP
END
