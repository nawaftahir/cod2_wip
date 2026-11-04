.686
.MODEL FLAT, C
EXTRN sub_100674D9:PROC
EXTRN sub_10067789:PROC
EXTRN sub_100F62E8:PROC
EXTRN sub_100F793F:PROC
EXTRN sub_100F7966:PROC
EXTRN sub_100F798C:PROC
EXTRN sub_100F883F:PROC
.CODE
FUN_10067d05 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, 00000100Ch
    call sub_100F883F
    mov ecx, dword ptr [ebp + 8]
    push esi
    push edi
    lea eax, [ebp - 4]
    push eax
    push dword ptr [ebp + 16]
    lea esi, [ebp - 00000100Ch]
    mov edi, 000000FFEh
    call sub_100674D9
    test eax, eax
    jl L12
    mov ecx, dword ptr [ebp - 4]
    mov edx, dword ptr [ebp + 8]
    mov eax, dword ptr [edx + 28]
    shl ecx, 2
    mov eax, dword ptr [ecx + eax]
    mov dword ptr [ebp - 12], eax
    and eax, 15
    cmp eax, 15
    jne L0
    add edx, 8
    mov dword ptr [ebp - 8], 01010C714h
    mov dword ptr [ebp - 4], edx
    jmp L2
L0:
    mov edx, dword ptr [ebp + 8]
    add edx, 12
    mov dword ptr [ebp - 4], edx
    mov edx, dword ptr [ebp + 8]
    mov edx, dword ptr [edx + 16]
    test edx, edx
    mov dword ptr [ebp - 8], 01010C75Ch
    je L11
    test eax, eax
    je L11
    cmp edx, eax
    jb L11
    test byte ptr [ebp - 12], 16
    je L1
    test byte ptr [ebp - 12], 32
    jne L11
L1:
    mov eax, dword ptr [ebp + 8]
    mov eax, dword ptr [eax + 28]
    add eax, ecx
    or dword ptr [eax], 32
L2:
    push ebx
    mov ebx, dword ptr [ebp + 12]
    test ebx, ebx
    je L7
    mov eax, dword ptr [ebx + 16]
    test eax, eax
    je L4
    push eax
    push 010193358h
    lea eax, [ebp - 00000100Ch]
    push edi
    push eax
    call sub_100F793F
    add esp, 16
    test eax, eax
    jge L3
    mov eax, edi
L3:
    lea esi, [ebp + eax - 00000100Ch]
    sub edi, eax
L4:
    mov eax, dword ptr [ebx + 20]
    test eax, eax
    jne L5
    inc eax
L5:
    push eax
    push 01010CA14h
    push edi
    push esi
    call sub_100F7966
    add esp, 16
    test eax, eax
    jge L6
    mov eax, edi
L6:
    add esi, eax
    sub edi, eax
L7:
    cmp dword ptr [ebp + 16], 0
    pop ebx
    je L9
    push dword ptr [ebp + 16]
    push dword ptr [ebp - 8]
    push 01010CA1Ch
    push edi
    push esi
    call sub_100F798C
    add esp, 20
    test eax, eax
    jge L8
    mov eax, edi
L8:
    add esi, eax
    sub edi, eax
L9:
    lea eax, [ebp + 24]
    push eax
    push dword ptr [ebp + 20]
    push edi
    push esi
    call sub_100F62E8
    add esp, 16
    test eax, eax
    jge L10
    mov eax, edi
L10:
    mov ecx, dword ptr [ebp + 8]
    add esi, eax
    mov eax, dword ptr [ebp - 4]
    mov byte ptr [esi], 10
    mov byte ptr [esi + 1], 0
    inc dword ptr [eax]
    lea eax, [ebp - 00000100Ch]
    push eax
    call sub_10067789
    jmp L12
L11:
    xor eax, eax
L12:
    pop edi
    pop esi
    leave
    ret
FUN_10067d05 ENDP
END
