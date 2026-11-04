.686
.MODEL FLAT, C
EXTRN sub_10085402:PROC
EXTRN sub_10085413:PROC
EXTRN sub_10085424:PROC
EXTRN sub_100C9B51:PROC
.CODE
FUN_100cb270 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 32
    push ebx
    push esi
    mov esi, ecx
    mov ecx, dword ptr [esi + 000000100h]
    mov eax, dword ptr [ecx + 12]
    mov dword ptr [ebp - 16], eax
    mov eax, dword ptr [ecx + 16]
    push edi
    mov edi, dword ptr [ecx]
    mov dword ptr [ebp - 20], eax
    lea eax, [ebp - 32]
    push eax
    xor ebx, ebx
    push ebx
    and edi, 0000FFFFFh
    call sub_10085402
    mov ecx, dword ptr [esi + 000000100h]
    lea eax, [ebp - 28]
    push eax
    push 1
    call sub_10085413
    mov ecx, dword ptr [esi + 000000100h]
    lea eax, [ebp - 24]
    push eax
    push 2
    call sub_10085424
    cmp dword ptr [ebp + 12], ebx
    mov dword ptr [ebp - 12], ebx
    je L4
    mov dword ptr [ebp + 12], ebx
L0:
    cmp dword ptr [ebp - 12], ebx
    jne L4
    mov eax, dword ptr [ebp + 12]
    mov edx, dword ptr [ebp + eax*4 - 32]
    cmp edx, ebx
    je L3
    cmp edi, ebx
    mov dword ptr [ebp - 8], ebx
    jbe L3
    mov eax, dword ptr [esi + 20]
    xor ecx, ecx
    mov dword ptr [ebp - 4], edx
L1:
    mov edx, dword ptr [ebp - 4]
    mov edx, dword ptr [edx]
    mov edx, dword ptr [eax + edx*4]
    test byte ptr [ecx + edx + 3], 1
    jne L2
    inc dword ptr [ebp - 8]
    add dword ptr [ebp - 4], 4
    add ecx, 000000080h
    cmp dword ptr [ebp - 8], edi
    jb L1
    jmp L3
L2:
    mov dword ptr [ebp - 12], 1
L3:
    inc dword ptr [ebp + 12]
    cmp dword ptr [ebp + 12], 3
    jb L0
L4:
    push dword ptr [ebp - 12]
    mov ecx, esi
    push ebx
    push ebx
    push ebx
    push edi
    push dword ptr [ebp - 24]
    push dword ptr [ebp - 28]
    push dword ptr [ebp - 32]
    push dword ptr [ebp - 16]
    push dword ptr [ebp - 20]
    push dword ptr [ebp + 8]
    call sub_100C9B51
    pop edi
    pop esi
    pop ebx
    leave
    ret 8
FUN_100cb270 ENDP
END
