.686
.MODEL FLAT, C
EXTRN sub_1008657F:PROC
EXTRN sub_10086593:PROC
EXTRN sub_1008B1F7:PROC
EXTRN sub_100B9E6A:PROC
EXTRN sub_100B9F61:PROC
.CODE
FUN_100b9e86 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 00000020Ch
    push ebx
    push esi
    push edi
    xor edi, edi
    mov esi, ecx
    xor bl, bl
    cmp dword ptr [esi + 8], edi
    mov byte ptr [ebp - 1], bl
    mov dword ptr [ebp - 8], edi
    jbe L4
L0:
    mov eax, dword ptr [esi + 20]
    mov ecx, dword ptr [ebp - 8]
    mov ecx, dword ptr [eax + ecx*4]
    mov eax, dword ptr [ecx + 4]
    mov edx, dword ptr [esi + 16]
    mov eax, dword ptr [edx + eax*4]
    mov eax, dword ptr [eax + 4]
    test al, 16
    je L1
    test ah, 2
    je L2
L1:
    test al, 32
    je L3
L2:
    mov eax, dword ptr [esi]
    push edi
    push ecx
    mov ecx, esi
    call dword ptr [eax + 4]
    test eax, eax
    jge L3
    lea eax, [ebp - 8]
    push eax
    mov ecx, esi
    call sub_100B9E6A
    mov byte ptr [ebp - 1], 1
    mov bl, byte ptr [ebp - 1]
L3:
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [esi + 8]
    jb L0
    test bl, bl
    je L4
    mov eax, 080004005h
    jmp L14
L4:
    cmp dword ptr [esi + 8], edi
    mov dword ptr [ebp - 8], edi
    jbe L13
L5:
    mov ecx, dword ptr [ebp - 8]
    mov eax, dword ptr [esi + 20]
    mov edi, dword ptr [eax + ecx*4]
    mov edx, dword ptr [edi + 4]
    mov ecx, dword ptr [esi + 16]
    mov ecx, dword ptr [ecx + edx*4]
    mov ecx, dword ptr [ecx + 4]
    test cl, 16
    je L6
    test ch, 2
    je L7
L6:
    test cl, 32
    je L12
L7:
    mov ecx, dword ptr [ebp - 8]
    inc ecx
    mov dword ptr [ebp - 12], ecx
    mov ecx, dword ptr [esi + 8]
    cmp dword ptr [ebp - 12], ecx
    jae L12
    mov ecx, dword ptr [ebp - 12]
    lea eax, [eax + ecx*4]
L8:
    mov ebx, dword ptr [eax]
    cmp dword ptr [ebx + 4], edx
    jne L9
    mov ecx, dword ptr [ebx + 112]
    cmp ecx, dword ptr [edi + 112]
    jne L9
    mov ecx, dword ptr [ebx + 108]
    cmp ecx, dword ptr [edi + 108]
    jne L9
    mov ecx, dword ptr [edi]
    xor ecx, dword ptr [ebx]
    test ecx, 001000000h
    jne L10
L9:
    inc dword ptr [ebp - 12]
    mov ecx, dword ptr [ebp - 12]
    add eax, 4
    cmp ecx, dword ptr [esi + 8]
    jb L8
    jmp L11
L10:
    push 000000100h
    lea eax, [ebp - 00000020Ch]
    push eax
    push edi
    mov ecx, esi
    call sub_1008657F
    push 000000100h
    lea eax, [ebp - 00000010Ch]
    push eax
    push ebx
    mov ecx, esi
    call sub_10086593
    lea eax, [ebp - 00000010Ch]
    push eax
    lea eax, [ebp - 00000020Ch]
    push eax
    push 010119D18h
    push 000001195h
    push dword ptr [edi + 104]
    push esi
    call sub_1008B1F7
    add esp, 24
    lea eax, [ebp - 8]
    push eax
    mov ecx, esi
    call sub_100B9F61
    mov byte ptr [ebp - 1], 1
L11:
    mov bl, byte ptr [ebp - 1]
L12:
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [esi + 8]
    jb L5
L13:
    neg bl
    sbb ebx, ebx
    and ebx, 080004005h
    mov eax, ebx
L14:
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_100b9e86 ENDP
END
