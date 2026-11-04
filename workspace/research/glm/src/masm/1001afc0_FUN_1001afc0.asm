.686
.MODEL FLAT, C
EXTRN sub_1001B03F:PROC
EXTRN sub_1005F401:PROC
EXTRN sub_1005F463:PROC
EXTRN sub_1005F6DC:PROC
EXTRN sub_10061D2C:PROC
EXTRN sub_10061D42:PROC
EXTRN g_101AAC70:DWORD
.CODE
FUN_1001afc0 PROC
    mov eax, dword ptr [g_101AAC70]
    imul eax, eax, 00000045Ch
    add eax, 0101A66B0h
    mov cl, byte ptr [eax + 000000404h]
    test cl, cl
    je L0
    mov ecx, dword ptr [eax + 000000418h]
    mov edx, dword ptr [esp + 4]
    mov byte ptr [eax + 000000404h], 0
    mov dword ptr [edx], ecx
    mov ecx, dword ptr [eax + 000000414h]
    mov dword ptr [eax + 000000400h], ecx
L0:
    mov edx, dword ptr [esp + 4]
    push ebx
    push ebp
    push esi
    push edi
    push edx
    mov eax, 1
    call sub_1005F6DC
    add esp, 4
    mov ebx, eax
    xor edi, edi
    mov ebp, 010190100h
L1:
    mov esi, dword ptr [ebp]
    mov eax, ebx
    lea ecx, [ecx]
L2:
    mov dl, byte ptr [eax]
    mov cl, dl
    cmp dl, byte ptr [esi]
    jne L4
    test cl, cl
    je L3
    mov dl, byte ptr [eax + 1]
    mov cl, dl
    cmp dl, byte ptr [esi + 1]
    jne L4
    add eax, 2
    add esi, 2
    test cl, cl
    jne L2
L3:
    xor eax, eax
    jmp L5
L4:
    sbb eax, eax
    sbb eax, -1
L5:
    test eax, eax
    je L7
    inc edi
    add ebp, 16
    cmp edi, 21
    jb L1
    push ebx
    push 010194FB4h
    call sub_1005F401
    push ebx
    push 010194F98h
    call sub_10061D2C
    add esp, 16
    xor esi, esi
L6:
    mov edx, dword ptr [esi + 010190100h]
    push edx
    push 0101932D4h
    call sub_10061D42
    add esi, 16
    add esp, 8
    cmp esi, 000000150h
    jb L6
    pop edi
    pop esi
    pop ebp
    xor al, al
    pop ebx
    ret
L7:
    mov ecx, dword ptr [esp + 28]
    shl edi, 4
    mov eax, edi
    test dword ptr [eax + 01019010Ch], ecx
    jne L9
    cmp ecx, 1
    mov eax, 010195000h
    je L8
    mov eax, 0101966D4h
L8:
    push eax
    push ebx
    push 010194FE8h
    call sub_1005F463
    add esp, 12
    pop edi
    pop esi
    pop ebp
    xor al, al
    pop ebx
    ret
L9:
    mov edx, dword ptr [eax + 010190104h]
    mov ecx, dword ptr [esp + 32]
    mov dword ptr [ecx], edx
    mov eax, dword ptr [eax + 010190108h]
    push ecx
    mov ecx, dword ptr [esp + 28]
    push eax
    mov eax, dword ptr [esp + 28]
    push ecx
    call sub_1001B03F
    add esp, 12
    pop edi
    pop esi
    test al, al
    pop ebp
    setne al
    pop ebx
    ret
FUN_1001afc0 ENDP
END
