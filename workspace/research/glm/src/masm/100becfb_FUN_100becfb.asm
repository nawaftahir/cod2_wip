.686
.MODEL FLAT, C
EXTRN sub_10086249:PROC
EXTRN sub_100B9A11:PROC
EXTRN sub_100B9A42:PROC
.CODE
FUN_100becfb PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0000000F8h
    push ebx
    push esi
    push edi
    mov esi, ecx
    mov eax, dword ptr [esi + 000000100h]
    mov edi, dword ptr [eax]
    xor ecx, ecx
    mov dword ptr [ebp - 4], ecx
    mov dword ptr [ebp - 24], ecx
    xor ebx, ebx
    mov dword ptr [ebp - 8], ecx
    inc ebx
    push ebx
    and edi, 0000FFFFFh
    push edi
    lea ecx, [ebp - 24]
    push ecx
    lea ecx, [ebp - 0000000B8h]
    push ecx
    lea ecx, [ebp - 4]
    push ecx
    lea ecx, [ebp - 0000000F8h]
    push ecx
    push 010118D78h
    push eax
    mov ecx, esi
    mov dword ptr [ebp - 20], ebx
    mov dword ptr [ebp - 16], 2
    mov dword ptr [ebp - 12], 3
    call sub_100B9A11
    cmp eax, ebx
    jne L0
    push ebx
    push edi
    lea eax, [ebp - 24]
    push eax
    lea eax, [ebp - 0000000B8h]
    push eax
    lea eax, [ebp - 4]
    push eax
    lea eax, [ebp - 0000000F8h]
    push eax
    push 010118DF8h
    push dword ptr [esi + 000000100h]
    mov ecx, esi
    mov dword ptr [ebp - 8], ebx
    call sub_100B9A42
L0:
    test eax, eax
    jne L9
    and dword ptr [ebp - 4], eax
    test edi, edi
    jbe L2
L1:
    mov eax, dword ptr [ebp - 4]
    shl eax, 2
    mov edx, dword ptr [ebp + eax - 0000000B8h]
    mov ecx, dword ptr [ebp + eax - 0000000A8h]
    cmp edx, ecx
    jne L3
    cmp ecx, dword ptr [ebp + eax - 000000098h]
    jne L3
    cmp edx, dword ptr [ebp + eax - 000000088h]
    jne L3
    inc dword ptr [ebp - 4]
    cmp dword ptr [ebp - 4], edi
    jb L1
L2:
    mov edx, dword ptr [esi + 000000100h]
    mov ecx, edi
    xor eax, eax
    and ecx, 0000FFFFFh
    cmp dword ptr [ebp - 8], eax
    je L4
    or ecx, 073700000h
    jmp L5
L3:
    mov eax, ebx
    jmp L9
L4:
    or ecx, 073800000h
L5:
    push ecx
    fldz
    push ecx
    fstp qword ptr [esp]
    push eax
    mov dword ptr [edx], ecx
    push eax
    push dword ptr [esi + 120]
    mov ecx, esi
    call sub_10086249
    cmp eax, -1
    mov dword ptr [ebp - 8], eax
    jne L6
    mov eax, 08007000Eh
    jmp L9
L6:
    xor ecx, ecx
    test edi, edi
    jbe L8
    mov eax, edi
    shl eax, 2
    mov dword ptr [ebp - 4], eax
L7:
    mov eax, dword ptr [esi + 000000100h]
    mov eax, dword ptr [eax + 8]
    mov edx, dword ptr [ebp + ecx*4 - 0000000B8h]
    mov ebx, dword ptr [ebp - 4]
    add dword ptr [ebp - 4], 4
    mov dword ptr [eax + ecx*4], edx
    mov eax, dword ptr [esi + 000000100h]
    mov eax, dword ptr [eax + 8]
    mov edx, dword ptr [ebp - 8]
    inc ecx
    cmp ecx, edi
    mov dword ptr [ebx + eax], edx
    jb L7
L8:
    xor eax, eax
L9:
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_100becfb ENDP
END
