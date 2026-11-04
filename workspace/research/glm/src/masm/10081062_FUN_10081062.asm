.686
.MODEL FLAT, C
EXTRN sub_1007D905:PROC
EXTRN sub_1007DBA5:PROC
EXTRN sub_10080D0C:PROC
EXTRN sub_100F863C:PROC
EXTRN sub_100F865D:PROC
EXTRN sub_100F8688:PROC
EXTRN sub_100F86A7:PROC
EXTRN sub_100F86E7:PROC
EXTRN sub_100F872A:PROC
EXTRN sub_100F87AF:PROC
.CODE
FUN_10081062 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    push esi
    mov esi, dword ptr [ebp + 8]
    push edi
    mov dword ptr [ebp - 4], ecx
    jmp L1
L0:
    inc esi
L1:
    movsx eax, byte ptr [esi]
    push eax
    call sub_100F8688
    test eax, eax
    pop ecx
    jne L0
    mov al, byte ptr [esi]
    xor ebx, ebx
    cmp al, bl
    je L17
    cmp al, 91
    jne L7
L2:
    inc esi
    movsx eax, byte ptr [esi]
    push eax
    call sub_100F86A7
    test eax, eax
    pop ecx
    jne L2
    movsx eax, byte ptr [esi]
    push eax
    call sub_100F863C
    test eax, eax
    pop ecx
    je L18
    xor edi, edi
    jmp L4
L3:
    movsx ecx, byte ptr [esi]
    lea eax, [edi + edi*4]
    lea edi, [ecx + eax*2 - 48]
    inc esi
L4:
    movsx eax, byte ptr [esi]
    push eax
    call sub_100F865D
    test eax, eax
    pop ecx
    jne L3
    jmp L6
L5:
    inc esi
L6:
    movsx eax, byte ptr [esi]
    push eax
    call sub_100F86E7
    test eax, eax
    pop ecx
    jne L5
    cmp byte ptr [esi], 93
    jne L18
    mov ecx, dword ptr [ebp - 4]
    push edi
    call sub_10080D0C
    cmp eax, ebx
    je L18
    mov dword ptr [ebp + 12], ebx
    inc esi
    jmp L16
L7:
    cmp al, 46
    je L8
    cmp dword ptr [ebp + 12], ebx
    je L18
    cmp al, 46
    jne L9
L8:
    inc esi
L9:
    movsx eax, byte ptr [esi]
    push eax
    call sub_100F872A
    test eax, eax
    pop ecx
    jne L8
    xor edi, edi
L10:
    movsx eax, byte ptr [edi + esi]
    push eax
    call sub_100F87AF
    test eax, eax
    pop ecx
    jne L11
    cmp byte ptr [edi + esi], 95
    jne L12
L11:
    inc edi
    jmp L10
L12:
    cmp edi, ebx
    je L18
    mov ecx, dword ptr [ebp - 4]
    mov eax, dword ptr [ecx + 24]
    movzx eax, word ptr [eax + 10]
    mov dword ptr [ebp + 12], ebx
    mov dword ptr [ebp + 8], eax
L13:
    mov eax, dword ptr [ebp + 8]
    cmp dword ptr [ebp + 12], eax
    jae L18
    mov eax, dword ptr [ecx + 56]
    mov edx, dword ptr [ebp + 12]
    mov eax, dword ptr [eax + edx*4]
    mov eax, dword ptr [eax + 4]
    test eax, eax
    je L14
    mov ecx, dword ptr [ecx]
    mov ebx, dword ptr [ecx + 8]
    add ebx, eax
    push edi
    mov eax, esi
    call sub_1007D905
    test eax, eax
    je L15
L14:
    inc dword ptr [ebp + 12]
    mov ecx, dword ptr [ebp - 4]
    jmp L13
L15:
    push dword ptr [ebp + 12]
    mov ecx, dword ptr [ebp - 4]
    call sub_1007DBA5
    test eax, eax
    je L18
    and dword ptr [ebp + 12], 0
    add esi, edi
L16:
    mov dword ptr [ebp - 4], eax
    jmp L1
L17:
    mov eax, dword ptr [ebp - 4]
    jmp L19
L18:
    xor eax, eax
L19:
    pop edi
    pop esi
    pop ebx
    leave
    ret 8
FUN_10081062 ENDP
END
