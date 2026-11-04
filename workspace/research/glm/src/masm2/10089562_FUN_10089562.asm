.686
.MODEL FLAT, C
EXTRN sub_100854C7:PROC
EXTRN sub_10089709:PROC
EXTRN sub_10089724:PROC
EXTRN sub_1008972A:PROC
EXTRN sub_100897F1:PROC
EXTRN sub_100897FB:PROC
EXTRN sub_10089816:PROC
EXTRN sub_1008981E:PROC
EXTRN sub_10089826:PROC
EXTRN sub_1008982E:PROC
EXTRN sub_10089836:PROC
EXTRN sub_1008983C:PROC
EXTRN sub_10089842:PROC
.CODE
FUN_10089562 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 24
    push push esi
    mov mov esi, ecx
    xor xor ecx, ecx
    xor xor eax, eax
    cmp cmp dword ptr [esi + 8], ecx
    mov mov dword ptr [ebp - 24], ecx
    jbe L0
    mov mov edx, dword ptr [esi + 20]
    mov mov edx, dword ptr [edx + eax*4]
    or or dword ptr [edx + 48], -1
    inc inc eax
    cmp cmp eax, dword ptr [esi + 8]
    jb L0
    cmp cmp dword ptr [esi + 12], ecx
    mov mov dword ptr [ebp - 16], ecx
    jbe sub_10089724
    push push ebx
    push push edi
    mov mov eax, dword ptr [esi + 24]
    mov mov ecx, dword ptr [ebp - 16]
    mov mov ebx, dword ptr [eax + ecx*4]
L0:
    test test word ptr [ebx + 2], 0FFF0h
    je sub_1008972A
    and and dword ptr [ebp - 20], 0
    lea lea eax, [ebp - 12]
    push push eax
    push push 0
    jmp L4
    mov mov eax, dword ptr [ebp - 12]
    mov mov edx, dword ptr [eax]
    mov mov eax, dword ptr [esi + 20]
    shl shl edx, 2
    mov mov eax, dword ptr [edx + eax]
    cmp cmp dword ptr [eax + 48], -1
    je L5
    xor xor eax, eax
    inc inc eax
    cmp cmp dword ptr [ebp - 4], eax
    mov mov dword ptr [ebp - 8], eax
    jbe L2
    mov mov eax, dword ptr [ebp - 12]
    mov mov ecx, dword ptr [ebp - 8]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [esi + 20]
    shl shl ecx, 2
    mov mov eax, dword ptr [ecx + eax]
    cmp cmp dword ptr [eax + 48], -1
    je L3
    mov mov edi, dword ptr [esi + 20]
    mov mov eax, dword ptr [edi + ecx]
    mov mov ecx, dword ptr [edi + edx]
    mov mov ecx, dword ptr [ecx + 48]
    mov mov eax, dword ptr [eax + 48]
    mov mov ecx, dword ptr [edi + ecx*4]
    mov mov eax, dword ptr [edi + eax*4]
    mov mov ecx, dword ptr [ecx + 12]
    cmp cmp ecx, dword ptr [eax + 12]
    jne L7
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [ebp - 4]
    jb L1
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [ebp - 4]
    jb sub_10089709
    xor xor ecx, ecx
    cmp cmp dword ptr [ebp - 4], ecx
    jbe sub_10089709
    mov mov eax, dword ptr [ebp - 12]
    mov mov edi, dword ptr [esi + 20]
    lea lea eax, [eax + ecx*4]
    mov mov edx, dword ptr [eax]
    mov mov edx, dword ptr [edi + edx*4]
    mov mov edx, dword ptr [edx + 48]
    inc inc ecx
    cmp cmp ecx, dword ptr [ebp - 4]
    mov mov dword ptr [eax], edx
    jb sub_10089709
    mov mov dword ptr [ebp - 24], 1
    inc inc dword ptr [ebp - 20]
    lea lea eax, [ebp - 12]
    push push eax
    push push dword ptr [ebp - 20]
    mov mov ecx, ebx
    call sub_100854C7
    test test eax, eax
    mov mov dword ptr [ebp - 4], eax
    jne L6
    mov mov eax, dword ptr [ebx]
    and and eax, 0FFF00000h
    cmp cmp eax, 010000000h
    jne sub_100897F1
    and and dword ptr [ebp - 8], 0
    cmp cmp dword ptr [ebx + 12], 0
    jbe sub_100897FB
    mov mov edx, dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebx + 16]
    mov mov edi, dword ptr [ebx + 8]
    shl shl edx, 2
    mov mov ecx, dword ptr [edx + eax]
    mov mov eax, dword ptr [esi + 20]
    mov mov edx, dword ptr [edx + edi]
L1:
    mov mov dword ptr [ebp - 20], ecx
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov edx, dword ptr [ecx + 4]
    cmp cmp edx, dword ptr [eax + 4]
    jne sub_10089816
    mov mov edx, dword ptr [ecx + 8]
    cmp cmp edx, dword ptr [eax + 8]
    jne sub_1008981E
    mov mov edx, dword ptr [ecx + 16]
    cmp cmp edx, dword ptr [eax + 16]
    jne sub_10089826
    mov mov edx, dword ptr [ecx + 20]
L5:
    cmp cmp edx, dword ptr [eax + 20]
    jne sub_1008982E
    mov mov edx, dword ptr [ecx + 24]
L6:
    cmp cmp edx, dword ptr [eax + 24]
    jne sub_10089836
    cmp cmp dword ptr [eax + 56], -1
L7:
    jne sub_1008983C
    cmp cmp dword ptr [ecx + 60], 0
    jne sub_10089842
    mov mov ecx, dword ptr [ebp - 20]
    mov mov dword ptr [eax + 48], ecx
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [ebx + 12]
    jb sub_100897FB
    inc inc dword ptr [ebp - 16]
    mov mov eax, dword ptr [ebp - 16]
    cmp cmp eax, dword ptr [esi + 12]
    jb sub_10089724
    pop pop edi
    pop pop ebx
    xor xor eax, eax
    cmp cmp dword ptr [ebp - 24], eax
    pop pop esi
    sete sete al
    leave leave
    ret ret
FUN_10089562 ENDP
END
