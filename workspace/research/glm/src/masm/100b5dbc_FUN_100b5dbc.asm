.686
.MODEL FLAT, C
EXTRN sub_1008B156:PROC
EXTRN sub_1008B181:PROC
EXTRN sub_1008B1DD:PROC
.CODE
FUN_100b5dbc PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 40
    push ebx
    mov ebx, ecx
    xor edx, edx
    xor eax, eax
    cmp dword ptr [ebx + 000000158h], edx
    jne L9
    cmp dword ptr [ebx + 8], edx
    push edi
    lea edi, [ebp - 40]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    mov dword ptr [ebp - 12], edx
    mov dword ptr [ebp - 16], edx
    mov dword ptr [ebp - 8], edx
    mov dword ptr [ebp - 20], edx
    stosd dword ptr es:[edi], eax
    mov dword ptr [ebp - 4], edx
    jbe L5
    mov edi, 0000011BCh
    push esi
L0:
    mov eax, dword ptr [ebx + 20]
    mov ecx, dword ptr [ebp - 4]
    mov esi, dword ptr [eax + ecx*4]
    mov eax, dword ptr [esi + 4]
    mov ecx, dword ptr [ebx + 16]
    mov eax, dword ptr [ecx + eax*4]
    test byte ptr [eax + 4], 32
    je L4
    push dword ptr [esi + 108]
    mov eax, dword ptr [ebx]
    mov ecx, ebx
    call dword ptr [eax + 0x54]
    push dword ptr [esi + 108]
    mov dword ptr [ebp - 24], eax
    mov eax, dword ptr [ebx]
    mov ecx, ebx
    call dword ptr [eax + 0x58]
    mov ecx, dword ptr [ebp - 24]
    dec ecx
    je L3
    sub ecx, 4
    je L2
    sub ecx, 7
    jne L4
    test eax, eax
    jne L4
    cmp dword ptr [esi + 16], eax
    jbe L4
    cmp dword ptr [ebp - 12], eax
    jne L4
    push 010117D54h
    push edi
    push dword ptr [esi + 96]
    push ebx
    call sub_1008B156
    xor eax, eax
    add esp, 16
    inc eax
    mov dword ptr [ebp - 12], eax
L1:
    mov dword ptr [ebp - 8], eax
    jmp L4
L2:
    test eax, eax
    jne L4
    cmp dword ptr [esi + 16], eax
    jbe L4
    cmp dword ptr [ebp - 16], eax
    jne L4
    push 010115C44h
    push edi
    push dword ptr [esi + 96]
    push ebx
    call sub_1008B181
    xor eax, eax
    add esp, 16
    inc eax
    mov dword ptr [ebp - 16], eax
    jmp L1
L3:
    test eax, eax
    jne L4
    mov eax, dword ptr [esi + 16]
    mov dword ptr [ebp + eax*4 - 40], 1
    mov eax, dword ptr [esi + 96]
    mov dword ptr [ebp - 20], eax
L4:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [ebx + 8]
    jb L0
    xor edx, edx
    pop esi
L5:
    xor ecx, ecx
    xor eax, eax
    pop edi
L6:
    cmp dword ptr [ebp + eax*4 - 40], edx
    je L7
    inc ecx
L7:
    inc eax
    cmp eax, 4
    jb L6
    cmp ecx, 4
    je L8
    push 010115C00h
    push 0000011BDh
    push dword ptr [ebp - 20]
    push ebx
    call sub_1008B1DD
    add esp, 16
    mov dword ptr [ebp - 8], 1
L8:
    mov eax, dword ptr [ebp - 8]
    neg eax
    sbb eax, eax
    and eax, 080004005h
L9:
    pop ebx
    leave
    ret
FUN_100b5dbc ENDP
END
