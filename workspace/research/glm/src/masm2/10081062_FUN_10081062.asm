.686
.MODEL FLAT, C
EXTRN sub_1007D905:PROC
EXTRN sub_1007DBA5:PROC
EXTRN sub_10080D0C:PROC
EXTRN sub_100811B4:PROC
EXTRN sub_100811BB:PROC
EXTRN sub_100811C9:PROC
EXTRN sub_100811CE:PROC
EXTRN sub_100811D7:PROC
EXTRN sub_100811F8:PROC
EXTRN sub_10081202:PROC
EXTRN sub_1008120E:PROC
EXTRN sub_10081217:PROC
EXTRN sub_1008122F:PROC
EXTRN sub_1008123C:PROC
EXTRN sub_10081240:PROC
EXTRN sub_10081256:PROC
EXTRN sub_10081275:PROC
EXTRN sub_10081285:PROC
EXTRN sub_10081287:PROC
EXTRN sub_1008129F:PROC
EXTRN sub_100812A0:PROC
EXTRN sub_100812D9:PROC
EXTRN sub_100812EE:PROC
EXTRN sub_100F863C:PROC
EXTRN sub_100F865D:PROC
EXTRN sub_100F8688:PROC
EXTRN sub_100F86A7:PROC
EXTRN sub_100F86E7:PROC
EXTRN sub_100F872A:PROC
EXTRN sub_100F87AF:PROC
.CODE
FUN_10081062 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ebx
    push push esi
    mov mov esi, dword ptr [ebp + 8]
    push push edi
    mov mov dword ptr [ebp - 4], ecx
    jmp L0
    inc inc esi
    movsx movsx eax, byte ptr [esi]
    push push eax
    call sub_100F8688
    test test eax, eax
    pop pop ecx
    jne L1
    mov mov al, byte ptr [esi]
    xor xor ebx, ebx
    cmp cmp al, bl
    je sub_100811CE
    cmp cmp al, 91
    jne L5
    inc inc esi
L1:
    movsx movsx eax, byte ptr [esi]
    push push eax
    call sub_100F86A7
    test test eax, eax
    pop pop ecx
    jne L2
    movsx movsx eax, byte ptr [esi]
    push push eax
    call sub_100F863C
    test test eax, eax
    pop pop ecx
    je sub_100811F8
    xor xor edi, edi
    jmp L3
    movsx movsx ecx, byte ptr [esi]
    lea lea eax, [edi + edi*4]
    lea lea edi, [ecx + eax*2 - 48]
    inc inc esi
    movsx movsx eax, byte ptr [esi]
    push push eax
    call sub_100F865D
    test test eax, eax
    pop pop ecx
    jne L4
    jmp L6
    inc inc esi
    movsx movsx eax, byte ptr [esi]
    push push eax
    call sub_100F86E7
    test test eax, eax
    pop pop ecx
    jne L7
    cmp cmp byte ptr [esi], 93
    jne sub_1008122F
    mov mov ecx, dword ptr [ebp - 4]
    push push edi
    call sub_10080D0C
    cmp cmp eax, ebx
    je sub_10081240
    mov mov dword ptr [ebp + 12], ebx
    inc inc esi
    jmp sub_1008123C
    cmp cmp al, 46
    je sub_100811BB
    cmp cmp dword ptr [ebp + 12], ebx
    je sub_10081256
    cmp cmp al, 46
    jne sub_100811C9
    inc inc esi
    movsx movsx eax, byte ptr [esi]
    push push eax
    call sub_100F872A
    test test eax, eax
    pop pop ecx
    jne sub_100811D7
    xor xor edi, edi
    movsx movsx eax, byte ptr [edi + esi]
    push push eax
    call sub_100F87AF
    test test eax, eax
    pop pop ecx
    jne sub_1008120E
    cmp cmp byte ptr [edi + esi], 95
    jne sub_10081217
    inc inc edi
    jmp sub_10081202
    cmp cmp edi, ebx
    je sub_10081287
    mov mov ecx, dword ptr [ebp - 4]
    mov mov eax, dword ptr [ecx + 24]
    movzx movzx eax, word ptr [eax + 10]
    mov mov dword ptr [ebp + 12], ebx
    mov mov dword ptr [ebp + 8], eax
    mov mov eax, dword ptr [ebp + 8]
    cmp cmp dword ptr [ebp + 12], eax
    jae sub_1008129F
    mov mov eax, dword ptr [ecx + 56]
    mov mov edx, dword ptr [ebp + 12]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov eax, dword ptr [eax + 4]
    test test eax, eax
    je sub_10081285
    mov mov ecx, dword ptr [ecx]
    mov mov ebx, dword ptr [ecx + 8]
    add add ebx, eax
    push push edi
    mov mov eax, esi
    call sub_1007D905
    test test eax, eax
    je sub_100812A0
    inc inc dword ptr [ebp + 12]
    mov mov ecx, dword ptr [ebp - 4]
    jmp sub_10081275
    push push dword ptr [ebp + 12]
    mov mov ecx, dword ptr [ebp - 4]
    call sub_1007DBA5
    test test eax, eax
    je sub_100812D9
    and and dword ptr [ebp + 12], 0
    add add esi, edi
    mov mov dword ptr [ebp - 4], eax
    jmp sub_100811B4
    mov mov eax, dword ptr [ebp - 4]
    jmp sub_100812EE
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 8
FUN_10081062 ENDP
END
