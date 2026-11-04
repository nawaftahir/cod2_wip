.686
.MODEL FLAT, C
EXTRN sub_100C9BB3:PROC
EXTRN sub_100CB29E:PROC
.CODE
FUN_100cb636 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 12
    mov eax, dword ptr [ecx + 000000100h]
    mov edx, dword ptr [eax + 16]
    mov edx, dword ptr [edx]
    push esi
    mov esi, dword ptr [ecx + 20]
    mov edx, dword ptr [esi + edx*4]
    mov esi, dword ptr [ecx + 00000008Ch]
    cmp esi, dword ptr [edx + 4]
    jne L0
    push 0
    push 46
    call sub_100CB29E
    jmp L10
L0:
    test byte ptr [ecx + 110], 16
    push ebx
    push edi
    jne L5
    mov eax, dword ptr [eax + 12]
    and dword ptr [ebp - 4], 0
    test eax, eax
    mov dword ptr [ebp - 8], eax
    jbe L4
    mov eax, dword ptr [ecx + 000000100h]
    mov edx, dword ptr [eax + 16]
    mov eax, dword ptr [eax + 8]
    mov esi, dword ptr [ecx + 20]
    sub eax, edx
    mov edi, edx
    mov dword ptr [ebp - 12], eax
    jmp L2
L1:
    mov eax, dword ptr [ebp - 12]
L2:
    mov eax, dword ptr [eax + edi]
    mov edx, dword ptr [esi + eax*4]
    mov eax, dword ptr [edi]
    mov eax, dword ptr [esi + eax*4]
    mov ebx, dword ptr [eax + 4]
    cmp ebx, dword ptr [edx + 4]
    jne L4
    mov ebx, dword ptr [eax + 8]
    cmp ebx, dword ptr [edx + 8]
    jne L4
    mov ebx, dword ptr [eax + 12]
    cmp ebx, dword ptr [edx + 12]
    jne L4
    mov ebx, dword ptr [eax + 16]
    cmp ebx, dword ptr [edx + 16]
    jne L4
    mov ebx, dword ptr [eax + 60]
    cmp ebx, dword ptr [edx + 60]
    jne L4
    test byte ptr [ecx + 0000000CCh], 4
    je L3
    cmp dword ptr [eax + 96], 0
    jne L4
L3:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    add edi, 4
    cmp eax, dword ptr [ebp - 8]
    jb L1
L4:
    mov eax, dword ptr [ebp - 8]
    cmp dword ptr [ebp - 4], eax
    jne L5
    xor eax, eax
    jmp L9
L5:
    mov eax, dword ptr [ecx + 000000100h]
    and dword ptr [ebp - 4], 0
    cmp dword ptr [eax + 12], 0
    jbe L8
    mov edi, 00E000000h
L6:
    mov eax, dword ptr [ecx + 000000100h]
    mov esi, dword ptr [eax + 16]
    mov ebx, dword ptr [ebp - 4]
    mov edx, dword ptr [ecx + 20]
    mov esi, dword ptr [esi + ebx*4]
    mov esi, dword ptr [edx + esi*4]
    test dword ptr [esi], edi
    jne L7
    mov eax, dword ptr [eax + 8]
    mov eax, dword ptr [eax + ebx*4]
    mov eax, dword ptr [edx + eax*4]
    mov eax, dword ptr [eax]
    and eax, edi
    or eax, dword ptr [esi]
    mov dword ptr [esi], eax
L7:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ecx + 000000100h]
    mov edx, dword ptr [ebp - 4]
    cmp edx, dword ptr [eax + 12]
    jb L6
L8:
    mov eax, dword ptr [ecx + 000000100h]
    mov edx, dword ptr [eax + 12]
    xor esi, esi
    push esi
    push esi
    push esi
    push esi
    push edx
    push esi
    push esi
    push dword ptr [eax + 8]
    push edx
    push dword ptr [eax + 16]
    push 1
    call sub_100C9BB3
L9:
    pop edi
    pop ebx
L10:
    pop esi
    leave
    ret
FUN_100cb636 ENDP
END
